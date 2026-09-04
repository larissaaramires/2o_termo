function calcularBase (distanciaKm) {
    const valorKm = 2.10;
    const valorFrete = distanciaKm * valorKm;
    return valorFrete;
}

function calcularSeguro (valorCarga){
    return valorCarga * 1.01;
}

function verificarPrazo (distanciaKm) {
    if (distanciaKm < 100) {
        return "1 dia util";
    } else {
        return "3 a 5 dias uteis";
    }
}

module.exports = {
    calcularBase,
    calcularSeguro,
    verificarPrazo
}