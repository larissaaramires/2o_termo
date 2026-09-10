const entrada = require ('readline-sync');
const conversor = require('./conversor');

console.log('---CONVERSOR DE DÓLAR EM REAL---');

const dolar = entrada.question('Digite o valor em dolar: ');
const total = conversor.converterDolarEmReal(dolar);

console.log(`O valor em real é: R$ ${total.toFixed(2)}`);