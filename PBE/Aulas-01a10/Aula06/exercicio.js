const entrada = require('readline-sync');
function calcularMedia(n1, n2) {
    return (n1 + n2) /2;
}

const numero1 = entrada.questionFloat("Digite a sua primeira nota: \n");
const numero2 = entrada.questionFloat("Digite a sua segunda nota: \n");
const resultado = calcularMedia(numero1, numero2);
console.log(`A media calculada foi de: ${resultado}`);