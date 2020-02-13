---
to: <%= folder %>/serverless.yml
---
service: food-planner

provider:
  name: aws
  runtime: nodejs12.x
  stage: ${opt:stage, 'development'}
  region: eu-west-1
  profile: home
  environment:
    NODE_ENV: ${self:provider.stage}
    MYSQL_USER: ${file(./config.json):${self:provider.stage}.mysql.user}
    MYSQL_PASSWORD: ${file(./config.json):${self:provider.stage}.mysql.password}
    MYSQL_HOST: ${file(./config.json):${self:provider.stage}.mysql.host}
    MYSQL_PORT: ${file(./config.json):${self:provider.stage}.mysql.port}
    MYSQL_DATABASE: ${file(./config.json):${self:provider.stage}.mysql.database}

plugins:
  - serverless-offline
  - serverless-webpack

custom:
  webpack:
    packager: "yarn"
    includeModules:
      forceInclude:
        - apollo-server-lambda

functions:
  graphql:
    name: ${self:provider.stage}_food-planner
    handler: src/index.handler
    events:
      - http:
          path: graphql
          method: post
          # cors: true
      - http:
          path: graphql
          method: get
          # cors: true
