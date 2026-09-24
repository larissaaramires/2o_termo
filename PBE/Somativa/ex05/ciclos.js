const entrada = require('readline-sync');

let totalPecas = 0;
const pecasPorCiclo = entrada.questionInt('Digite quantas pecas a maquina produz por ciclo: ');

console.log('--- TABELA DE PRODUÇÃO ---');

for (let i = 0; i < pecasPorCiclo; i++) {
    totalPecas += pecasPorCiclo;
    console.log(`Ciclo ${i + 1}: ${totalPecas} peças`);
}