
const fs = require('node:fs');

function carregarFuncionarios() {
    const texto = fs.readFileSync('funcionarios.json', 'utf8');
    return JSON.parse(texto);
}

// Consulta pelo ID
function consultarPorId(funcionarios, id) {
    return funcionarios.find(funcionario => funcionario.id === id);
}

// Consulta pelo nome
function consultarPorNome(funcionarios, nome) {
    return funcionarios.find(
        funcionario => funcionario.nome.toLowerCase() === nome.toLowerCase()
    );
}

// Filtra pela função
function filtrarPorFuncao(funcionarios, funcao) {
    return funcionarios.filter(
        funcionario => funcionario.funcao.toLowerCase() === funcao.toLowerCase()
    );
}

// Mostra os dados encontrados
function mostrarFuncionario(funcionario) {
    if (!funcionario) {
        console.log('Funcionário não encontrado.');
        return;
    }

    console.log(
        `ID: ${funcionario.id} | Nome: ${funcionario.nome} | Idade: ${funcionario.idade} | Função: ${funcionario.funcao}`
    );
}

try {
    const funcionarios = carregarFuncionarios();

    console.log('=== TODOS OS FUNCIONÁRIOS ===');
    funcionarios.forEach(mostrarFuncionario);

    console.log('\n=== CONSULTA POR ID 2 ===');
    mostrarFuncionario(consultarPorId(funcionarios, 2));

    console.log('\n=== CONSULTA POR NOME ===');
    mostrarFuncionario(consultarPorNome(funcionarios, funcionarios[0].nome));

    console.log('\n=== FILTRO POR FUNÇÃO ===');
    const resultado = filtrarPorFuncao(funcionarios, funcionarios[0].funcao);

    if (resultado.length === 0) {
        console.log('Nenhum funcionário encontrado nessa função.');
    } else {
        resultado.forEach(mostrarFuncionario);
    }

} catch (erro) {
    console.error('Não foi possível ler o JSON.');
    console.error('Detalhe:', erro.message);
}
