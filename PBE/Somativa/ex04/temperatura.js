const entrada = require('readline-sync');

const temperatura = entrada.question('DIgite a temperatura: ');

console.log('--- CLASSIFICAÇÃO DE TEMPERATURA ---');

if (temperatura<=60) {
    console.log(`Temperatura: ${temperatura} °C`);
    console.log('Classificação: NORMAL');
} else if (temperatura>=61 && temperatura<=80) {
    console.log(`Temperatura: ${temperatura} °C`);
    console.log('Classificação: ATENÇÃO');   
} else {
    console.log(`Temperatura: ${temperatura} °C`);
    console.log('Classificação: CRÍTICA');
}