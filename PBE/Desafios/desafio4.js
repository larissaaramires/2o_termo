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
const entrada = require('readline-sync');

console.log('---CLASSIFICACAO DE ENTRADA---');

const nome = entrada.question('Qual seu nome? ');
const idade = entrada.questionInt('Digite sua idade: ');

if (idade < 5) {
    console.log(`\nPor favor insira uma idade valida`);
}
else if (idade >= 5 && (idade <= 10)) {
    console.log(`\nCategoria: Infantil.`);
} 
else if (idade >= 11 && (idade <= 17)) {
    console.log(`\nCategoria: Juvenil.`);
} 
else if (idade >= 18 && (idade <= 60)) {
    console.log(`\nCategoria: Adulto.`);
} else {
    console.log(`\nCategoria: Senior.`);
}
