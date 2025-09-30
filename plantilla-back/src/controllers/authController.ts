import { AuthenticatedRequestInterface } from '@/interface/authInterface';
import { authService } from '@/services/auth.service';
import { Request, Response, NextFunction } from 'express';

class AuthController {
  async register(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      console.log(req.body);
      const { email, password, firstName, lastName, role } = req.body;
      const result = await authService.register({
        email,
        password,
        firstName,
        lastName,
        role,
      });
      res.status(201).json({
        success: true,
        message: 'Usuario registrado exitósamente',
        data: { user: result.user },
      });
    } catch (error) {
      next(error);
    }
  }

  async login(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const { email, password } = req.body;
      console.log(req.body);
      const result = await authService.login({ email, password });

      res.status(200).json({
        success: true,
        messasge: 'Inicio de sesión correcto',
        data: {
          user: result.user,
          tokens: result.tokens,
        },
      });
    } catch (error) {
      next(error);
    }
  }

  async verifyToken(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const authHeader = req.headers.authorization;
      const token = authHeader && authHeader.startsWith('Bearer ') ? authHeader.substring(7) : null;

      if (!token) {
        res.status(400).json({
          success: false,
          error: {
            message: 'Token is required',
            statusCode: 400,
          },
        });
        throw new Error('Error al verificar el token');
      }

      const decoded = await authService.verifyToken(token);

      res.status(200).json({
        success: true,
        message: 'Token is valid',
        data: {
          valid: true,
          decoded: {
            userId: decoded.userId,
            email: decoded.email,
            role: decoded.role,
            exp: decoded.exp,
            iat: decoded.iat,
          },
        },
      });
    } catch (error) {
      next(error);
    }
  }

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
            message: 'Authentication required',
            statusCode: 401,
          },
        });

        throw new Error('Error al autenticación');
      }

      res.status(200).json({
        success: true,
        message: 'Profile retrieved successfully',
        data: {
          user: req.user,
        },
      });
    } catch (error) {
      next(error);
    }
  }
}

export const authController = new AuthController();
