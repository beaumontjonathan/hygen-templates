---
to: <%= folder %>/src/database/index.ts
---
import mysql, { Connection } from 'mysql2/promise';
import * as meals from './meals';
import * as days from './days';

export const getConnection = (): Promise<Connection> => mysql.createConnection({
  host: process.env.MYSQL_HOST,
  // port: process.env.DB_PORT,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
});

const db = {
  days,
  meals,
  getConnection,
};

export default db;
