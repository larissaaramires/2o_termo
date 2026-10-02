const fs = require('fs');

const dados = fs.readFileSync('equipamentos.json', 'utf-8');

const equipamentos = JSON.parse(dados);

let totalParadas = 0;

console.log('--- RELATÓRIO DE EQUIPAMENTOS PARADOS ---');

equipamentos.forEach(equipamento => {

    if (equipamento.Operacional !== true) {

        console.log(`${equipamento.Nome} - ${equipamento.Setor}`);

        totalParadas++;

    }

});

console.log(`Total de equipamentos parados: ${totalParadas}`);