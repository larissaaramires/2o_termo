const entrada = require('readline-sync');

let operadores = [ ];

console.log('--- LISTA DE OPERADORES ---');

for (let i = 0; i < 5; i++) {
    let nomeOpedador = entrada.question(`Digite o nome do operador ${i + 1}: `);
    operadores.push(nomeOpedador);
}

console.log('--- RELATÓRIO FINAL ---');
for (let i = 0; i < operadores.length; i++) {
    console.log(`${[i + 1]} - ${operadores[i]}`);
}