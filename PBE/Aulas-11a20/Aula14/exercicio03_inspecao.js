const fs = require('fs');

const amostras = [12.3, 13.4, 11.6, 12.1];

let aprovado = true;

for (let i = 0; i < amostras.length; i++) {
    if (amostras[i] < 12.0) {
        aprovado = false;
        break;
    }
};

const relatorio = {
    data: "2026-09-23",
    inspetor: "Celso Carvalho",
    amostras: amostras,
    loteAprovado: aprovado
};

fs.writeFileSync('inspecao_qualidade.json', JSON.stringify(relatorio, null, 2));

console.log('--- RELATÓRIO DE QUALIDADE ---');
console.log(`Status do lote: ${aprovado ? "APROVADO" : "REPROVADO"}`);
console.log("Arquivo 'inspecao_qualidade.json' gravado com sucesso!")