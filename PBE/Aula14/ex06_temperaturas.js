const fs = require('fs');

const temperaturas = [
    {temperatura: 23}, {temperatura: 180}, {temperatura: 250}, {temperatura: 390}, {temperatura: 300}
]

const GravandoDados = JSON.stringify(temperaturas, null, 2);

const arquivo = 'temperaturas.json';

fs.writeFileSync(arquivo,GravandoDados);

try {

    console.log('--- RELATÓRIO DE TEMPERATURA ---');

    temperaturas.forEach(leitura => {

        if (leitura.temperatura > 350) {
            throw new Error(`Temperatura de ${leitura.temperatura}°C excedeu o limite permitido.`);
        } else {
            console.log(`Leitura: ${leitura.temperatura}°C - NORMAL`);
        }

    });

} catch (erro) {

    console.log('\nALARME:');
    console.log(erro.message);

}