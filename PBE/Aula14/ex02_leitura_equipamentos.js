const fs = require('fs');

if (fs.existsSync('equipamentos.json')) {

    const dados = fs.readFileSync('equipamentos.json', 'utf-8');

    const equipamentos = JSON.parse(dados);

    console.log('--- RELATÓRIO DO CADASTRO DE EQUIPAMENTOS ---');

    equipamentos.forEach(equipamento => {

        console.log(`\nCódigo: ${equipamento.codigo}`);
        console.log(`Equipamento: ${equipamento.Nome}`);
        console.log(`Setor: ${equipamento.Setor}`);

        // Usei IA na linha 18 a 20 
        const status = equipamento.Operacional
            ? "OPERACIONAL"
            : "PARADA";

        console.log(`Status: ${status}`);

    });

} else {
    console.log('O arquivo equipamentos.json não existe.');
}