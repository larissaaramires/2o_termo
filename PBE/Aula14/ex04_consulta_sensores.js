const fs = require('fs');

const sensores = [
    {codigo: 1, tipo: "Temperatura", valor: 80, unidade: "°C", status: "Normal"},
    {codigo: 2, tipo: "Pressão", valor: 120, unidade: "bar", status: "Alerta"},
    {codigo: 3, tipo: "Umidade", valor: 60, unidade: "%", status: "Normal"},
    {codigo: 4, tipo: "Ultrassônico", valor: 95, unidade: "kHz", status: "Normal"},
    {codigo: 5, tipo: "Vibração", valor: 30, unidade: "mm/s", status: "Normal"}
];

const GravandoDados = JSON.stringify(sensores, null, 2);

const arquivo = 'sensores.json';

fs.writeFileSync(arquivo,GravandoDados);

console.log('--- TODOS OS SENSORES ---');

sensores.forEach(sensor => {

    console.log(`\nCódigo: ${sensor.codigo}`);
    console.log(`Tipo: ${sensor.tipo}`);
    console.log(`Valor: ${sensor.valor} ${sensor.unidade}`);
    console.log(`Status: ${sensor.status}`);

});

console.log('\n--- SENSORES EM ALERTA ---');

let totalAlerta = 0;

sensores.forEach(sensor => {

    if (sensor.status === "Alerta") {

        console.log(`${sensor.codigo} - ${sensor.tipo}`);

        totalAlerta++;

    }

});

console.log(`\nTotal de sensores em alerta: ${totalAlerta}`);