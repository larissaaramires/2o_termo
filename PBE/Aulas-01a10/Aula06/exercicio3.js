const entrada = require('readline-sync');

//Criando a "ferramenta" da conversão
function converterParaFahrenheit(celsius) {
    let fahrenheit = (celsius * 9/5) + 32;
    return fahrenheit; //devolve o resultado para quem chamou 
}

const tempC = entrada.questionFloat("Digite a temperatura em celsius: \n");

// Chamando a funçao e vguardando o que ela "cuspiu de volta"
const tempF = converterParaFahrenheit(tempC);

console.log(`A temperatura convertida é: ${tempF.toFixed(1)}F°`);