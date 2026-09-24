const entrada = require('readline-sync');

const material = entrada.question('Digite o nome do material: ');
const quantidade = entrada.questionInt('Digite a quantidade comprada: ');
const preco = entrada.questionFloat('Digite o preco unitario: ');

const valorTotalCompra = quantidade * preco

console.log('--- PEDIDO DE MATÉRIA PRIMA ---');
console.log(`Material comprado: ${material}`);
console.log(`Quantidade: ${quantidade}`);
console.log(`Preço: ${preco.toFixed(2)}`);
console.log(`Valor total da compra: R$ ${valorTotalCompra.toFixed(2)}`)