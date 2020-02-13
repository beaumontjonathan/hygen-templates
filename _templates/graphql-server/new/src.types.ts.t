---
to: <%= folder %>/src/types.ts
---
export type OmitId<T> = Omit<T, 'id'>;
export type Id<T extends { id: unknown }> = T['id'];

export interface Example {
  id: number;
  name: string;
}
