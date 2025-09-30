export interface UpdateUserDataInterface {
  firstName?: string;
  lastName?: string;
  email?: string;
  role?: 'ADMIN' | 'SELLER';
}

export interface UserProfileInterface {
  idUser: number;
  email: string;
  firstName: string;
  lastName: string;
  role: string;
  isActive: boolean;
  createdAt?: Date | null;
  updatedat?: Date | null;
  lastLogin?: Date | null;
}
