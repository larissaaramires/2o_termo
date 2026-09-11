const entrada = require('readline-sync');

const calculos = require('./calculosVenda');

console.log('---MERCADINHO---');

const nome = entrada.question('Digite seu nome: ');
const preco = entrada.questionFloat('Digite o preco: ');
const qtd = entrada.questionFloat('Digite a quantidade: ');
const total = calculos.calcularTotal(preco, qtd).toFixed(2);

console.log('---CUPOM---')
console.log(calculos.gerarCupom(nome, total));