import { Prisma } from '@prisma/client';

export type UserUpdateInput = Prisma.UserUpdateInput & { id: number };
export enum UserRole {
  ADMIN = 'ADMIN',
  CUSTOMER = 'CUSTOMER',
}
