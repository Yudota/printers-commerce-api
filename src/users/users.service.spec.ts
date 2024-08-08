// src/users/users.service.spec.ts

import { TestingModule, Test } from '@nestjs/testing';
import { Prisma, User, UserRole } from '@prisma/client';
import { UsersService } from './users.service';
import { PrismaService } from '../database/PrismaServiceDatabase';

// const mockPrismaService = {
//   user: {
//     create: jest.fn(),
//     findMany: jest.fn(),
//     findFirst: jest.fn(),
//     update: jest.fn(),
//     delete: jest.fn(),
//   },
// };

describe('UsersService', () => {
  let service: UsersService;
  let prismaService: PrismaService;

  const user: User = {
    id: 1,
    email: 'test@example.com',
    name: 'Test User',
    password: 'password',
    gender: '',
    birthDate: undefined,
    cpf: '',
    role: UserRole.CUSTOMER,
    ranking: 0,
  };
  const mockPrismaClientService = {
    user: {
      create: jest.fn(),
      findMany: jest.fn(),
      findFirst: jest.fn(),
      update: jest.fn(),
      delete: jest.fn(),
    },
  };
  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [UsersService, PrismaService],
    })
      .overrideProvider(PrismaService)
      .useValue(mockPrismaClientService)
      .compile();

    service = module.get<UsersService>(UsersService);
    prismaService = module.get<PrismaService>(PrismaService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  describe('create', () => {
    it('should create a new user', async () => {
      jest.spyOn(prismaService.user, 'create').mockResolvedValueOnce(user);
      expect(await service.create(user)).toEqual(user);
      expect(prismaService.user.create).toHaveBeenCalledWith({ data: user });
    });
  });

  describe('findAll', () => {
    it('should return an array of users', async () => {
      const users: User[] = [user];
      jest.spyOn(prismaService.user, 'findMany').mockResolvedValueOnce(users);
      expect(await service.findAll()).toEqual(users);
      expect(prismaService.user.findMany).toHaveBeenCalled();
    });
  });

  describe('findOne', () => {
    it('should return a single user', async () => {
      jest.spyOn(prismaService.user, 'findFirst').mockResolvedValueOnce(user);
      expect(await service.findOne(1)).toEqual(user);
      expect(prismaService.user.findFirst).toHaveBeenCalledWith({
        where: { id: 1 },
      });
    });
  });

  describe('update', () => {
    it('should update a user', async () => {
      const user: Prisma.UserUpdateInput & { id: number } = {
        id: 1,
        email: 'updated@example.com',
      };
      const updatedUser = {
        id: 1,
        gender: 'Male',
        name: 'Test User',
        birthDate: new Date(),
        cpf: '12345678901',
        email: 'updated@example.com',
        password: 'password',
        role: UserRole.CUSTOMER,
        ranking: 0,
        createdAt: new Date(),
        updatedAt: new Date(),
      };
      jest
        .spyOn(prismaService.user, 'update')
        .mockResolvedValueOnce(updatedUser);
      expect(await service.update(user)).toEqual(updatedUser);
      expect(prismaService.user.update).toHaveBeenCalledWith({
        where: { id: user.id },
        data: { ...user },
      });
    });
  });

  describe('remove', () => {
    it('should remove a user', async () => {
      jest.spyOn(prismaService.user, 'delete').mockResolvedValueOnce(user);
      expect(await service.remove(1)).toEqual(user);
      expect(prismaService.user.delete).toHaveBeenCalledWith({
        where: { id: 1 },
      });
    });
  });
});
