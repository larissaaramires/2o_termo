const entrada = require('readline-sync');

console.log("---ALCOOL OU GASOLINA---");

const valor_alcool = entrada.question('Digite o valor do alcool por litro: ');
const valor_gasolina = entrada.question('Digite o valor daa gasolina por litro: ');

const diferenca = valor_alcool / valor_gasolina

if (diferenca >= 0.7) {
    console.log("\nAbasteça com GASOLINA!");
} else {
    console.log("\nAbasteça com ALCOOL!");
}