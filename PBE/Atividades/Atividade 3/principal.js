const entrada = require ('readline-sync');

const sensor = require('./sensor');

console.log('---GESTOR DE CLIMA INDUSTRIAL---');

const temperatura = entrada.questionFloat('Digite a temperatura: ');
const umidade = entrada.questionFloat('Digite a umidade: ');

console.log('---RESULTADOS---');

console.log(sensor.checarTemperatura(temperatura));
console.log(sensor.checarUmidade(umidade));