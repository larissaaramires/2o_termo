const entrada = require('readline-sync');

console.log("---O MAO DE VACA---");

const valor_conta = entrada.questionFloat('Digite o valor total da sua conta: ');

const desconto = (10 / 100) * valor_conta
const valor_final = valor_conta - desconto

if (valor_conta >= 100) {
    console.log(`\nO valor da sua cota com o desconto de 10% é de: R$ ${valor_final}`);
} else {
    console.log(`\nSinto muito mas voce gastou menos de 100 reais, entao nao tem desconto. O valor da sua conta é de: R$ ${valor_conta}`);
}