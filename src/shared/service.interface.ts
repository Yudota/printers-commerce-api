import Entity from './entity.interface';

export interface IService<T extends Entity> {
  create(data: T): Promise<T>;
  findAll(): Promise<T[]>;
  findOne(id: number): Promise<T | null>;
  update(data: Partial<T> & { id: number }): Promise<T>;
  remove(id: number): Promise<T>;
}
