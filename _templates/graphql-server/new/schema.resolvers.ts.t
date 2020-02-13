---
to: <%= folder %>/src/schema/resolvers.ts
---
import { Resolvers } from '../generated/graphql';
import db, { getConnection } from '../database';

const resolvers: Resolvers = {
  Query: {

  },
  Mutation: {

  },
  Example: {

  },
};

export default resolvers;
