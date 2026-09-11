const entrada = require('readline-sync');

const listaVisitantes = [ ];

while (true) {
    let cadastro = entrada.question('Deseja cadastrar um novo visitante? (s/n): ');
    if (cadastro.toLowerCase() !== 's') {
        break;
    }

    let nomeVis = entrada.question('Nome do visitante: ');
    let empresaVis = entrada.question('Empresa: ');

    listaVisitantes.push({
        nome: nomeVis,
        empresa: empresaVis
    });

    console.log('Registrado com sucesso! \n');
}

console.log('---VISITANTES DO DIA---');
for (let i = 0; i < listaVisitantes.length; i++) {
    console.log(`${i + 1}. ${listaVisitantes[i].nome} (${listaVisitantes[i].empresa})`);
}
