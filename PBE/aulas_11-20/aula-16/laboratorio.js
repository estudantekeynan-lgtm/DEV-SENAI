const fs = require("fs");
const texto = fs.readFileSync("maquinas.json", "utf8");
const maquinas = JSON.parse(texto);
console.log(Array.isArray(maquinas));
console.log(maquinas.length);
console.log(maquinas[0].nome);


maquinas.forEach((maquina, indice) => {
console.log(`${indice + 1}. ${maquina.nome}`);
});

const procurada = maquinas.find(maquina => maquina.id === 2);
console.log(procurada);