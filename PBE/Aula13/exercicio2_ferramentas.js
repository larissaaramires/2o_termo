const fs = require('fs');
const entrada = require('readline-sync');

const  ferramentas = [ ];

console.log('--- CADASTRO DE FERRAMENTAS ---');
const qntFerramentas = entrada.questionInt('Digite quantas ferramentas deseja cadastrar: ');

for (let i = 1; i <= qntFerramentas; i++) {
    console.log(`\nItem ${i} de ${qntFerramentas}: `);
    const nome = entrada.question('Nome da ferramenta: ');
    const quantidade = entrada.questionInt('Quantidade: ');
    const precoUnitario = entrada.questionFloat('Preco unitario: ');

    ferramentas.push({
        Nome: nome,
        Quantidade: quantidade,
        Preco: precoUnitario
    })
}

fs.writeFileSync('ferramentas.json', JSON.stringify(ferramentas, null , 2));

console.log('\n--- RELATÓRIO DE FERRAMENTAS ---');
console.log(`Sucesso! ${ferramentas.length} itens gravados em 'ferramentas.json'`);