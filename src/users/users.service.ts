import { Injectable } from '@nestjs/common';
import { Prisma, User } from '@prisma/client';
import { PrismaService } from '../database/PrismaServiceDatabase';
import { IService } from 'src/shared/service.interface';

@Injectable()
export class UsersService implements IService<User> {
  constructor(private readonly prisma: PrismaService) {}
  async create(data: User) {
    const users = await this.prisma.user.create({ data });
    return users;
  }
  async findAll() {
    const users = await this.prisma.user.findMany();
    return users;
  }
  async findOne(id: number) {
    const user = await this.prisma.user.findFirst({
      where: { id },
    });
    return user;
  }
  async update(data: Prisma.UserUpdateInput & { id: number }) {
    return this.prisma.user.update({
      where: { id: data.id },
      data,
    });
  }
  async remove(id: number) {
    return await this.prisma.user.delete({
      where: {
        id,
      },
    });
  }

  async switchActiveStatus(id: number, newStatus: boolean) {
    return await this.prisma.user.update({
      where: {
        id,
      },
      data: {
        isActive: newStatus,
      },
    });
  }
}
