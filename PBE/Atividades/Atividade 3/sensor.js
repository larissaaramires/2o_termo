function checarTemperatura(temperatura) {
    if (temperatura > 40) {
    return "ALERTA: Caldeira Superaquecida";
    } else {
        return "Temperatura normal :)";
    }
}

function checarUmidade(umidade) {
    if (umidade < 20) {
    return "ALERTA: Ar muito seco";
    } else {
        return "Umidade normal :)";
    }
}

module.exports = {
    checarTemperatura,
    checarUmidade
}