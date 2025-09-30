import { User } from "./user.model";

export interface LoginRequest{
    email: string; 
    password: string;
}

export interface AuthResponse{
    token: string,
    user: User,
    expiresIn: number;
}

export interface ForgotPasswordRequest{
    email: string;
}



