const fs = require('fs');
const entrada = require('readline-sync');

const funcionarios = [
    {id:1, nome: "Marina", setor: "Usinagem" },
    {id:2, nome: "Victor Hugo", setor: "RH" },
    {id:3, nome: "Luisa", setor: "Gerente" },
    {id:4, nome: "Lorenzo", setor: "Usinagem" },
    {id:5, nome: "Lucas", setor: "Usinagem" }
];

function salvarDados() {
    const dadosTexto = JSON.stringify(produtos, null, 2);
    fs.writeFileSync('funcionarios.json', dadosTexto);
}

const ID = entrada.question('Digite um ID: ');

const resultado = funcionarios.find(f => f.id === ID);

if (resultado) {
    
}
