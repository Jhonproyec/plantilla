import { AuthenticatedRequestInterface } from '@/interface/authInterface';
import { userService } from '@/services/user.service';
import { Request, Response, NextFunction } from 'express';

class UserController {
  async getProfile(
    req: AuthenticatedRequestInterface,
    res: Response,
    next: NextFunction
  ): Promise<void> {
    try {
      if (!req.user) {
        res.status(401).json({
          success: false,
          error: {
            message: 'Autenticación requerida',
            statusCode: 401,
          },
        });
        throw new Error('Autenticación requerida');
      }

      const user = await userService.getUserProfile(req.user.id);

      res.status(200).json({
        success: true,
        message: 'Perfil de usuario',
        data: { user },
      });
    } catch (error) {
      next(error);
    }
  }

  async updateProfile(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<void> {
    try {
      // if (!req.user) {
      //   res.status(401).json({
      //     success: false,
      //     error: {
      //       message: 'Autenticación requerida',
      //       statusCode: 401,
      //     },
      //   });
      //   throw new Error('Autenticación requerida');
      // }
      const { firstName, lastName, email, role } = req.body;

      const updateUser = await userService.updateUserProfile(req.body.userId, {
        firstName,
        lastName,
        email,
        role
      });

      res.status(200).json({
        success: true,
        message: 'Usuario editado correcetamente',
        data: { user: updateUser},
      });
    } catch (error) {
      next(error);
    }
  }

  async getUserById(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const { userId } = req.params;

      const user = await userService.getUserById(Number(userId));

      if (!user) {
        res.status(404).json({
          success: false,
          error: {
            message: 'Usuario no encontrado',
            statusCode: 404,
          },
        });

        throw new Error('Usuario no encontrado');
      }

      res.status(200).json({
        success: true,
        message: 'User retrieved successfully',
        data: { user },
      });
    } catch (error) {
      next(error);
    }
  }

  async getAllUsers(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const page = parseInt(req.query.page as string) || 1;
      const limit = parseInt(req.query.limit as string) || 10;

      const result = await userService.getAllUsers(page, limit);

      res.status(200).json({
        success: true,
        message: 'Usuarios Enviados',
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }

  async deleteUser(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const { userId } = req.query;

      await userService.deleteUser(Number(userId));

      res.status(200).json({
        success: true,
        message: 'User deleted successfully',
      });
    } catch (error) {
      next(error);
    }
  }
}

export const userController = new UserController();
