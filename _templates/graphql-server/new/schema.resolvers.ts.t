---
to: <%= folder %>/src/schema/resolvers.ts
---
import { Resolvers } from '../generated/graphql';
import db, { getConnection } from '../database';

const resolvers: Resolvers = {
  Query: {
    examples: () => db.examples.get(getConnection)(),
  },
  Mutation: {
    examples: () => db.examples.get(getConnection)(),
  },
  Example: {
    id: ({ id }) => `${id}`,
    name: ({ name }) => name,
  },
};

export default resolvers;
