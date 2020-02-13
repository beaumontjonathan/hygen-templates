---
to: <%= folder %>/src/database/example/index.ts
---
import { connectionFromUnion, DbFn, Dbify } from '../helpers';
import { Example, OmitId, Id } from '../../types';

type DbExample = Dbify<Example>;

export const get: DbFn<void, Example[]> = (conn) => async () => {
  const [rows] = await (await connectionFromUnion(conn)).query<DbExample[]>('select * from example');

  if (Array.isArray(rows) && rows.length === 1) {
    return rows;
  }

  throw new Error('Unknown data returned from mysql?!');
};
