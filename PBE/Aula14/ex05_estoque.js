const fs = require('fs');

const materiais = [
    {codigo: 1, descricao: "Aço SAE 1020", quantidade: 50, valorUnitario: 32.50},
    {codigo: 2, descricao: "Alumínio", quantidade: 20, valorUnitario: 25.00},
    {codigo: 3, descricao: "Cobre", quantidade: 5, valorUnitario: 40.00}
];

const GravandoDados = JSON.stringify(materiais, null, 2);

const arquivo = 'materiais.json';

fs.writeFileSync(arquivo,GravandoDados);

let totalUnidades = 0;
let valorTotal = 0;

console.log('--- ESTOQUE ---');

materiais.forEach(material => {

    const valorEstoque = material.quantidade * material.valorUnitario;

    console.log(`\nDescrição: ${material.descricao}`);
    console.log(`Quantidade: ${material.quantidade}`);
    console.log(`Valor unitário: R$ ${material.valorUnitario.toFixed(2)}`);
    console.log(`Valor em estoque: R$ ${valorEstoque.toFixed(2)}`);

    totalUnidades += material.quantidade;
    valorTotal += valorEstoque;

});

console.log(`\nQuantidade de tipos de materiais: ${materiais.length}`);
console.log(`Quantidade total de unidades: ${totalUnidades}`);
console.log(`Valor total do estoque: R$ ${valorTotal.toFixed(2)}`);