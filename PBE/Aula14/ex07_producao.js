const fs = require('fs');

const producao = [
    {maquina: "Torno CNC", meta: 500, produzido: 475},
    {maquina: "Prensa 100T", meta: 400, produzido: 420},
    {maquina: "Furadeira", meta: 300, produzido: 200}
];

const GravandoDados = JSON.stringify(producao, null, 2);

const arquivo = 'producao.json';

fs.writeFileSync(arquivo,GravandoDados);


let maquinasMeta = 0;

console.log('--- RELATÓRIO DE PRODUÇÃO ---');

producao.forEach(maquina => {

    const percentual = (maquina.produzido / maquina.meta) * 100;

    if (percentual >= 100) {
        situacao = 'META ATINGIDA';
        maquinasMeta++;
    } else if (percentual >= 80) {
        situacao = 'ATENÇÃO';
    } else {
        situacao = 'ABAIXO DA META';
    }

    console.log(`\nMáquina: ${maquina.maquina}`);
    console.log(`Meta: ${maquina.meta}`);
    console.log(`Produzido: ${maquina.produzido}`);
    console.log(`Desempenho: ${percentual.toFixed(2)}%`);
    console.log(`Situação: ${situacao}`);

});

console.log(`\nMáquinas que atingiram a meta: ${maquinasMeta}`);