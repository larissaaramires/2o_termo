const entrada = require('readline-sync');

console.log('--- PEÇA APROVADA OU REPROVADA ---');

const pesoPeca = entrada.question('Digite o peso da peca em gramas: ');

if (pesoPeca>=95 && pesoPeca<=105) {
    console.log(`Peso da peça: ${pesoPeca} gramas, PEÇA APROVADA!`);
} else {
    console.log(`Peso da peça: ${pesoPeca} gramas, PEÇA REPROVADA!`);
}