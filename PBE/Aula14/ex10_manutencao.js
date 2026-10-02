const fs = require('fs');
const readline = require('readline-sync');

const manutencoes = [
  {id: 1, maquina: "Torno CNC", setor: "Usinagem", horasUso: 450, limiteManutencao: 500, manutencaoRealizada: false},
  {id: 2, maquina: "Prensa 100T", setor: "Estamparia", horasUso: 520, limiteManutencao: 500, manutencaoRealizada: false},
  {id: 3, maquina: "Furadeira", setor: "Usinagem", horasUso: 200, limiteManutencao: 400, manutencaoRealizada: false}
];

// Usei IA para me ajudar da linha 11 a 14
if (!fs.existsSync('manutencoes.json')) {
    console.log('Arquivo não encontrado.');
    process.exit();
}

let qntManutencao = 0;

try {
    const dados = fs.readFileSync('manutencoes.json', 'utf8');
    const maquinas = JSON.parse(dados);

    console.log('--- RELATÓRIO DE MÁQUINAS CADASTRADAS ---');

    maquinas.forEach(maquina => {
        console.log(`\nID: ${maquina.id}`);
        console.log(`Máquina: ${maquina.maquina}`);
        console.log(`Setor: ${maquina.setor}`);
        console.log(`Horas de uso: ${maquina.horasUso}`);
        console.log(`Limite: ${maquina.limiteManutencao}`);
        const horasRestantes = limiteManutencao - horasUso;
        if (horasRestantes <= 0) {
            console.log('Status: MANUTENÇÃO NECESSÁRIA');
            qtdManutencao++;
        } else {
            console.log('Status: NORMAL')
        }
    });

} catch (erro) {
    console.log('Erro ao ler o arquivo:', erro.message);
}


console.log('\n--- RELATÓRIO DE MANUTENÇÃO ---');
console.log(`\nQuantidade de equipamentos que precisam de manutenção: ${qtdManutencao}`);

// O resto não deu tempo e não sei fazer