const fs = require("fs");

let md = `
# This is a new file

We can write text to a file with fs.writeFile

* fs.readdir
* fs.readFile
* fs.writeFile

`;
fs.writeFile("newfile.md", md, (err) => {
  if (err) {
    console.error(err);
  } else {
    console.log("File written successfully\n");
  }
});