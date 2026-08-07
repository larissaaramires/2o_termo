const entrada = require('readline-sync');

console.log('---O SIMULADOR DE EMPRESTIMO---');

const nome = entrada.question("Digite seu nome: ");
const renda = entrada.questionFloat("Digite sua renda mensal: ");
const nomeSujo = entrada.keyInYNStrict("Possui nome sujo? ");

if (renda >= 2000 && (nomeSujo === true)) {
    console.log(`\n${nome}, emprestimo Aprovado!`);
} else {
    console.log(`\nSinto muito, ${nome}. Emprestimo Negado.`);
}