const entrada = require('readline-sync');

const manutencao = require('./funcoesManutencao');
const { calcularMaoDeObra } = require('./funcoesManutencao');
const { calcularTotal } = require('./funcoesManutencao');
const { verificarGarantia } = require('./funcoesManutencao');

console.log('--- SISTEMA MODULAR DE MANUTENÇÃO ---');
const nomeMaquina = entrada.question('Digite o nome da maquina: ');
const valorPecas = entrada.questionFloat('Digite o valor das pecas: ');
const horas = entrada.questionFloat('Digite as horas de servico: ');
const meses = entrada.questionInt('Digite os meses des da ultima manutencao: ');
const maoDeObra = calcularMaoDeObra(horas);
const total = calcularTotal(valorPecas, maoDeObra);
const garantia = verificarGarantia(meses);

console.log('--- RELATÓRIO FINAL ---');
console.log(`Nome da máquina: ${nomeMaquina}`);
console.log(`Mão de obra: R$ ${maoDeObra}`);
console.log(`Peças: R$ ${valorPecas}`);
console.log(`Total: R$ ${total}`);
console.log(`Garantia: ${garantia}`);