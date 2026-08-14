const entrada = require('readline-sync');

const nome = entrada.question("Digite o seu nome: ");
const idade = entrada.questionInt("Digite a sua idade: ");
const trabalho = entrada.questionInt("Digite seu tempo de contribuicao com a sua empresa: ");

if ((idade >= 65) || trabalho >= 30) {
    console.log(` ${nome}, voce pode aposentar!`);
} else {
    console.log(`${nome}, voce ainda não pode aposentar.`);
}
