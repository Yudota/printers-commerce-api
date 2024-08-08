import { User } from '@prisma/client';

export type UserUpdateInput = Partial<Omit<User, 'id'>> & { id: number };
export enum UserRole {
  ADMIN = 'ADMIN',
  CUSTOMER = 'CUSTOMER',
}
