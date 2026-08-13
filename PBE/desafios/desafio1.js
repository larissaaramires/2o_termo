const entrada = require('readline-sync');

console.log("---O VERIFICADOR DE VOTACAO---");

const nome = entrada.question("Digite seu nome: ");
const ano_nascimento = entrada.questionFloat("Digite o seu ano de nascimento: ");
const ano_atual = entrada.questionFloat("Digite o ano atual: ");

const idade = ano_atual - ano_nascimento

if (idade >= 16) {
    console.log(`\n${nome}, voce ja tem idade minima para votar!`);
} else {
    console.log(`\n${nome}, voce ainda nao tem idade minima para votar.`);
}