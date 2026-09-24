const entrada = require('readline-sync');

let acumuladora = 0;
let valores = 1;

console.log('--- MÉDIA DE CINCO MEDIÇÕES ---');

while (valores <= 5) {
    const valoresMedia = entrada.questionFloat(`Digite o valor ${valores}: `);
    valores++;
    acumuladora += valoresMedia;
}

const media = acumuladora / 5;

console.log('--- RESULTADOS ---');
console.log(`A soma das médias é: ${acumuladora}`);
console.log(`A média final é: ${media}`);