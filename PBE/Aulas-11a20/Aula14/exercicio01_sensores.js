const fs = require('fs');

console.log('--- REGISTRO DE SENSORES INDUSTRIAIS ---');

const sensores = [
    {codigo: 1001, tipo: "Temperatura", leituraAtual: 40.8, status: "Operando"},
    {codigo: 1002, tipo: "Pressão", leituraAtual: 6, status: "Operando"},
    {codigo: 1003, tipo: "Temperatura", leituraAtual: 140.9, status: "Alerta"},
];

const dadosParaGravar = JSON.stringify(sensores, null, 2);

const nomeDoArquivo = 'sensores.json';

fs.writeFileSync(nomeDoArquivo, dadosParaGravar);

console.log('\nGravacao concluida com sucesso.');
console.log(`Verifique o arquivo '${nomeDoArquivo}'`)