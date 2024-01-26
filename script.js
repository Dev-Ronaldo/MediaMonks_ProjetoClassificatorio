// Função para substituir caracteres especiais
function alterarCaracteresEspeciais(texto) {
  return texto
    .replaceAll(/ø/g, "o")
    .replaceAll(/JæC Motors/g, "JAC Motors")
    .replaceAll(/æ/g, "a");
}
// Função para corrigir a primeira letra para maiúscula
function mudarPrimeiraLetra(texto) {
  return texto.charAt(0).toUpperCase() + texto.slice(1);
}
// Função para corrigir os dados
function corrigirDados(dados) {
  for (const chave in dados) {
    if (dados.hasOwnProperty(chave)) {
      let valor = dados[chave];

      // Caracteres especiais em strings
      if (typeof valor === "string" || valor instanceof String) {
        // Substituindo caracteres especiais
        valor = alterarCaracteresEspeciais(valor);
        // Alterando a Primeira letra para maiúscula
        valor = mudarPrimeiraLetra(valor);
        dados[chave] = valor;
      }
      // Corrigir valores inteiros representados como strings
      if (chave === "vendas" && typeof valor === "string" && !isNaN(valor)) {
        dados[chave] = parseInt(valor);
      }
      // Se o valor for um objeto
      if (typeof valor === "object" && valor !== null) {
        corrigirDados(valor);
      }
    }
  }
}

// Leitura de arquivos utilizando require 
const fs = require("fs");
// Ler o arquivo JSON 'broken_database_1.json'
const arquivo = "broken_database_1.json";
const dadosJSON = fs.readFileSync(arquivo, "utf8");
const dados = JSON.parse(dadosJSON);

// Chamando a função para corrigir os dados
corrigirDados(dados);
// Salvando os dados corrigidos no arquivo 'correct_database_1.json'
const dadosCorrigidosJSON = JSON.stringify(dados, null, 2);
fs.writeFileSync("correct_database_1.json", dadosCorrigidosJSON);

// Lendo o arquivo JSON 'broken_database_2.json'
const arquivo2 = "broken_database_2.json";
const dadosJSON2 = fs.readFileSync(arquivo2, "utf8");
const dados2 = JSON.parse(dadosJSON2);

// Chamando a função para corrigir os dados
corrigirDados(dados2);
// Salvando os dados corrigidos no arquivo 'correct_database_2.json'
const dadosCorrigidosJSON2 = JSON.stringify(dados2, null, 2);
fs.writeFileSync("correct_database_2.json", dadosCorrigidosJSON2);
