---
to: <%= folder %>/tsconfig.json
---
{
  "compilerOptions": {
    "target": "es2019",
    "module": "commonjs",
    // "noEmit": true,
    "rootDir": "./src",
    "declaration": true,
    "emitDeclarationOnly": true,
    "outDir": "build",
    "strict": false,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true,
    "allowSyntheticDefaultImports": true,
    "esModuleInterop": true,
    "jsx": "react",
    "typeRoots": [
      "./src/typings",
      "./node_modules/@types"
    ]
  },
  "lib": [
    "es2019"
  ],
  "include": [
    "src/**/*"
  ],
  "exclude": [
    "node_modules",
    "build",
    "scripts",
    "article-parser"
  ]
}
