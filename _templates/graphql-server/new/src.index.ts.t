---
to: <%= folder %>/src/index.ts
---
import { ApolloServer } from 'apollo-server-lambda';
import { Connection } from 'mysql2/promise';
import typeDefs from './generated/schema';
import resolvers from './schema/resolvers';
import { Context } from './Context';
import db from './database';

const server = new ApolloServer({
  typeDefs,
  resolvers,
  tracing: true,
  playground: true,
  introspection: true,
  context: async () => {
    let connection: Connection | null = null;

    const context: Context = {
      getConnection: async () => {
        if (connection === null) {
          connection = await db.getConnection();
        }

        return connection;
      },
    };

    return context;
  },
});

// eslint-disable-next-line import/prefer-default-export
export const handler = server.createHandler();
