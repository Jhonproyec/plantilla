export interface User{
    idUser: number;
    userName: string;
    email: string; 
    firstName:  string;
    lastName: string;
    role: string;
    avatar?: string;
    isActive: boolean;
}

export interface CreateUserRequest{
    userId?: string | null;
    userName: string;
    email: string;
    firstName: string;
    lastName: string; 
    password: string;
    role: string;
}