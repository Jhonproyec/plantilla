import { authController } from '@/controllers/authController';
import { authenticateToken } from '@/middleware/authMiddleware';
import { validate } from '@/middleware/validationMiddleware';
import { loginSchema, registerSchema } from '@/schemas/validation.schemas';
import { Router } from 'express';

export const authRouter = Router();

authRouter.post('/register', validate(registerSchema), authController.register);
authRouter.post('/login', validate(loginSchema), authController.login);
authRouter.post('/verify', authController.verifyToken);
authRouter.get('/profile', authenticateToken, authController.getProfile);
