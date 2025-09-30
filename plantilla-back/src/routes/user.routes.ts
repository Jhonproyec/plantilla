import { userController } from '@/controllers/userController';
import { authenticateToken } from '@/middleware/authMiddleware';
import { Router } from 'express';

export const userRoutes = Router();

userRoutes.get('/profile', authenticateToken, userController.getProfile);
userRoutes.put('/profile', userController.updateProfile);
userRoutes.get('/', userController.getAllUsers);
userRoutes.get('/:userId', authenticateToken, userController.getUserById);
userRoutes.delete('/',  userController.deleteUser);
