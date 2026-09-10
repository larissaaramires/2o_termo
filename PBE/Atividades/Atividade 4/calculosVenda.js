function calcularTotal(preco, qtd) {
    return preco * qtd;
}

function gerarCupom(nome, total) {
    return `Cliente: ${nome} - Total: R$ ${total}`;
}

module.exports = {
    calcularTotal,
    gerarCupom
}