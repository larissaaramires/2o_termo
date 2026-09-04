const entrada = require('readline-sync');

const logistica = require('./calculadoraFrete');

console.log('---SISTEMA DE LOGISTICA---');

const nomeProduto = entrada.question('Nome do produto: ');
const distanciaKm = entrada.questionFloat('Distancia da entrega em Km: ');
const valorCarga = entrada.questionFloat('Valor total da carga: ');

const valorFrete = logistica.calcularBase(distanciaKm);
const valorSeguro = logistica.calcularSeguro(valorCarga);
const prazo = logistica.verificarPrazo(distanciaKm);
const valorTotal = (valorFrete + valorSeguro);

console.log('\n---RELATORIO DE POSTAGEM---');

console.log(`Produto: ${nomeProduto}`);
console.log(`Prazo de entrega: ${prazo}`);
console.log(`Valor do frete: R$ ${valorFrete.toFixed(2)}`);
console.log(`Valor do seguro: R$ ${valorSeguro.toFixed(2)}`);
console.log(`Total a pagar: R$ ${valorTotal.toFixed(2)}`);