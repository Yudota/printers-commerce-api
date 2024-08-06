import { Injectable } from '@nestjs/common';
import { User } from '@prisma/client';
import { PrismaService } from 'src/database/PrismaServiceDatabase';

@Injectable()
export class UsersService {
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
  async update(user: Partial<User>) {
    return await this.prisma.user.update({
      where: {
        id: user.id,
      },
      data: {
        ...user,
      },
    });
  }
  async remove(id: number) {
    return await this.prisma.user.delete({
      where: {
        id,
      },
    });
  }
}
