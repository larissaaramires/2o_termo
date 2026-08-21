const entrada = require('readline-sync');

const valorTotal = entrada.questionFloat("Digite o valor total da compra: ");
const parcela = entrada.questionInt("Digite quantas parcelas voce deseja fazer (ate 12): ");

const valorParcela = valorTotal / parcela

for (let i = 1; i <= parcela; i++) {
    console.log(`Parcela ${i}: R$ ${valorParcela.toFixed(2)}`);
} 