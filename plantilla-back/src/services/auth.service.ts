import jwt, { SignOptions } from 'jsonwebtoken';
import { prisma } from '@/config/database';
import { logger } from '@/config/logger';
import {
  AuthTokensInterface,
  LoginUserDataInterface,
  RegisterUserDataInterface,
  UserPayloadInterface,
} from '@/interface/authInterface';
import { ConflictError, UnauthorizedError } from '@/utils/appError';
import bcrypt from 'bcryptjs';

class AuthService {
  private readonly jwtSecret: string;
  private readonly jwtRefreshSecret: string;
  private readonly jwtExpiresIn: string;
  private readonly jwtRefreshExpiresIn: string;
  private readonly saltRounds: number;

  constructor() {
    this.jwtSecret = process.env.JWT_SECRET!;
    this.jwtRefreshSecret = process.env.JWT_REFRESH_SECRET!;
    this.jwtExpiresIn = process.env.JWT_EXPIRES_IN!;
    this.jwtRefreshExpiresIn = process.env.JWT_REFRESH_EXPIRES_IN!;
    this.saltRounds = parseInt(process.env.BCRYPT_SALT_ROUNDS!);
  }

  async register(userData: RegisterUserDataInterface): Promise<{ user: UserPayloadInterface }> {
    try {
      // Verificar si ya existe el usuario
      const existingUser = await prisma.user.findUnique({
        where: { email: userData.email },
      });
      if (existingUser) {
        throw new ConflictError('El correo ingresado ya existe');
      }

      //Hash de la contraseña
      const hashedPassword = await bcrypt.hash(userData.password, this.saltRounds);

      const user = await prisma.user.create({
        data: {
          email: userData.email,
          password: hashedPassword,
          firstName: userData.firstName,
          lastName: userData.lastName,
          role: userData.role,
          isActive: true,
        },
        select: {
          idUser: true,
          email: true,
          firstName: true,
          lastName: true,
          role: true,
          isActive: true,
          createdAt: true,
        },
      });

      logger.info('Usuario registrado: ', user.email);
      return { user };
    } catch (error) {
      logger.error('Error en el registro de usuario: ', error);
      throw error;
    }
  }

  async login(
    loginData: LoginUserDataInterface
  ): Promise<{ user: UserPayloadInterface; tokens: AuthTokensInterface }> {
    try {
      const user = await prisma.user.findUnique({
        where: { email: loginData.email },
        select: {
          idUser: true,
          email: true,
          password: true,
          firstName: true,
          lastName: true,
          role: true,
          isActive: true,
        },
      });
      if (!user) {
        throw new UnauthorizedError('Correo o contraseña incorrecto');
      }
      if (!user.isActive) {
        throw new UnauthorizedError('La cuenta está desactivada');
      }

      const isPasswordValid = await bcrypt.compare(loginData.password, user.password);
      if (!isPasswordValid) {
        throw new UnauthorizedError('Correo o contraseña incorrecto');
      }

      const tokens = await this.generateTokens(user.idUser, user.email, user.role);

      await prisma.user.update({
        where: { idUser: user.idUser },
        data: { lastLogin: new Date() },
      });

      logger.info('Inicio de sesión correcto: ', user.email);

      const { password, ...userWithoutPassword } = user;
      return { user: userWithoutPassword, tokens };
    } catch (error) {
      logger.error('Error al iniciar sesión: ', error);
      throw error;
    }
  }

  private async generateTokens(
    userId: number,
    email: string,
    role: string
  ): Promise<AuthTokensInterface> {
    const payload = { userId, email, role };

    const accessToken = jwt.sign(
      payload,
      this.jwtSecret as jwt.Secret,
      { expiresIn: this.jwtExpiresIn } as SignOptions
    );

    const refreshToken = jwt.sign(
      { userId },
      this.jwtRefreshSecret as jwt.Secret,
      { expiresIn: this.jwtRefreshExpiresIn } as SignOptions
    );

    return {
      accessToken,
      refreshToken,
    };
  }

  async verifyToken(token: string): Promise<any> {
    try {
      return jwt.verify(token, this.jwtSecret);
    } catch (error) {
      throw new UnauthorizedError('Token Inválido');
    }
  }
}

export const authService = new AuthService();
