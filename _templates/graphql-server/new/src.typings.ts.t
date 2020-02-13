---
to: <%= folder %>/src/typings.d.ts
---
declare namespace NodeJS {
  export interface ProcessEnv {
    readonly NODE_ENV: 'development' | 'production' | 'test';
    readonly MYSQL_USER: string;
    readonly MYSQL_PASSWORD: string;
    readonly MYSQL_HOST: string;
    readonly MYSQL_PORT: string;
    readonly MYSQL_DATABASE: string;
  }
}
