---
to: <%= folder %>/webpack.config.js
---
const path = require('path');
const slsw = require('serverless-webpack');
const nodeExternals = require('webpack-node-externals');

const runningWithServerless = 'serverless' in slsw.lib;

const slswMode = slsw.lib.webpack.isLocal ? 'development' : 'production';
const mode = runningWithServerless ? slswMode : 'development';

const entry = runningWithServerless ? slsw.lib.entries : './src/index.ts';

module.exports = {
  resolve: {
    extensions: ['.mjs', '.ts', '.js', '.json', '.gql', '.graphql'],
  },
  mode,
  entry,
  stats: 'minimal',
  target: 'node',
  externals: [nodeExternals()],
  module: {
    rules: [
      {
        include: path.resolve(__dirname, 'src'),
        test: /\.(js|jsx|ts|tsx)$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
        },
      },
      {
        test: /\.(graphql|gql)$/,
        exclude: /node_modules/,
        loader: 'graphql-tag/loader',
      },
    ],
  },
};
