---
to: <%= folder %>/codegen.yml
---
schema: src/schema/**/index.graphql

require:
  - ts-node/register

generates:
  src/generated/schema.graphql:
    plugins:
      - schema-ast

  src/generated/graphql.ts:
    plugins:
      - typescript
      - typescript-resolvers
    config:
      avoidOptionals: true
      contextType: ../Context#Context
      mappers:
        Example: "../types#Example as ExampleModel"
      showUnusedMappers: true
      federation: true

  ./graphql.schema.json:
    plugins:
      - "introspection"
