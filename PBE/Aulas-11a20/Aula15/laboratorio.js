const fs = require("fs");

const texto = fs.readFileSync("arquivo-inexistente.json", "utf8");
console.log(typeof texto);
console.log(texto);