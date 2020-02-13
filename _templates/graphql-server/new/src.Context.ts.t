---
to: <%= folder %>/src/Context.ts
---
import { Connection } from 'mysql2/promise';

export interface Context {
  getConnection: () => Promise<Connection>;
}
