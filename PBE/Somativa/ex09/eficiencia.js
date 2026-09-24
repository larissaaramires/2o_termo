function calculatEficiencia(real, prevista) {
    return percentual = (real / prevista) * 100;
}

function classificarEficiencia(eficiencia) {
    if (percentual >= 90) {
        return "META ATINGIDA";
    } else if (percentual < 70) {
        return "ABAIXO DA META";
    } else {
        return "ATENÇÃO";
    }
}

const entrada = require('readline-sync');
console.log('--- CÁLCULO DE EFICIENCIA ---');
const prevista = entrada.questionInt('Digite a producao prevista: ');
const real = entrada.questionInt('Digite a producao real: ');
const eficiencia = calculatEficiencia(real, prevista)
const classificacao = classificarEficiencia(eficiencia)
console.log('--- RELATÓRIO FINAL ---');
console.log(`Produção prevista: ${prevista}`);
console.log(`Produção real: ${real}`);
console.log(`Eficiencia: ${eficiencia}%`);
console.log(`Classificação: ${classificacao}`);
