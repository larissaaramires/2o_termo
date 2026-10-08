const fs = require('fs');

const sensores = [
    {codigo: 1, Tipo: "Temperatura", leituraAtual: 23.5, status: "Operando"},
    {codigo: 2, Tipo: "Pressão", leituraAtual: 6.7, status: "Operando"},
    {codigo: 3, Tipo: "Temperatura", leituraAtual: 205.7, status: "Alerta"}
];

console.log('--- RELATÓRIO DOS SENSORES INDUSTRIAIS ---');
const dadosJSON = JSON.stringify(sensores, null, 2);
fs.writeFileSync('sensores.json', dadosJSON);

console.log("Arquivo 'sensores.json' foi gerado com sucesso");