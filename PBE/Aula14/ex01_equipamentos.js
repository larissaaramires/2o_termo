const fs = require('fs');

const equipamentos = [
    {codigo: 1, Nome: "Torno", Setor: "Usinagem", Operacional: true},
    {codigo: 2, Nome: "Prensa", Setor: "Metalúrgico", Operacional: true},
    {codigo: 3, Nome: "Esteiras Transportadoras", Setor: "Logística", Operacional: false}
];

console.log('--- RELATÓRIO DO CADASTRO DE EQUIPAMENTOS ---');
const dados = JSON.stringify(equipamentos, null, 2);
fs.writeFileSync('equipamentos.json', dados);

console.log("Arquivo 'equipamentos.json' foi gerado com sucesso!");