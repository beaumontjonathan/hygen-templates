---
to: <%= folder %>/.babelrc
---
{
  "presets": [
    [
      "@babel/env",
      {
        "debug": false,
        "targets": {
          "node": "10"
        },
        "useBuiltIns": "usage",
        "corejs": 3
      }
    ],
    "@babel/typescript"
  ]
}
