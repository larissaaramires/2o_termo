const entrada = require('readline-sync');

let componentes = [ ];

for (let i = 0; i < 3; i++) {
    let nomeComponente = entrada.question(`Digite o nome do componente ${i + 1}: `);
    let quantidadeComponente = entrada.questionInt(`Digite a quantidade do componente ${i + 1}: `);
    let estoqueMinimoComponente = entrada.questionInt(`Digite o estoque minimo do componente ${i + 1}: `);
    componentes.push(nomeComponente);
    componentes.push(quantidadeComponente);
    componentes.push(estoqueMinimoComponente);
}

for (let i = 0; i < componentes.length; i++) {
    if (quantidadeComponente <= estoqueMinimoComponente) {
        console.log(`${componentes[i].nomeComponente} - REPOR ESTOQUE`)
    } else {
        console.log(`${componentes[i].nomeComponente} - ESTOQUE OK`)
    }
}
