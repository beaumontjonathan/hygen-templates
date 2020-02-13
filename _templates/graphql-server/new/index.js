// const semver = require('semver');
// const validateNpmPackageName = require('validate-npm-package-name');
const getRootFolder = require('./getRootFolder');

const getFolderName = (prompter) => {
  return prompter.prompt({
    type: 'input',
    name: 'folderName',
    message: 'Enter a folder a name'
  }).then(({ folderName }) => folderName)
};

const booleanInput = (prompter, message) => (
  prompter.confirm({
    name: 'ok',
    message,
  })
);

const createPackageJson = (prompter) => (
  prompter.snippet({
    message: 'Fill out the fields in package.json',
    fields: [
      {
        name: 'packageName',
        message: 'Package name',
      },
      {
        name: 'description',
        message: 'Description',
      },
      {
        version: 'version',
        message: 'Version',
      },
    ],
    template: (
`{
  "name": "\${packageName}",
  "description": "\${description}",
  "version": "\${version}"
}`
    ),
  })
);

module.exports = {
  prompt: async ({ prompter, args }) => {
    // const folderName = await getFolderName(prompter);
    const folder = await getRootFolder(prompter);

    const {
      values: {
        packageName,
        description,
        version,
      },
    } = await createPackageJson(prompter);

    const data = {
      folder,
      packageName,
      description,
      version,
    };

    return data;
  },
  // prompt: async ({ prompter, args }) => {
  //   const p = prompter
  //     .prompt({
  //       type: 'input',
  //       name: 'email',
  //       message: "What's your email?"
  //     })
  //     .then(({ email }) =>
  //       prompter.prompt({
  //         type: 'input',
  //         name: 'emailConfirmation',
  //         message: `Please type your email [${email}] again:`
  //       })
  //     );

  //   const r = await p;
  //   console.log('value is', r);
  //   return {
  //     ...r,
  //     folder: 'boom/deep',
  //     packageName: '',
  //     description: '',
  //     version: '',
  //   };
  // },
};
