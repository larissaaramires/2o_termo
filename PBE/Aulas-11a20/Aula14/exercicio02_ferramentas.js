const entrada = require('readline-sync');
const fs = require('fs');

const ferramentas = [];

console.log('--- CADASTRO FERRAMENTAL ---');

const qnt = entrada.questionInt('Digite quantas ferramentas serao cadastradas: ');

for (let i = 0; i < qnt; i++) {
    console.log(`\nItem ${i + 1} de ${qnt}:`)
    const nome = entrada.question('Nome da ferramenta: ');
    const quantidade = entrada.questionInt('Quantidade da ferramenta: ');
    const custoUnitario = entrada.questionFloat('Valor unitario da ferramenta: ');

    ferramentas.push({
        nome: nome,
        quantidade: quantidade,
        custoUnitario: custoUnitario
    });
}

const dadosParaGravar = JSON.stringify(ferramentas, null, 2);
const NomeDoArquivo = 'ferramentas.json';
fs.writeFileSync(NomeDoArquivo, dadosParaGravar);

// outra opcao para gravar 
// fs.writeFileSync('ferramentas.json', JSON.stringify(ferramentas, null, 2));

console.log(`\nSucesso! Foram gravados ${ferramentas.length} itens em 'ferramentas.json'`)