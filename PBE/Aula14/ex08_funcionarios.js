const fs = require('fs');
const readline = require('readline-sync');

const funcionarios = [
    {matricula: 1201, nome: "João Santos", setor: "Produção", cargo: "Operador"},
    {matricula: 1202, nome: "Ana Oliveira", setor: "Manutenção", cargo: "Técnica"},
    {matricula: 1203, nome: "Maria Silva", setor: "Qualidade", cargo: "Inspetor"},
    {matricula: 1204, nome: "Ana Julia", setor: "Produção", cargo:"Gerente"},
    {matricula: 1205, nome: "Sophia Antunes", setor: "Produção", cargo: "Operador"},
]

const GravandoDados = JSON.stringify(funcionarios, null, 2);

const arquivo = 'funcionarios.json';

fs.writeFileSync(arquivo,GravandoDados);

const matricula = readline.questionInt("Digite a matricula: ");

let encontrado = false;

funcionarios.forEach(funcionario => {

    if (funcionario.matricula === matricula) {
        console.log('\nFuncionário encontrado!');
        console.log(`Nome: ${funcionario.nome}`);
        console.log(`Setor: ${funcionario.setor}`);
        console.log(`Cargo: ${funcionario.cargo}`);
        encontrado = true;
    }

});


if (!encontrado) {
    console.log('\nFuncionário não encontrado.');

}