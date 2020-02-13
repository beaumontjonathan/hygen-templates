---
to: <%= folder %>/src/database/helpers/index.ts
---
import { Connection, RowDataPacket } from 'mysql2/promise';

export type ConnectionOrFactory = Connection | (() => Promise<Connection>);

export const connectionFromUnion = (connection: ConnectionOrFactory): Promise<Connection> => {
  if (typeof connection === 'function') {
    return connection();
  }

  return Promise.resolve(connection);
};

export type DbFn<Args, Result> = (conn: ConnectionOrFactory) => (args: Args) => Promise<Result>;

export type Dbify<T extends Object> = {
  [K in keyof Required<T>]: Pick<T, K> extends Pick<Required<T>, K> ? T[K] : (null | T[K]);
} & RowDataPacket;
