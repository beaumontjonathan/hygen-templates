const fs = require('fs');
const path = require('path');

const folderExists = folder => (
  fs.existsSync(path.join(process.cwd(), folder))
);

const inputFolder = prompter => (
  prompter.prompt({
    type: 'input',
    name: 'folder',
    message: "What folder do you want to work in?",
    validate: async (value) => {
      if (value === undefined || value == '') {
        return 'You must enter a folder name'
      }

      if (!(/^[a-zA-Z]+([\/0-9_-]*[a-zA-Z]+)*$/.test(value))) {
        return 'Must match /^[a-zA-Z]+([0-9_-]*[a-zA-Z]+)*$/';
      }

      return true;
    },
  }).then(({ folder }) => folder)
);

const confirmContinue = (prompter, folder) => (
  prompter.confirm({
    name: 'ok',
    message: `The directory "${path.join(process.cwd(), folder)}" does not exist, are you sure you want to continue?`
  })
);

const getRootFolder = async (prompter) => {
  const folder = await inputFolder(prompter);

  if (folderExists(folder)) {
    return folder;
  }

  if (await confirmContinue(prompter, folder)) {
    return folder;
  }

  return getRootFolder(prompter);
};

module.exports = getRootFolder;
