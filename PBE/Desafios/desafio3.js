const entrada = require('readline-sync');

function calcularArea(n1, n2) {
    return n1 * n2;
}

const largura1 = entrada.questionFloat("Digite a largura do primeiro terreno (em metros): ");
const comprimento1 = entrada.questionFloat("Digite o comprimento do primeiro terreno (em metros): ");
const largura2 = entrada.questionFloat("Digite a largura do segundo terreno (em metros): ");
const comprimento2 = entrada.questionFloat("Digite o comprimento do segundo terreno (em metros): ");
const largura3 = entrada.questionFloat("Digite a largura do terceiro terreno (em metros): ");
const comprimento3 = entrada.questionFloat("Digite o comprimento do terceiro terreno (em metros): ");

const areaTerreno1 = calcularArea(largura1, comprimento1);
console.log(`A area do primeiro terreno é: ${areaTerreno1.toFixed(1)} metros.`);
const areaTerreno2 = calcularArea(largura2, comprimento2);
console.log(`A area do segundo terreno é: ${areaTerreno2.toFixed(1)} metros.`);
const areaTerreno3 = calcularArea(largura3, comprimento3);
console.log(`A area do terceiro terreno é: ${areaTerreno3.toFixed(1)} metros.`);
