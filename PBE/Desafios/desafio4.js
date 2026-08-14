const entrada = require('readline-sync');

const cinema = [
    {título: "Minions", idadeMinima: 0},
    {nome: "Minha culpa", idadeMinima: 16},
    {nome: "Freira", preco: 18}
];

const nome = entrada.question('Digite o seu nome: ')
const idade = entrada.questionInt('Digite a sua idade: ')


for (let i = 0; i < cinema; i ++) {
    console.log(`Voce tem idade para assistir: ${cinema}`);
}