// PROJETO DO ALUNO - complete as funções abaixo.
// Execute com: npm start
const fs = require('node:fs');
const caminho = require('node:path');
const ARQUIVO = caminho.join(__dirname, 'maquinas.json');

function carregarMaquinas() {
const texto = fs.readFileSync(ARQUIVO, 'utf8');
const maquinas = JSON.parse(texto);
return maquinas;
}

function listarMaquinas(maquinas) {
maquinas.forEach(maquina => {
console.log(maquina.id + ' - ' + maquina.nome +
' - ' + maquina.status);
});
}

function buscarPorId(maquinas, id) {
return maquinas.find(maquina => maquina.id === id);
}

function filtrarPorStatus(maquinas, status) {
return maquinas.filter(maquina => maquina.________ === status);
}

function filtrarPorSetor(maquinas, setor) {
  return maquinas.filter(m => m.setor === setor);
}

function executar() {
  try {
    const maquinas = carregarMaquinas();

    console.log('\n=== TODAS AS MAQUINAS ===');
    listarMaquinas(maquinas);

    console.log('\n=== BUSCA PELO ID 3 ===');
    console.log(buscarPorId(maquinas, 3) ?? 'Maquina nao encontrada.');

    console.log('\n=== BUSCA PELO ID 99 ===');
    console.log(buscarPorId(maquinas, 99) ?? 'Maquina nao encontrada.');

    console.log('\n=== MAQUINAS EM MANUTENCAO ===');
    console.log(filtrarPorStatus(maquinas, 'manutencao'));

    console.log('\n=== MAQUINAS DO SETOR USINAGEM ===');
    console.log(filtrarPorSetor(maquinas, 'Usinagem'));
  } catch (erro) {
    console.error('Erro ao ler ou consultar o arquivo:', erro.message);
    process.exitCode = 1;
  }
}

 if (require.main === module) executar();
 module.exports = { carregarMaquinas, listarMaquinas, buscarPorId, filtrarPorStatus, filtrarPorSetor };