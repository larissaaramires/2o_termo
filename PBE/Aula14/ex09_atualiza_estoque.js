const fs = require('fs');
const readline = require('readline-sync');

const dados = fs.readFileSync('materiais.json', 'utf-8');

const materiais = JSON.parse(dados);

const codigo = readline.questionInt('Digite o codigo do material: ');

let materialEncontrado = 0;

materiais.forEach(material => {

    if (material.codigo === codigo) {
        materialEncontrado = material;
    }
});

if (materialEncontrado) {
    console.log(`\nMaterial: ${materialEncontrado.descricao}`)
    console.log(`Quantidade atual: ${materialEncontrado.quantidade}`);
    const novaQuantidade = readline.questionInt('Digite a nova quantidade: ');
    materialEncontrado.quantidade = novaQuantidade;

    // Tive ajuda de IA da linha 25 até 35
    // Criar backup
    fs.copyFileSync(
        'materiais.json',
        'materiais_backup.json'
    );

    // Salvar arquivo atualizado
    fs.writeFileSync(
        'materiais.json',
        JSON.stringify(materiais, null, 2)
    );

    console.log('\nEstoque atualizado com sucesso!');
    console.log('Backup criado em materiais_backup.json');

} else {
    console.log("Material não encontrado.");
}