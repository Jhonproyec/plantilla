import { prisma } from '@/config/database';
import { logger } from '@/config/logger';
import { UpdateUserDataInterface, UserProfileInterface } from '@/interface/userInterface';
import { ConflictError, NotFoundError } from '@/utils/appError';

class UserService {
  async getUserProfile(userId: number): Promise<UserProfileInterface> {
    try {
      const user = await prisma.user.findUnique({
        where: { idUser: userId },
        select: {
          idUser: true,
          email: true,
          firstName: true,
          lastName: true,
          role: true,
          isActive: true,
          createdAt: true,
          updatedAt: true,
          lastLogin: true,
        },
      });

      if (!user) {
        throw new NotFoundError('Usuario no encontrado');
      }

      return this.setUser(user);
    } catch (error) {
      logger.error('Error al editar el usuario: ', error);
      throw error;
    }
  }

  async updateUserProfile(
    userId: number,
    updateData: UpdateUserDataInterface
  ): Promise<UserProfileInterface> {
    try {
      if (updateData.email) {
        const existingUser = await prisma.user.findFirst({
          where: {
            email: updateData.email,
            idUser: { not: userId },
          },
        });

        if (existingUser) {
          throw new ConflictError('El correo ingresado ya existe');
        }
      }
      const updateUser = await prisma.user.update({
        where: { idUser: userId },
        data: {
          ...updateData,
          updatedAt: new Date(),
        },
        select: {
          idUser: true,
          email: true,
          firstName: true,
          lastName: true,
          role: true,
          isActive: true,
          createdAt: true,
          updatedAt: true,
          lastLogin: true,
        },
      });
      logger.info('Usuario editado: ', updateData.email);
      return this.setUser(updateUser);
    } catch (error) {
      logger.error('Error al editar el usuario: ', error);
      throw error;
    }
  }

  async getUserById(userId: number): Promise<UserProfileInterface> {
    try {
      const user = await prisma.user.findUnique({
        where: { idUser: userId },
        select: {
          idUser: true,
          email: true,
          firstName: true,
          lastName: true,
          role: true,
          isActive: true,
          createdAt: true,
          updatedAt: true,
          lastLogin: true,
        },
      });
      return this.setUser(user);
    } catch (error) {
      logger.error('Error al obtener el usuerio: ', error);
      throw error;
    }
  }

  async getUserByEmail(email: string): Promise<UserProfileInterface | null> {
    try {
      const user = await prisma.user.findUnique({
        where: { email },
        select: {
          idUser: true,
          email: true,
          firstName: true,
          lastName: true,
          role: true,
          isActive: true,
          createdAt: true,
          updatedAt: true,
          lastLogin: true,
        },
      });

      return this.setUser(user);
    } catch (error) {
      logger.error('Error al obtener el usuario por email:', error);
      throw error;
    }
  }

  async getAllUsers(
    page: number = 1,
    limit: number = 10
  ): Promise<{
    users: UserProfileInterface[];
    total: number;
    page: number;
    totalPages: number;
  }> {
    try {
      const skip = (page - 1) * limit;

      const [users, total] = await Promise.all([
        prisma.user.findMany({
          skip,
          take: limit,
          select: {
            idUser: true,
            email: true,
            firstName: true,
            lastName: true,
            role: true,
            isActive: true,
            createdAt: true,
            updatedAt: true,
            lastLogin: true,
          },
          orderBy: {
            createdAt: 'desc',
          },
        }),
        prisma.user.count(),
      ]);
      const totalPages = Math.ceil(total / limit);

      return {
        users,
        total,
        page,
        totalPages,
      };
    } catch (error) {
      logger.error('Error al obtener los usuarios: ', error);
      throw error;
    }
  }
  async deleteUser(userId: number): Promise<void> {
    try {
      const user = await prisma.user.findUnique({
        where: { idUser: userId },
      });

      if (!user) {
        throw new NotFoundError('User not found');
      }

      // Eliminar usuario
      await prisma.user.delete({
        where: { idUser: userId },
      });

      logger.info(`User deleted: ${user.email}`);
    } catch (error) {
      logger.error('Error deleting user:', error);
      throw error;
    }
  }

  setUser = (user: any): UserProfileInterface => {
    const dataUser: UserProfileInterface = {
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      idUser: user.idUser,
      isActive: user.isActive,
      role: user.role,
    };
    return dataUser;
  };
}

export const userService = new UserService();
