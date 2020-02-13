---
to: <%= folder %>/.eslintrc.js
---
module.exports = {
  parser: '@typescript-eslint/parser',
  extends: [
    'airbnb-typescript/base',
    'plugin:@typescript-eslint/recommended',
  ],
  parserOptions: {
    ecmaVersion: 2018,
    sourceType: 'module',
    project: './tsconfig.json',
    tsconfigRootDir: __dirname,
  },
  rules: {
    'consistent-return': 'off',
    '@typescript-eslint/explicit-function-return-type': 'off',
  },
  plugins: [
  ],
  env: {
    jest: true,
  }
};
