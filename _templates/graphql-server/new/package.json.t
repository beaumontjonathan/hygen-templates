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
    "lint": "eslint --ext ts,js src",
    "generate:graphql": "graphql-codegen --config codegen.yml"
  },
  "dependencies": {
    "apollo-server-lambda": "^2.9.16",
    "graphql": "^14.6.0",
    "graphql-tag": "^2.10.2",
    "mysql2": "^2.1.0"
  },
  "devDependencies": {
    "@babel/cli": "^7.8.4",
    "@babel/core": "^7.8.4",
    "@babel/preset-env": "^7.8.4",
    "@babel/preset-typescript": "^7.8.3",
    "@graphql-codegen/cli": "^1.12.1",
    "@graphql-codegen/introspection": "^1.12.1",
    "@graphql-codegen/schema-ast": "^1.12.1",
    "@graphql-codegen/typescript": "^1.12.1",
    "@graphql-codegen/typescript-graphql-files-modules": "^1.12.1",
    "@graphql-codegen/typescript-operations": "^1.12.1",
    "@graphql-codegen/typescript-resolvers": "^1.12.1",
    "@typescript-eslint/eslint-plugin": "^2.19.0",
    "@typescript-eslint/parser": "^2.19.0",
    "@types/mysql2": "github:types/mysql2",
    "babel-loader": "^8.0.6",
    "copy-webpack-plugin": "^5.1.1",
    "core-js": "^3.6.4",
    "eslint": "^6.8.0",
    "eslint-config-airbnb-typescript": "^6.3.1",
    "eslint-plugin-import": "^2.20.1",
    "html-webpack-plugin": "^3.2.0",
    "serverless": "^1.62.0",
    "serverless-offline": "^5.12.1",
    "serverless-webpack": "^5.3.1",
    "ts-node": "^8.6.2",
    "typescript": "^3.7.5",
    "webpack": "^4.41.5",
    "webpack-cli": "^3.3.10",
    "webpack-dev-server": "^3.10.3",
    "webpack-node-externals": "^1.7.2"
  }
}
