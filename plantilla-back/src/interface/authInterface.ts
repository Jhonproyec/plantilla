import { Request } from 'express';
export interface AuthenticatedRequestInterface extends Request {
  user?: {
    id: number;
    email: string;
    role?: string | undefined;
  };
}

export interface JWTPayloadInterface {
  userId: number;
  email: string;
  role?: string;
  iat?: string;
  exp?: number;
}

export interface RegisterUserDataInterface {
  email: string;
  password: string;
  firstName: string;
  lastName: string;
  role: 'ADMIN' | 'SELLER';
}

export interface LoginUserDataInterface {
  email: string;
  password: string;
}

export interface AuthTokensInterface {
  accessToken: string;
  refreshToken: string;
}

export interface UserPayloadInterface {
  idUser: number;
  email: string;
  firstName: string;
  lastName: string;
  role?: string | undefined;
  isActive: boolean;
}
