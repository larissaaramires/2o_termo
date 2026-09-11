const entrada = require('readline-sync');

console.log('---REGISTRO DE PEÇAS DEFEITUOSAS---');

let pecasDefeituosas = [ ];

const pecasDefeito = entrada.questionInt('Digite a quantidade de pecas com defeito encontradas: ');

for (let i = 0; i < pecasDefeito; i++) {
    let numberSerie = entrada.questionInt(`Digite o numero de serie da peca ${i + 1}: `);

    pecasDefeituosas.push(numberSerie);
}

console.log('---RELATÓRIO FINAL---');

console.log(`Total de peças: ${pecasDefeituosas.length}`);
console.log(`Números de série: ${pecasDefeituosas.join(", ")}`);