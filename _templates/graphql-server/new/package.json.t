---
to: <%= folder %>/package.json
---
<%
 console.log(folder)
%>
{
  "name": "<%= packageName %>",
  "description": "<%= description %>",
  "version": "<%= version %>",
  "scripts": {
    "start": "sls offline",
    "generate:graphql": "graphql-codegen --config codegen.yml"
  },
  "dependencies": {
    "apollo-server-lambda": "^2.9.16",
    "graphql": "^14.6.0",
    "graphql-tag": "^2.10.2",
    "mysql2": "^2.1.0"
  },
  "devDependencies": {
    "@types/mysql2": "github:types/mysql2"
  }
}
