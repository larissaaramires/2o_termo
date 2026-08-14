const entrada = require ('readline-sync');

// Criando a "maquina" de calcular media
function calcularMedia(n1, n2) {
    return (n1 + n2) / 2;
}

// Usando a maquina 
const numero1 = entrada.questionInt('Digite a primeira nota: ');
const numero2 = entrada.questionInt('Digite a segunda nota: ');
const resultado = calcularMedia(numero1, numero2);
console.log(`A media calculada foi: ${resultado}`);
