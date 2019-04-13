-- ------------------------------------------------------------
-- Tabela com os códigos do CST A.
-- O Código de Situação Tributária foi instituído com a finalidade de identificar a origem da mercadoria e identificar o regime de tributação a que esta sujeita a mercadoria, na operação praticada. É composto por três dígitos, onde o 1° dígito indicará a origem da mercadoria, com base na Tabela A e os dois últimos dígitos a tributação pelo ICMS, com base na Tabela B.
-- ------------------------------------------------------------

CREATE TABLE CST_A_ICMS (
  ID INTEGER  NOT NULL  ,
  CODIGO CHAR(1)  NOT NULL  ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Tabela com os códigos do CST B.
-- O Código de Situação Tributária foi instituído com a finalidade de identificar a origem da mercadoria e identificar o regime de tributação a que esta sujeita a mercadoria, na operação praticada. É composto por três dígitos, onde o 1° dígito indicará a origem da mercadoria, com base na Tabela A e os dois últimos dígitos a tributação pelo ICMS, com base na Tabela B.
-- ------------------------------------------------------------

CREATE TABLE CST_B_ICMS (
  ID INTEGER  NOT NULL  ,
  CODIGO CHAR(3)  NOT NULL  ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));



CREATE TABLE CSOSN (
  ID INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)    ,
  CODIGO INTEGER      ,
PRIMARY KEY(ID));



CREATE TABLE COTACAO_COMPRA (
  ID INTEGER  NOT NULL  ,
  DATA_COTACAO DATE    ,
  DESCRICAO VARCHAR(100)      ,
PRIMARY KEY(ID));



CREATE TABLE MOEDAS (
  ID INTEGER  NOT NULL  ,
  NOME VARCHAR(50)    ,
  SIGLA VARCHAR(10)      ,
PRIMARY KEY(ID));



CREATE TABLE MATRIZ (
  ID INTEGER  NOT NULL  ,
  RAZAO_SOCIAL VARCHAR(100)    ,
  CNPJ VARCHAR(14)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Armazena os dados dos terminais de caixa.
-- ------------------------------------------------------------

CREATE TABLE ECF_CAIXA (
  ID INTEGER  NOT NULL  ,
  NOME VARCHAR(30)    ,
  DATA_CADASTRO DATE      ,
PRIMARY KEY(ID));



CREATE TABLE CST_PIS (
  ID INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)    ,
  CODIGO INTEGER      ,
PRIMARY KEY(ID));



CREATE TABLE CST_COFINS (
  ID INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)    ,
  CODIGO INTEGER      ,
PRIMARY KEY(ID));



CREATE TABLE CST_IPI (
  ID INTEGER  NOT NULL  ,
  DECRICAO VARCHAR(100)    ,
  CODIGO INTEGER      ,
PRIMARY KEY(ID));



CREATE TABLE SALARIO_MINIMO (
  ID INTEGER  NOT NULL  ,
  COMPETENCIA VARCHAR(7)    ,
  VALOR DECIMAL(18,6)      ,
PRIMARY KEY(ID));




-- ------------------------------------------------------------
-- Seção do NCM
-- ------------------------------------------------------------

CREATE TABLE NCM_SECAO (
  ID INTEGER  NOT NULL  ,
  SECAO CHAR(2)  NOT NULL  ,
  DESCRICAO_SECAO TEXT      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Armazena os possíveis estados civis. De acordo com as leis brasileiras, os possíveis estados civis são:
-- 
--     * Solteiro(a) - quem nunca se casou, ou que teve o casamento anulado
--     * Casado(a) - quem contraiu matrimônio, independente do regime de bens adotado
--     * Separado(a) judicialmente - quem não vive mais com o cônjuge (vive em separação física dele), mas que ainda não obteve o divórcio, todavia obteve sentença que deliberou por decretar a separação judicial dos cônjuges, cessando, assim, os deveres oriundos da sociedade conjugal.
--     * Divorciado(a) - após a homologação do divórcio pela justiça
--     * Viúvo(a) - pessoa cujo cônjuge faleceu.
-- ------------------------------------------------------------

CREATE TABLE ESTADO_CIVIL (
  ID INTEGER  NOT NULL  ,
  NOME VARCHAR(50)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Tabela IRRF
-- ------------------------------------------------------------

CREATE TABLE IRRF (
  ID INTEGER  NOT NULL  ,
  COMPETENCIA VARCHAR(7)    ,
  DESCONTO_POR_DEPENDENTE DECIMAL(18,6)    ,
  MINIMO_PARA_RETENCAO DECIMAL(18,6)      ,
PRIMARY KEY(ID));




-- ------------------------------------------------------------
-- Armazena os lotes de lançamento.
-- ------------------------------------------------------------

CREATE TABLE CONTABIL_LOTE (
  ID INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)    ,
  LIBERADO CHAR(1)    ,
  ID_USUARIO INTEGER    ,
  DATA_INC DATE    ,
  DATA_LIBERACAO DATE    ,
  MODULO_ORIGEM VARCHAR(30)    ,
  PROGRAMADO CHAR(1)      ,
PRIMARY KEY(ID));



CREATE TABLE PLANO_CENTRO_RESULTADO (
  ID INTEGER  NOT NULL  ,
  NOME INTEGER    ,
  MASCARA VARCHAR(50)    ,
  NIVEIS INTEGER    ,
  DATA_INC INTEGER      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Pedido Normal: Quando nao existe nenhuma programacao de entrega ou seja, a entrega do material é feita de uma unica vez.
-- 
-- Pedido Planejado: O comprador negocia um determinado material mas não quer armazenar o consumo do ano em seu estoque, neste caso o comprador poderia fazer o pedido para o ano todo porém as entregas seriam mensais já que o comprador sabe o consumo mensal. 
-- 
-- Pedido Aberto: O Comprador negocia um determinado material mas não sabe o consumo mensal durante o ano, neste caso ele gera liberacoes conforme necessidade.
-- ------------------------------------------------------------

CREATE TABLE TIPO_PEDIDO_COMPRA (
  ID INTEGER  NOT NULL  ,
  CODIGO CHAR(2)    ,
  NOME VARCHAR(30)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));




-- ------------------------------------------------------------
-- Plano contabil do SPED.
-- ------------------------------------------------------------

CREATE TABLE PLANO_CONTA_REF_SPED (
  ID INTEGER  NOT NULL  ,
  COD_CTA_REF VARCHAR(30)    ,
  DESCRICAO VARCHAR(100)    ,
  ORIENTACOES TEXT    ,
  INICIO_VALIDADE DATE    ,
  FIM_VALIDADE DATE    ,
  TIPO CHAR(1)      ,
PRIMARY KEY(ID));




-- ------------------------------------------------------------
-- Posição do NCM
-- ------------------------------------------------------------

CREATE TABLE NCM_POSICAO (
  ID INTEGER  NOT NULL  ,
  POSICAO_NCM CHAR(4)  NOT NULL  ,
  DESCRICAO_POSICAO TEXT      ,
PRIMARY KEY(ID));



CREATE TABLE PLANO_NAT_FINANCEIRA (
  ID INTEGER  NOT NULL  ,
  NOME VARCHAR(100)    ,
  DATA_INC DATE    ,
  MASCARA VARCHAR(50)    ,
  NIVEIS INTEGER      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Armazena as configurações do terminal de caixa.
-- ------------------------------------------------------------

CREATE TABLE ECF_CONFIGURACAO (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_ECF_IMPRESSORA INTEGER    ,
  ID_ECF_RESOLUCAO INTEGER    ,
  ID_ECF_CAIXA INTEGER    ,
  ID_ECF_EMPRESA INTEGER    ,
  MENSAGEM_CUPOM VARCHAR(250)    ,
  PORTA_ECF CHAR(10)    ,
  IP_SERVIDOR VARCHAR(15)    ,
  IP_SITEF VARCHAR(15)    ,
  TIPO_TEF CHAR(2)    ,
  TITULO_TELA_CAIXA VARCHAR(100)    ,
  CAMINHO_IMAGENS_PRODUTOS VARCHAR(250)    ,
  CAMINHO_IMAGENS_MARKETING VARCHAR(250)    ,
  CAMINHO_IMAGENS_LAYOUT VARCHAR(250)    ,
  COR_JANELAS_INTERNAS VARCHAR(20)    ,
  MARKETING_ATIVO CHAR(1)    ,
  CFOP_ECF INTEGER    ,
  CFOP_NF2 INTEGER    ,
  TIMEOUT_ECF INTEGER    ,
  INTERVALO_ECF INTEGER    ,
  DESCRICAO_SUPRIMENTO VARCHAR(20)    ,
  DESCRICAO_SANGRIA VARCHAR(20)    ,
  TEF_TIPO_GP INTEGER    ,
  TEF_TEMPO_ESPERA INTEGER    ,
  TEF_ESPERA_STS INTEGER    ,
  TEF_NUMERO_VIAS INTEGER    ,
  DECIMAIS_QUANTIDADE INTEGER    ,
  DECIMAIS_VALOR INTEGER    ,
  BITS_POR_SEGUNDO INTEGER    ,
  QTDE_MAXIMA_CARTOES INTEGER    ,
  PESQUISA_PARTE CHAR(1)    ,
  CONFIGURACAO_BALANCA VARCHAR(100)    ,
  PARAMETROS_DIVERSOS VARCHAR(250)    ,
  ULTIMA_EXCLUSAO INTEGER    ,
  LAUDO VARCHAR(10)    ,
  INDICE_GERENCIAL VARCHAR(100)    ,
  DATA_ATUALIZACAO_ESTOQUE DATE    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));













-- ------------------------------------------------------------
-- Armazena o detallhe das vendas.
-- ------------------------------------------------------------

CREATE TABLE ECF_VENDA_DETALHE (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_ECF_PRODUTO INTEGER    ,
  ID_ECF_VENDA_CABECALHO INTEGER    ,
  CFOP INTEGER  NOT NULL  ,
  ITEM INTEGER    ,
  QUANTIDADE DECIMAL(18,6)    ,
  VALOR_UNITARIO DECIMAL(18,6)    ,
  VALOR_TOTAL DECIMAL(18,6)    ,
  TOTAL_ITEM DECIMAL(18,6)    ,
  BASE_ICMS DECIMAL(18,6)    ,
  TAXA_ICMS DECIMAL(18,6)    ,
  ICMS DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  DESCONTO DECIMAL(18,6)    ,
  TAXA_ISSQN DECIMAL(18,6)    ,
  ISSQN DECIMAL(18,6)    ,
  TAXA_PIS DECIMAL(18,6)    ,
  PIS DECIMAL(18,6)    ,
  TAXA_COFINS DECIMAL(18,6)    ,
  COFINS DECIMAL(18,6)    ,
  TAXA_ACRESCIMO DECIMAL(18,6)    ,
  ACRESCIMO DECIMAL(18,6)    ,
  ACRESCIMO_RATEIO DECIMAL(18,6)    ,
  DESCONTO_RATEIO DECIMAL(18,6)    ,
  TOTALIZADOR_PARCIAL VARCHAR(10)    ,
  CST CHAR(3)    ,
  CANCELADO CHAR(1)    ,
  MOVIMENTA_ESTOQUE CHAR(1)    ,
  HASH_TRIPA VARCHAR(32)    ,
  HASH_INCREMENTO INTEGER    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));





CREATE TABLE TRIBUTACAO_PIS (
  ID INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Armazena o cabeçalho das vendas.
-- ------------------------------------------------------------

CREATE TABLE ECF_VENDA_CABECALHO (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_CLIENTE INTEGER    ,
  ID_ECF_FUNCIONARIO INTEGER    ,
  ID_ECF_MOVIMENTO INTEGER    ,
  ID_ECF_DAV INTEGER    ,
  ID_ECF_PRE_VENDA_CABECALHO INTEGER    ,
  CFOP INTEGER  NOT NULL  ,
  COO INTEGER    ,
  CCF INTEGER    ,
  DATA_VENDA DATE    ,
  HORA_VENDA VARCHAR(8)    ,
  VALOR_VENDA DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  DESCONTO DECIMAL(18,6)    ,
  TAXA_ACRESCIMO DECIMAL(18,6)    ,
  ACRESCIMO DECIMAL(18,6)    ,
  VALOR_FINAL DECIMAL(18,6)    ,
  VALOR_RECEBIDO DECIMAL(18,6)    ,
  TROCO DECIMAL(18,6)    ,
  VALOR_CANCELADO DECIMAL(18,6)    ,
  TOTAL_PRODUTOS DECIMAL(18,6)    ,
  TOTAL_DOCUMENTO DECIMAL(18,6)    ,
  BASE_ICMS DECIMAL(18,6)    ,
  ICMS DECIMAL(18,6)    ,
  ICMS_OUTRAS DECIMAL(18,6)    ,
  ISSQN DECIMAL(18,6)    ,
  PIS DECIMAL(18,6)    ,
  COFINS DECIMAL(18,6)    ,
  ACRESCIMO_ITENS DECIMAL(18,6)    ,
  DESCONTO_ITENS DECIMAL(18,6)    ,
  STATUS_VENDA CHAR(1)    ,
  NOME_CLIENTE VARCHAR(100)    ,
  CPF_CNPJ_CLIENTE VARCHAR(14)    ,
  CUPOM_CANCELADO CHAR(1)    ,
  HASH_TRIPA VARCHAR(32)    ,
  HASH_INCREMENTO INTEGER    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));





-- ------------------------------------------------------------
-- Armazena os tipos de pagamentos de determinada venda.
-- ------------------------------------------------------------

CREATE TABLE ECF_TOTAL_TIPO_PGTO (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_ECF_VENDA_CABECALHO INTEGER    ,
  ID_ECF_TIPO_PAGAMENTO INTEGER    ,
  VALOR DECIMAL(18,6)    ,
  NSU VARCHAR(30)    ,
  ESTORNO CHAR(1)    ,
  REDE VARCHAR(10)    ,
  CARTAO_DC CHAR(1)    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));






-- ------------------------------------------------------------
-- Armazena os turnos que podem ser utilizados em determinado movimento. Exemplos:
-- 
-- Manha
-- Tarde
-- Noite
-- ------------------------------------------------------------

CREATE TABLE ECF_TURNO (
  ID INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(10)    ,
  HORA_INICIO VARCHAR(8)    ,
  HORA_FIM VARCHAR(8)      ,
PRIMARY KEY(ID));



CREATE TABLE TRIBUTACAO_COFINS (
  ID INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Tabela que armazena os dados dos impostos estaduais.
-- ------------------------------------------------------------

CREATE TABLE TRIBUTACAO_ESTADUAL (
  ID INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(50)    ,
  DATA_CADASTRO DATE    ,
  DATA_ALTERACAO DATE    ,
  TAXA_ISSQN DECIMAL(18,6)    ,
  TAXA_ICMS DECIMAL(18,6)    ,
  CFOP_FORA INTEGER    ,
  CFOP_DENTRO INTEGER    ,
  CST_A_ICMS CHAR(1)    ,
  CST_B_ICMS CHAR(3)    ,
  CST_ECF CHAR(3)    ,
  CSOSN CHAR(4)      ,
PRIMARY KEY(ID));



CREATE TABLE PLANO_CONTAS (
  ID INTEGER  NOT NULL  ,
  NOME INTEGER    ,
  DATA_INC DATE    ,
  MASCARA VARCHAR(50)    ,
  NIVEIS INTEGER      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Armazena as marcas dos produtos.
-- ------------------------------------------------------------

CREATE TABLE MARCA_PRODUTO (
  ID INTEGER  NOT NULL  ,
  NOME VARCHAR(50)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Lote dos produtos.
-- ------------------------------------------------------------

CREATE TABLE LOTE_PRODUTO (
  ID INTEGER  NOT NULL    ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Armazena os movimentos para determinado caixa. Podem haver vários movimentos durante um dia. Um movimento deve ter obrigatoriamente:
-- 
-- -Operador
-- -Caixa (terminal)
-- -Impressora
-- -Turno
-- -Status
-- 
-- É através dessa tabela que o caixa deve funcionar. Sem um movimento aberto não pode haver movimentação no caixa.
-- ------------------------------------------------------------

CREATE TABLE ECF_MOVIMENTO (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_ECF_EMPRESA INTEGER    ,
  ID_ECF_TURNO INTEGER    ,
  ID_ECF_IMPRESSORA INTEGER    ,
  ID_ECF_OPERADOR INTEGER    ,
  ID_ECF_CAIXA INTEGER    ,
  ID_GERENTE_SUPERVISOR INTEGER  NOT NULL  ,
  DATA_ABERTURA DATE    ,
  HORA_ABERTURA VARCHAR(8)    ,
  DATA_FECHAMENTO DATE    ,
  HORA_FECHAMENTO VARCHAR(8)    ,
  TOTAL_SUPRIMENTO DECIMAL(18,6)    ,
  TOTAL_SANGRIA DECIMAL(18,6)    ,
  TOTAL_NAO_FISCAL DECIMAL(18,6)    ,
  TOTAL_VENDA DECIMAL(18,6)    ,
  TOTAL_DESCONTO DECIMAL(18,6)    ,
  TOTAL_ACRESCIMO DECIMAL(18,6)    ,
  TOTAL_FINAL DECIMAL(18,6)    ,
  TOTAL_RECEBIDO DECIMAL(18,6)    ,
  TOTAL_TROCO DECIMAL(18,6)    ,
  TOTAL_CANCELADO DECIMAL(18,6)    ,
  STATUS_MOVIMENTO CHAR(1)  NOT NULL  ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));





-- ------------------------------------------------------------
-- Armazena os dados dos componentes para que sejam arrumados na tela de acordo com a resolução selecionada.
-- ------------------------------------------------------------

CREATE TABLE ECF_POSICAO_COMPONENTES (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_ECF_RESOLUCAO INTEGER    ,
  NOME VARCHAR(100)    ,
  ALTURA INTEGER    ,
  LARGURA INTEGER    ,
  TOPO INTEGER    ,
  ESQUERDA INTEGER    ,
  TAMANHO_FONTE INTEGER   DEFAULT 0 ,
  TEXTO VARCHAR(250)    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Armazena os dados das impressoras (ECF).
-- ------------------------------------------------------------

CREATE TABLE ECF_IMPRESSORA (
  ID INTEGER  NOT NULL  ,
  NUMERO INTEGER    ,
  CODIGO VARCHAR(10)    ,
  SERIE VARCHAR(20)    ,
  IDENTIFICACAO VARCHAR(250)    ,
  MC CHAR(2)    ,
  MD CHAR(2)    ,
  VR CHAR(2)    ,
  TIPO VARCHAR(7)    ,
  MARCA VARCHAR(30)    ,
  MODELO VARCHAR(30)    ,
  MODELO_ACBR VARCHAR(30)    ,
  MODELO_DOCUMENTO_FISCAL CHAR(2)    ,
  VERSAO VARCHAR(30)    ,
  LE CHAR(1)    ,
  LEF CHAR(1)    ,
  MFD CHAR(1)    ,
  LACRE_NA_MFD CHAR(1)    ,
  DOCTO VARCHAR(60)      ,
PRIMARY KEY(ID));











-- ------------------------------------------------------------
-- Armazena os documentos que são emitidos durante o movimento.
-- ------------------------------------------------------------

CREATE TABLE ECF_DOCUMENTOS_EMITIDOS (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_ECF_MOVIMENTO INTEGER    ,
  DATA_EMISSAO DATE    ,
  HORA_EMISSAO VARCHAR(8)    ,
  TIPO CHAR(2)    ,
  COO INTEGER    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));




CREATE TABLE ECF_FECHAMENTO (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_ECF_MOVIMENTO INTEGER    ,
  TIPO_PAGAMENTO VARCHAR(20)    ,
  VALOR DECIMAL(18,6)    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Armazena todos os suprimentos que são feitos no caixa. Tem relacionamento direto com a tabela de movimento, já que um suprimento só pode ser feito se houver um movimento aberto.
-- ------------------------------------------------------------

CREATE TABLE ECF_SUPRIMENTO (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_ECF_MOVIMENTO INTEGER    ,
  DATA_SUPRIMENTO DATE    ,
  VALOR DECIMAL(18,6)    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Armazena os possíveis tipos de pagamento:
-- 
-- Dinheiro
-- Cartão
-- Cheque
-- Etc.
-- ------------------------------------------------------------

CREATE TABLE ECF_TIPO_PAGAMENTO (
  ID INTEGER  NOT NULL  ,
  CODIGO CHAR(3)    ,
  DESCRICAO VARCHAR(20)    ,
  TEF CHAR(1)    ,
  IMPRIME_VINCULADO CHAR(1)    ,
  PERMITE_TROCO CHAR(1)    ,
  TEF_TIPO_GP CHAR(1)    ,
  GERA_PARCELAS CHAR(1)      ,
PRIMARY KEY(ID));








-- ------------------------------------------------------------
-- Armazena todas as sangrias que são feitas no caixa. Tem relacionamento direto com a tabela de movimento, já que uma sangria só pode ser feita se houver um 
-- movimento aberto.
-- ------------------------------------------------------------

CREATE TABLE ECF_SANGRIA (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_ECF_MOVIMENTO INTEGER    ,
  DATA_SANGRIA DATE    ,
  VALOR DECIMAL(18,6)    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Armazena os recebimentos que ocorrem via ECF, mas que não tem natureza fiscal.
-- ------------------------------------------------------------

CREATE TABLE ECF_RECEBIMENTO_NAO_FISCAL (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_ECF_MOVIMENTO INTEGER    ,
  DATA_RECEBIMENTO DATE    ,
  DESCRICAO VARCHAR(50)    ,
  VALOR DECIMAL(18,6)    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Armazena as resoluções que podem ser trabalhadas pelo terminal de caixa.
-- ------------------------------------------------------------

CREATE TABLE ECF_RESOLUCAO (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  RESOLUCAO_TELA VARCHAR(20)    ,
  LARGURA INTEGER    ,
  ALTURA INTEGER    ,
  IMAGEM_TELA VARCHAR(50)    ,
  IMAGEM_MENU VARCHAR(50)    ,
  IMAGEM_SUBMENU VARCHAR(50)    ,
  HOTTRACK_COLOR VARCHAR(20)    ,
  ITEM_STYLE_FONT_NAME VARCHAR(20)    ,
  ITEM_STYLE_FONT_COLOR VARCHAR(20)    ,
  ITEM_SEL_STYLE_COLOR VARCHAR(20)    ,
  LABEL_TOTAL_GERAL_FONT_COLOR VARCHAR(20)    ,
  ITEM_STYLE_FONT_STYLE VARCHAR(20)    ,
  EDITS_COLOR VARCHAR(20)    ,
  EDITS_FONT_COLOR VARCHAR(20)    ,
  EDITS_DISABLED_COLOR VARCHAR(20)    ,
  EDITS_FONT_NAME VARCHAR(20)    ,
  EDITS_FONT_STYLE VARCHAR(20)    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- CÓDIGO FISCAL DE OPERAÇÕES E PRESTAÇÕES - CFOP
-- ------------------------------------------------------------

CREATE TABLE CFOP (
  ID INTEGER  NOT NULL  ,
  CFOP INTEGER    ,
  DESCRICAO TEXT    ,
  APLICACAO TEXT    ,
  MOVIMENTA_ESTOQUE CHAR(1)    ,
  TIPO_OPERACAO CHAR(1)    ,
  ORIGEM  CHAR(1)    ,
  ALTERA_CUSTO_PRODUTO CHAR(1)    ,
  MOVIMENTA_FINANCEIRO CHAR(1)    ,
  PERMITE_CREDITO_ICMS CHAR(1)    ,
  PERMITE_CREDITO_IPI CHAR(1)    ,
  PERMITE_CREDITO_PIS CHAR(1)    ,
  PERMITE_CREDITO_COFINS CHAR(1)      ,
PRIMARY KEY(ID));








-- ------------------------------------------------------------
-- Armazena os dados de cabeçalho da Nota Fiscal Modelo 2.
-- ------------------------------------------------------------

CREATE TABLE NOTA_FISCAL_CABECALHO (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_ECF_FUNCIONARIO INTEGER    ,
  ID_CLIENTE INTEGER    ,
  CFOP INTEGER  NOT NULL  ,
  NUMERO VARCHAR(6)    ,
  DATA_EMISSAO DATE    ,
  HORA_EMISSAO VARCHAR(8)    ,
  SERIE CHAR(2)    ,
  SUBSERIE CHAR(2)    ,
  TOTAL_PRODUTOS DECIMAL(18,6)    ,
  TOTAL_NF DECIMAL(18,6)    ,
  BASE_ICMS DECIMAL(18,6)    ,
  ICMS DECIMAL(18,6)    ,
  ICMS_OUTRAS DECIMAL(18,6)    ,
  ISSQN DECIMAL(18,6)    ,
  PIS DECIMAL(18,6)    ,
  COFINS DECIMAL(18,6)    ,
  IPI DECIMAL(18,6)    ,
  TAXA_ACRESCIMO DECIMAL(18,6)    ,
  ACRESCIMO DECIMAL(18,6)    ,
  ACRESCIMO_ITENS DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  DESCONTO DECIMAL(18,6)    ,
  DESCONTO_ITENS DECIMAL(18,6)    ,
  CANCELADA CHAR(1)    ,
  TIPO_NOTA CHAR(1)    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));





-- ------------------------------------------------------------
-- Armazena os dados de detalhe da Nota Fiscal Modelo 2.
-- ------------------------------------------------------------

CREATE TABLE NOTA_FISCAL_DETALHE (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA INTEGER    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_NF_CABECALHO INTEGER    ,
  ID_PRODUTO INTEGER    ,
  CFOP INTEGER  NOT NULL  ,
  ITEM INTEGER    ,
  QUANTIDADE DECIMAL(18,6)    ,
  VALOR_UNITARIO DECIMAL(18,6)    ,
  VALOR_TOTAL DECIMAL(18,6)    ,
  BASE_ICMS DECIMAL(18,6)    ,
  TAXA_ICMS DECIMAL(18,6)    ,
  ICMS DECIMAL(18,6)    ,
  ICMS_OUTRAS DECIMAL(18,6)    ,
  ICMS_ISENTO DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  DESCONTO DECIMAL(18,6)    ,
  TAXA_ISSQN DECIMAL(18,6)    ,
  ISSQN DECIMAL(18,6)    ,
  TAXA_PIS DECIMAL(18,6)    ,
  PIS DECIMAL(18,6)    ,
  TAXA_COFINS DECIMAL(18,6)    ,
  COFINS DECIMAL(18,6)    ,
  TAXA_ACRESCIMO DECIMAL(18,6)    ,
  ACRESCIMO DECIMAL(18,6)    ,
  TAXA_IPI DECIMAL(18,6)    ,
  IPI DECIMAL(18,6)    ,
  CANCELADO CHAR(1)    ,
  CST CHAR(3)    ,
  MOVIMENTA_ESTOQUE CHAR(1)    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));





CREATE TABLE CBO (
  ID INTEGER  NOT NULL  ,
  CODIGO INTEGER    ,
  NOME VARCHAR(100)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Relação de Reduções Z;
-- ------------------------------------------------------------

CREATE TABLE R02 (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_OPERADOR INTEGER  NOT NULL  ,
  ID_IMPRESSORA INTEGER  NOT NULL  ,
  ID_ECF_CAIXA INTEGER    ,
  CRZ INTEGER    ,
  COO INTEGER    ,
  CRO INTEGER    ,
  DATA_MOVIMENTO DATE    ,
  DATA_EMISSAO DATE    ,
  HORA_EMISSAO VARCHAR(8)    ,
  VENDA_BRUTA DECIMAL(18,6)    ,
  GRANDE_TOTAL DECIMAL(18,6)    ,
  HASH_TRIPA VARCHAR(32)    ,
  HASH_INCREMENTO INTEGER    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));




-- ------------------------------------------------------------
-- Tabela com os níveis de formação.
-- ------------------------------------------------------------

CREATE TABLE NIVEL_FORMACAO (
  ID INTEGER  NOT NULL  ,
  NOME VARCHAR(20)    ,
  DESCRICAO TEXT    ,
  GRAU_INSTRUCAO_CAGED INTEGER      ,
PRIMARY KEY(ID));




-- ------------------------------------------------------------
--  Esta tabela irá armazenar os codigos da ( Tabela 4.3.5 da EFD PIS COFINS), com a finalidade de gerar o SPED PIS COFINS e também o DACON.
-- ------------------------------------------------------------

CREATE TABLE COD_APURACAO (
  ID INTEGER  NOT NULL  ,
  CODIGO INTEGER    ,
  DESCRICAO VARCHAR(255)      ,
PRIMARY KEY(ID));



CREATE TABLE HOLDING (
  ID INTEGER  NOT NULL  ,
  NOME INTEGER    ,
  TIPO_LIGACAO CHAR(1)    ,
  PARTIC_CAPITAL_VOTANTE DECIMAL(18,6)    ,
  PARTIC_CAPITAL_TOTAL DECIMAL(18,6)    ,
  CNPJ VARCHAR(14)      ,
PRIMARY KEY(ID));




-- ------------------------------------------------------------
-- A finalidade desta tabela é armazenar os codigos dos tipos de Receita da DACON. 
-- ------------------------------------------------------------

CREATE TABLE TIPO_RECEITA_DACON (
  ID INTEGER  NOT NULL  ,
  CODIGO INTEGER    ,
  DESCRICAO VARCHAR(50)    ,
  OBS BLOB      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Armazena os tipos de admissão do colaborador.
-- ------------------------------------------------------------

CREATE TABLE TIPO_ADMISSAO (
  ID INTEGER  NOT NULL  ,
  CODIGO CHAR(3)    ,
  NOME VARCHAR(100)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));




-- ------------------------------------------------------------
-- A CNAE - Classificação Nacional de Atividades Econômicas é o instrumento de padronização nacional dos códigos de atividade econômica e dos critérios de enquadramento utilizados pelos diversos órgãos da Administração Tributária do país.
-- 
-- EX.:
--    Seção:  A  AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA
--    Divisão:  01  AGRICULTURA, PECUÁRIA E SERVIÇOS RELACIONADOS
--    Grupo:  011  PRODUÇÃO DE LAVOURAS TEMPORÁRIAS
--    Classe:  0111-3  CULTIVO DE CEREAIS
--    Subclasse  0111-3/01  CULTIVO DE ARROZ
-- ------------------------------------------------------------

CREATE TABLE CNAE (
  ID INTEGER  NOT NULL  ,
  DENOMINACAO TEXT    ,
  CODIGO VARCHAR(7)      ,
PRIMARY KEY(ID));



CREATE TABLE CATEGORIA_TRAB_SEFIP (
  ID INTEGER  NOT NULL  ,
  CODIGO INTEGER    ,
  NOME VARCHAR(100)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Permite agrupar clientes e fornecedores por segmentos e ramos de atividades.
-- ------------------------------------------------------------

CREATE TABLE ATIVIDADE_FOR_CLI (
  ID INTEGER  NOT NULL  ,
  NOME VARCHAR(50)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));



CREATE TABLE TIPO_RECEITA_DIPI (
  ID INTEGER  NOT NULL  ,
  DESCRICAO INTEGER      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Tabela de países.
-- ------------------------------------------------------------

CREATE TABLE PAIS (
  ID INTEGER  NOT NULL  ,
  CODIGO INTEGER    ,
  NOME_EN VARCHAR(100)    ,
  NOME_PTBR VARCHAR(100)    ,
  SIGLA2 CHAR(2)    ,
  SIGLA3 CHAR(3)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Tabela com os tipos de relacionamento.
-- ------------------------------------------------------------

CREATE TABLE TIPO_RELACIONAMENTO (
  ID INTEGER  NOT NULL  ,
  CODIGO CHAR(3)    ,
  NOME VARCHAR(20)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));




-- ------------------------------------------------------------
-- Tabela que define os papéis do sistema.
-- ------------------------------------------------------------

CREATE TABLE PAPEL (
  ID INTEGER  NOT NULL  ,
  NOME VARCHAR(20)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Tabela com a relação de bancos.
-- ------------------------------------------------------------

CREATE TABLE BANCO (
  ID INTEGER  NOT NULL  ,
  CODIGO VARCHAR(10)    ,
  NOME VARCHAR(100)    ,
  URL VARCHAR(255)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Tipos de e-mails
-- ------------------------------------------------------------

CREATE TABLE TIPO_EMAIL (
  ID INTEGER  NOT NULL  ,
  NOME VARCHAR(20)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Tipos de colaboradores
-- ------------------------------------------------------------

CREATE TABLE TIPO_COLABORADOR (
  ID INTEGER  NOT NULL  ,
  NOME VARCHAR(20)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Armazena a informação do tipo de item que é gerado para o arquivo do SPED: Registro 200 - Campo 7.
-- Tipos:
-- 
-- 00-Mercadoria para Revenda;
-- 01-Matéria-Prima;
-- 02-Embalagem;
-- 03-Produto em Processo;
-- 04-Produto Acabado;
-- 05-Subproduto;
-- 06-Produto Intermediário;
-- 07-Material de Uso e Consumo;
-- 08-Ativo Imobilizado;
-- 09-Serviços;
-- 10-Outros insumos;
-- 99-Outras
-- ------------------------------------------------------------

CREATE TABLE TIPO_ITEM_SPED (
  ID INTEGER  NOT NULL  ,
  CODIGO CHAR(2)    ,
  DESCRICAO VARCHAR(50)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Esta tabela irá armazenar as diversas tributações do ICMS existentes para cada empresa,
-- ------------------------------------------------------------

CREATE TABLE TRIBUTACAO_ICMS (
  ID INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Tipo de telefone
-- ------------------------------------------------------------

CREATE TABLE TIPO_TELEFONE (
  ID INTEGER  NOT NULL  ,
  NOME VARCHAR(20)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Detalhe do Cupom Fiscal e do Documento Não Fiscal - Meio de Pagamento;
-- ------------------------------------------------------------

CREATE TABLE R07 (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(8)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_R06 INTEGER    ,
  CCF INTEGER    ,
  MEIO_PAGAMENTO VARCHAR(20)    ,
  VALOR_PAGAMENTO DECIMAL(18,6)    ,
  ESTORNO CHAR(1)    ,
  VALOR_ESTORNO DECIMAL(18,6)    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));



CREATE TABLE TRIBUTACAO_IPI (
  ID INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)      ,
PRIMARY KEY(ID));



CREATE TABLE FPAS (
  ID INTEGER  NOT NULL  ,
  CODIGO_FPAS INTEGER    ,
  DESCRICAO VARCHAR(255)    ,
  CODIGO_TERCEIRO DECIMAL(4)    ,
  PERCENTUAL_TERCEIROS DECIMAL(18,6)    ,
  PERCENTUAL_INSS_PATRONAL DECIMAL(18,6)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Demais documentos emitidos pelo ECF;
-- ------------------------------------------------------------

CREATE TABLE R06 (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_OPERADOR INTEGER  NOT NULL  ,
  ID_IMPRESSORA INTEGER  NOT NULL  ,
  ID_ECF_CAIXA INTEGER    ,
  COO INTEGER    ,
  GNF INTEGER    ,
  GRG INTEGER    ,
  CDC INTEGER    ,
  DENOMINACAO CHAR(2)    ,
  DATA_EMISSAO DATE    ,
  HORA_EMISSAO VARCHAR(8)    ,
  HASH_TRIPA VARCHAR(32)    ,
  HASH_INCREMENTO INTEGER    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));





-- ------------------------------------------------------------
-- Identifica a situação (ativo, inativo, bloqueado, desbloqueado...)
-- ------------------------------------------------------------

CREATE TABLE SITUACAO_FOR_CLI (
  ID INTEGER  NOT NULL  ,
  NOME VARCHAR(20)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Situações possíveis para o colaborador dentro da empresa.
-- ------------------------------------------------------------

CREATE TABLE SITUACAO_COLABORADOR (
  ID INTEGER  NOT NULL  ,
  CODIGO CHAR(3)    ,
  NOME VARCHAR(100)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));




-- ------------------------------------------------------------
-- Tabela com as unidades de produto.
-- ------------------------------------------------------------

CREATE TABLE UNIDADE_PRODUTO (
  ID INTEGER  NOT NULL  ,
  SIGLA VARCHAR(10)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Armazena as faixas e os percentuais para o desconto do INSS, os valores para o salário família.
-- ------------------------------------------------------------

CREATE TABLE INSS (
  ID INTEGER  NOT NULL  ,
  COMPETENCIA VARCHAR(7)      ,
PRIMARY KEY(ID));




-- ------------------------------------------------------------
-- Tabela que armazena os dados da PESSOA. Demais tabelas devem especializar esta tabela com seus próprios dados: FORNECEDOR, TRANSPORTADORA, CLIENTE, etc.
-- ------------------------------------------------------------

CREATE TABLE PESSOA (
  ID INTEGER  NOT NULL  ,
  NOME VARCHAR(150)    ,
  TIPO CHAR(1)    ,
  EMAIL VARCHAR(250)    ,
  SITE VARCHAR(250)    ,
  SUFRAMA VARCHAR(9)      ,
PRIMARY KEY(ID));




CREATE TABLE COD_RECOLHIMENTO_SEFIP (
  ID INTEGER  NOT NULL  ,
  CODIGO INTEGER    ,
  DESCRICAO VARCHAR(255)    ,
  APLICACAO TEXT      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Guarda o número da última nota emitida
-- ------------------------------------------------------------

CREATE TABLE NFE_NUMERO (
  ID INTEGER  NOT NULL  ,
  NUMERO INTEGER      ,
PRIMARY KEY(ID));



CREATE TABLE COD_GPS (
  ID INTEGER  NOT NULL  ,
  CODIGO INTEGER    ,
  DESCRICAO VARCHAR(255)      ,
PRIMARY KEY(ID));



CREATE TABLE COD_MOVIMENTACAO_SEFIP (
  ID INTEGER  NOT NULL  ,
  CODIGO CHAR(2)    ,
  DESCRICAO VARCHAR(255)    ,
  APLICACAO TEXT      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Tabela com os grupos de produtos
-- ------------------------------------------------------------

CREATE TABLE GRUPO_PRODUTO (
  ID INTEGER  NOT NULL  ,
  NOME VARCHAR(20)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Tabela com as funções do sistema.
-- ------------------------------------------------------------

CREATE TABLE FUNCAO (
  ID INTEGER  NOT NULL  ,
  DESCRICAO_MENU VARCHAR(30)    ,
  IMAGEM_MENU VARCHAR(30)    ,
  METODO VARCHAR(30)    ,
  NOME VARCHAR(30)    ,
  FORMULARIO VARCHAR(30)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Detalhe da Redução Z;
-- ------------------------------------------------------------

CREATE TABLE R03 (
  ID INTEGER  NOT NULL  ,
  NOME_CAIXA VARCHAR(30)    ,
  ID_GERADO_CAIXA INTEGER    ,
  ID_EMPRESA INTEGER    ,
  ID_R02 INTEGER    ,
  TOTALIZADOR_PARCIAL VARCHAR(10)    ,
  VALOR_ACUMULADO DECIMAL(18,6)    ,
  HASH_TRIPA VARCHAR(32)    ,
  HASH_INCREMENTO INTEGER    ,
  DATA_SINCRONIZACAO DATE    ,
  HORA_SINCRONIZACAO VARCHAR(8)      ,
PRIMARY KEY(ID));



-- ------------------------------------------------------------
-- Tabela IRRF detalhes
-- ------------------------------------------------------------

CREATE TABLE IRRF_DETALHE (
  ID INTEGER  NOT NULL  ,
  ID_IRRF INTEGER  NOT NULL  ,
  FAIXA INTEGER    ,
  DE DECIMAL(18,6)    ,
  ATE DECIMAL(18,6)    ,
  TAXA DECIMAL(18,6)    ,
  DESCONTO DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_IRRF)
    REFERENCES IRRF(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_IRRF_DETALHE ON IRRF_DETALHE (ID_IRRF);



CREATE TABLE INSS_DETALHE (
  ID INTEGER  NOT NULL  ,
  ID_INSS INTEGER  NOT NULL  ,
  FAIXA INTEGER    ,
  DE DECIMAL(18,6)    ,
  ATE DECIMAL(18,6)    ,
  TAXA DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_INSS)
    REFERENCES INSS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_INSS_DETALHE ON INSS_DETALHE (ID_INSS);



-- ------------------------------------------------------------
-- Tabela com os índices econômicos de determinado país.
-- ------------------------------------------------------------

CREATE TABLE INDICE_ECONOMICO (
  ID INTEGER  NOT NULL  ,
  ID_PAIS INTEGER  NOT NULL  ,
  SIGLA VARCHAR(50)    ,
  NOME VARCHAR(50)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_PAIS)
    REFERENCES PAIS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_PAIS_INDICE_ECONOMICO ON INDICE_ECONOMICO (ID_PAIS);



-- ------------------------------------------------------------
-- Gênero do NCM
-- ------------------------------------------------------------

CREATE TABLE NCM_GENERO (
  ID INTEGER  NOT NULL  ,
  ID_NCM_SECAO INTEGER  NOT NULL  ,
  GENERO CHAR(2)  NOT NULL  ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NCM_SECAO)
    REFERENCES NCM_SECAO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_NCM_SECAO_GENERO ON NCM_GENERO (ID_NCM_SECAO);




-- ------------------------------------------------------------
-- Armazena os dados específicos de pessoa jurídica.
-- ------------------------------------------------------------

CREATE TABLE PESSOA_JURIDICA (
  ID INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  CNPJ VARCHAR(14)    ,
  RAZAO_SOCIAL VARCHAR(150)    ,
  FANTASIA VARCHAR(150)    ,
  INSCRICAO_MUNICIPAL VARCHAR(30)    ,
  INSCRICAO_ESTADUAL VARCHAR(30)    ,
  DATA_CONSTITUICAO DATE    ,
  CRT INTEGER      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_PESSOA_JURIDICA ON PESSOA_JURIDICA (ID_PESSOA);



CREATE TABLE MOEDA_COTACAO (
  ID INTEGER  NOT NULL  ,
  ID_MOEDAS INTEGER  NOT NULL  ,
  DATA_COTACAO DATE    ,
  VALOR_COTACAO DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_MOEDAS)
    REFERENCES MOEDAS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX MOEDA_COTACAO_FKIndex1 ON MOEDA_COTACAO (ID_MOEDAS);



-- ------------------------------------------------------------
-- Armazena os dados do contador da empresa. 
-- ------------------------------------------------------------

CREATE TABLE CONTADOR (
  ID INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  INSCRICAO_CRC VARCHAR(15)    ,
  FONE VARCHAR(10)    ,
  FAX VARCHAR(10)    ,
  LOGRADOURO VARCHAR(100)    ,
  NUMERO VARCHAR(10)    ,
  COMPLEMENTO VARCHAR(100)    ,
  BAIRRO VARCHAR(60)    ,
  CEP VARCHAR(8)    ,
  MUNICIPIO_IBGE INTEGER    ,
  UF CHAR(2)    ,
  EMAIL VARCHAR(250)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CONTADOR_FKIndex1 ON CONTADOR (ID_PESSOA);



CREATE TABLE SALARIO_FAMILIA (
  ID INTEGER  NOT NULL  ,
  ID_INSS INTEGER  NOT NULL  ,
  FAIXA INTEGER    ,
  DE DECIMAL(18,6)    ,
  ATE DECIMAL(18,6)    ,
  VALOR DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_INSS)
    REFERENCES INSS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_INSS_SALARIO_FAMILIA ON SALARIO_FAMILIA (ID_INSS);



CREATE TABLE CENTRO_RESULTADO (
  ID INTEGER  NOT NULL  ,
  ID_PLANO_CENTRO_RESULTADO INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)    ,
  CLASSIFICACAO VARCHAR(30)    ,
  SOFRE_RATEIRO CHAR(1)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_PLANO_CENTRO_RESULTADO)
    REFERENCES PLANO_CENTRO_RESULTADO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CENTRO_RESULTADO ON CENTRO_RESULTADO (ID_PLANO_CENTRO_RESULTADO);



-- ------------------------------------------------------------
-- Tabela para armazenar as agências bancárias.
-- ------------------------------------------------------------

CREATE TABLE AGENCIA_BANCO (
  ID INTEGER  NOT NULL  ,
  ID_BANCO INTEGER  NOT NULL  ,
  CODIGO INTEGER    ,
  NOME VARCHAR(100)    ,
  LOGRADOURO VARCHAR(100)    ,
  NUMERO VARCHAR(10)    ,
  CEP VARCHAR(8)    ,
  MUNICIPIO_IBGE INTEGER    ,
  UF CHAR(2)    ,
  TELEFONE VARCHAR(10)    ,
  GERENTE VARCHAR(30)    ,
  CONTATO VARCHAR(30)    ,
  OBS TEXT      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_BANCO)
    REFERENCES BANCO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_BANCO_AGENCIA ON AGENCIA_BANCO (ID_BANCO);



CREATE TABLE TABELA_PRECO (
  ID INTEGER  NOT NULL  ,
  ID_TABELA_MESTRE INTEGER    ,
  ID_MOEDAS INTEGER  NOT NULL  ,
  NOME VARCHAR(100)    ,
  COEFICIENTE DECIMAL(18,6)    ,
  PRINCIPAL CHAR(1)    ,
  BASE_CUSTO CHAR(1)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_MOEDAS)
    REFERENCES MOEDAS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TABELA_MESTRE)
    REFERENCES TABELA_PRECO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX TABELA_PRECO_FKIndex1 ON TABELA_PRECO (ID_MOEDAS);
CREATE INDEX TABELA_PRECO_FKIndex2 ON TABELA_PRECO (ID_TABELA_MESTRE);





-- ------------------------------------------------------------
-- Tabela com os sub-grupos dos produtos.
-- ------------------------------------------------------------

CREATE TABLE SUB_GRUPO_PRODUTO (
  ID INTEGER  NOT NULL  ,
  ID_GRUPO INTEGER  NOT NULL  ,
  NOME VARCHAR(20)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_GRUPO)
    REFERENCES GRUPO_PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_SUB_GRUPO_GRUPO ON SUB_GRUPO_PRODUTO (ID_GRUPO);



-- ------------------------------------------------------------
-- Esta tabela irá armazenar os saldos mensais de cada CENTRO DE RESULTADO. Estes registrados serão inseridos quando for acionado no executavel uma RONTINA DE ENCERRAMENTO DOS CENTROS DE RESULTADOS. Neste caso quando houver no CAD. do centro de Resultado estiver SOFRE_RATEIO = true, o sistema deve : APRUARAR O SALDO, registrar o encerramento nesta tabela, pegar esse SALDO e fazer a rotina de SUB_RATEIO lançado o saldo no campo VALOR_SUB_RATEIO desta tabela. Assim o Centro terá 2 saldos O VALOR PROPRIO E VALOR ORIUNDO DE OUTROS CENTROS.
-- ------------------------------------------------------------

CREATE TABLE ENCERRA_CENTRO_RESULTADO (
  ID INTEGER  NOT NULL  ,
  ID_CENTRO_RESULTADO INTEGER  NOT NULL  ,
  COMPETENCIA VARCHAR(7)    ,
  VALOR_TOTAL DECIMAL(18,6)    ,
  VALOR_SUB_RATEIO DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_CENTRO_RESULTADO)
    REFERENCES CENTRO_RESULTADO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ENCERRA_CENTRO_RESULT_FK1 ON ENCERRA_CENTRO_RESULTADO (ID_CENTRO_RESULTADO);



CREATE TABLE RATEIO_CENTRO_RESUL_CAB (
  ID INTEGER  NOT NULL  ,
  ID_CENTRO_RESULTADO INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_CENTRO_RESULTADO)
    REFERENCES CENTRO_RESULTADO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX RATEIO_CENTRO_RESUL_CAB ON RATEIO_CENTRO_RESUL_CAB (ID_CENTRO_RESULTADO);



-- ------------------------------------------------------------
-- Tabela com os Estados de determinado Pais.
-- ------------------------------------------------------------

CREATE TABLE UF (
  ID INTEGER  NOT NULL  ,
  ID_PAIS INTEGER  NOT NULL  ,
  SIGLA CHAR(2)    ,
  NOME VARCHAR(50)    ,
  CODIGO_IBGE INTEGER      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_PAIS)
    REFERENCES PAIS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_PAIS_UF ON UF (ID_PAIS);



-- ------------------------------------------------------------
-- Armazena os dados específicos de pessoa física.
-- ------------------------------------------------------------

CREATE TABLE PESSOA_FISICA (
  ID INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  ID_ESTADO_CIVIL INTEGER  NOT NULL  ,
  CPF VARCHAR(11)    ,
  RG VARCHAR(20)    ,
  ORGAO_RG VARCHAR(20)    ,
  DATA_EMISSAO_RG DATE    ,
  DATA_NASCIMENTO DATE    ,
  SEXO CHAR(1)    ,
  NATURALIDADE VARCHAR(100)    ,
  NACIONALIDADE VARCHAR(100)    ,
  RACA CHAR(1)    ,
  TIPO_SANGUE CHAR(3)    ,
  CNH_NUMERO VARCHAR(20)    ,
  CNH_CATEGORIA CHAR(1)    ,
  CNH_VENCIMENTO DATE    ,
  TITULO_ELEITORAL_NUMERO INTEGER    ,
  TITULO_ELEITORAL_ZONA INTEGER    ,
  TITULO_ELEITORAL_SECAO INTEGER    ,
  RESERVISTA_NUMERO INTEGER    ,
  RESERVISTA_CATEGORIA INTEGER    ,
  MAE VARCHAR(100)  NOT NULL  ,
  PAI VARCHAR(100)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_ESTADO_CIVIL)
    REFERENCES ESTADO_CIVIL(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_ESTADO_CIVIL_PF ON PESSOA_FISICA (ID_ESTADO_CIVIL);
CREATE INDEX FK_PESSOA_FISICA ON PESSOA_FISICA (ID_PESSOA);







CREATE TABLE REPRESENTANTES (
  ID INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  ID_AGENCIA_BANCO INTEGER  NOT NULL  ,
  NR_CONTA_BANCO VARCHAR(30)    ,
  CORE VARCHAR(20)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_AGENCIA_BANCO)
    REFERENCES AGENCIA_BANCO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX REPRESENTANTES_FKIndex1 ON REPRESENTANTES (ID_AGENCIA_BANCO);
CREATE INDEX REPRESENTANTES_FKIndex2 ON REPRESENTANTES (ID_PESSOA);



-- ------------------------------------------------------------
-- Esta tabela visa relacionar o CODIGO DE APURACAO PIS COFINS com o respectivo tipo de Receita da DAcon
-- ------------------------------------------------------------

CREATE TABLE COD_APURACAO_RECEITA_DACON (
  ID INTEGER  NOT NULL  ,
  ID_TIPO_RECEITA_DACON INTEGER  NOT NULL  ,
  ID_COD_APURACAO INTEGER  NOT NULL    ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_TIPO_RECEITA_DACON)
    REFERENCES TIPO_RECEITA_DACON(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_COD_APURACAO)
    REFERENCES COD_APURACAO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX COD_APURACAO_RECEITA_DACON ON COD_APURACAO_RECEITA_DACON (ID_TIPO_RECEITA_DACON);
CREATE INDEX COD_APURACAO_RECEITA_DACON_F2 ON COD_APURACAO_RECEITA_DACON (ID_COD_APURACAO);



-- ------------------------------------------------------------
-- Contas contábeis da empresa.
-- ------------------------------------------------------------

CREATE TABLE CONTABIL_CONTA (
  ID INTEGER  NOT NULL  ,
  ID_PLANO_CONTAS INTEGER  NOT NULL  ,
  ID_PLANO_CONTA_REF_SPED INTEGER  NOT NULL  ,
  ID_CONTA_PAI INTEGER  NOT NULL  ,
  CLASSIFICACAO VARCHAR(30)    ,
  TIPO CHAR(1)    ,
  DESCRICAO VARCHAR(100)    ,
  DATA_INCLUSAO DATE    ,
  SITUACAO CHAR(1)    ,
  NATUREZA CHAR(1)    ,
  PATRIMONIO_RESULTADO CHAR(1)  NOT NULL  ,
  LIVRO_CAIXA CHAR(1)    ,
  DFC CHAR(1)    ,
  ORDEM VARCHAR(20)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_PLANO_CONTA_REF_SPED)
    REFERENCES PLANO_CONTA_REF_SPED(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PLANO_CONTAS)
    REFERENCES PLANO_CONTAS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_CONTA_SPED_CONTA ON CONTABIL_CONTA (ID_PLANO_CONTA_REF_SPED);
CREATE INDEX CONTABIL_CONTA_FKIndex2 ON CONTABIL_CONTA (ID_PLANO_CONTAS);









-- ------------------------------------------------------------
-- Tabela com a Nomeclatura Comum do Mercosul (NCM)
-- ------------------------------------------------------------

CREATE TABLE NCM (
  ID INTEGER  NOT NULL  ,
  ID_NCM_SECAO INTEGER  NOT NULL  ,
  ID_NCM_POSICAO INTEGER  NOT NULL  ,
  NCM_COMPLETO VARCHAR(8)    ,
  DESCRICAO VARCHAR(200)    ,
  GENERO CHAR(2)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_NCM_POSICAO)
    REFERENCES NCM_POSICAO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_NCM_SECAO)
    REFERENCES NCM_SECAO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_NCM_POSICAO ON NCM (ID_NCM_POSICAO);
CREATE INDEX FK_NCM_SECAO ON NCM (ID_NCM_SECAO);





-- ------------------------------------------------------------
-- Tabela de transportadoras
-- ------------------------------------------------------------

CREATE TABLE TRANSPORTADORA (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  DATA_CADASTRO DATE    ,
  OBSERVACOES TEXT      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_PESSOA_TRANSPORTADORA ON TRANSPORTADORA (ID_PESSOA);
CREATE INDEX TRANSPORTADORA_FKIndex2 ON TRANSPORTADORA (ID_CONTABIL_CONTA);



-- ------------------------------------------------------------
-- Vinculo entre PAPEL e FUNCAO pare definir os níveis de acesso do sistema.
-- ------------------------------------------------------------

CREATE TABLE PAPEL_FUNCAO (
  ID INTEGER  NOT NULL  ,
  ID_PAPEL INTEGER  NOT NULL  ,
  ID_FUNCAO INTEGER  NOT NULL  ,
  PODE_CONSULTAR CHAR(1)    ,
  PODE_INSERIR CHAR(1)    ,
  PODE_ALTERAR CHAR(1)    ,
  PODE_EXCLUIR CHAR(1)    ,
  HABILITADO CHAR(1)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_PAPEL)
    REFERENCES PAPEL(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_FUNCAO)
    REFERENCES FUNCAO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_PAPEL_FUNCAO ON PAPEL_FUNCAO (ID_PAPEL);
CREATE INDEX FK_FUNCAO_PAPEL ON PAPEL_FUNCAO (ID_FUNCAO);







-- ------------------------------------------------------------
-- Tabela das operadoras de plano de saúde.
-- ------------------------------------------------------------

CREATE TABLE OPERADORA_PLANO_SAUDE (
  ID INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  REGISTRO_ANS VARCHAR(20)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX OPERADORA_PLANO_SAUDE_FKIndex1 ON OPERADORA_PLANO_SAUDE (ID_CONTABIL_CONTA);
CREATE INDEX OPERADORA_PLANO_SAUDE_FKIndex2 ON OPERADORA_PLANO_SAUDE (ID_PESSOA);



-- ------------------------------------------------------------
-- Cadastro das empresas de transporte.
-- ------------------------------------------------------------

CREATE TABLE EMPRESA_TRANSPORTE (
  ID INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  UF CHAR(2)    ,
  NOME VARCHAR(100)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX EMPRESA_TRANSPORTE_FKIndex1 ON EMPRESA_TRANSPORTE (ID_CONTABIL_CONTA);
CREATE INDEX EMPRESA_TRANSPORTE_FKIndex2 ON EMPRESA_TRANSPORTE (ID_PESSOA);



CREATE TABLE HOLDING_MATRIZ (
  ID INTEGER  NOT NULL  ,
  ID_HOLDING INTEGER  NOT NULL  ,
  ID_MATRIZ INTEGER  NOT NULL    ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_MATRIZ)
    REFERENCES MATRIZ(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_HOLDING)
    REFERENCES HOLDING(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX HOLDING_MATRIZ_FKIndex1 ON HOLDING_MATRIZ (ID_MATRIZ);
CREATE INDEX HOLDING_MATRIZ_FKIndex2 ON HOLDING_MATRIZ (ID_HOLDING);



CREATE TABLE NATUREZA_FINANCEIRA (
  ID INTEGER  NOT NULL  ,
  ID_CENTRO_RESULTADO INTEGER  NOT NULL  ,
  ID_PLANO_NAT_FINANCEIRA INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(200)    ,
  CLASSIFICASSAO VARCHAR(30)    ,
  TIPO CHAR(1)    ,
  HISTORICO VARCHAR(200)    ,
  SINTETICO CHAR(1)    ,
  SINAL CHAR(1)    ,
  APLICACAO VARCHAR(255)    ,
  APARECE_CAIXA CHAR(1)    ,
  APARECE_A_PAGAR CHAR(1)    ,
  APARECE_A_RECEBER CHAR(1)    ,
  APARECE_PRODUTO CHAR(1)    ,
  APARECE_ENTRADA CHAR(1)    ,
  APARECE_TESOURARIA CHAR(1)      ,
PRIMARY KEY(ID)      ,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PLANO_NAT_FINANCEIRA)
    REFERENCES PLANO_NAT_FINANCEIRA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CENTRO_RESULTADO)
    REFERENCES CENTRO_RESULTADO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX NATUREZA_FINANCEIRA_FK2 ON NATUREZA_FINANCEIRA (ID_CONTABIL_CONTA);
CREATE INDEX NATUREZA_FINANCEIRA_FKIndex2 ON NATUREZA_FINANCEIRA (ID_PLANO_NAT_FINANCEIRA);
CREATE INDEX NATUREZA_FINANCEIRA_FKIndex3 ON NATUREZA_FINANCEIRA (ID_CENTRO_RESULTADO);



CREATE TABLE EMPRESA_PLANOS (
  ID INTEGER  NOT NULL  ,
  ID_PLANO_CENTRO_RESULTADO INTEGER  NOT NULL  ,
  ID_PLANO_NAT_FINANCEIRA INTEGER  NOT NULL  ,
  ID_PLANO_CONTAS INTEGER  NOT NULL    ,
PRIMARY KEY(ID)      ,
  FOREIGN KEY(ID_PLANO_CONTAS)
    REFERENCES PLANO_CONTAS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PLANO_NAT_FINANCEIRA)
    REFERENCES PLANO_NAT_FINANCEIRA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PLANO_CENTRO_RESULTADO)
    REFERENCES PLANO_CENTRO_RESULTADO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX EMPRESA_PLANO_CONTAS_FK1 ON EMPRESA_PLANOS (ID_PLANO_CONTAS);
CREATE INDEX EMPRESA_PLANO_CONTAS_FK2 ON EMPRESA_PLANOS (ID_PLANO_NAT_FINANCEIRA);
CREATE INDEX EMPRESA_PLANO_CONTAS_FK3 ON EMPRESA_PLANOS (ID_PLANO_CENTRO_RESULTADO);



-- ------------------------------------------------------------
-- Esta tabela irá armazernar os paramentros de SUB_RATEIRO. Isto é quando o Saldo de um CENTRO será rateado para outros CENTROS. Ex. o saldo do CENTRO ADM será rateado para os CENTROS PROUDCAO E COMERCIAL.
-- ------------------------------------------------------------

CREATE TABLE RATEIO_CENTRO_RESUL_DET (
  ID INTEGER  NOT NULL  ,
  ID_CENTRO_RESULTADO_DESTINO INTEGER  NOT NULL  ,
  ID_CENTRO_RESULTADO_ORIGEM INTEGER  NOT NULL  ,
  ID_RATEIO_CENTRO_RESUL_CAB INTEGER  NOT NULL  ,
  PORCENTO_RATEIO DECIMAL(18,6)      ,
PRIMARY KEY(ID)      ,
  FOREIGN KEY(ID_RATEIO_CENTRO_RESUL_CAB)
    REFERENCES RATEIO_CENTRO_RESUL_CAB(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CENTRO_RESULTADO_DESTINO)
    REFERENCES CENTRO_RESULTADO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CENTRO_RESULTADO_ORIGEM)
    REFERENCES CENTRO_RESULTADO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX RATEIO_CENTRO_RESUL_DET_FK1 ON RATEIO_CENTRO_RESUL_DET (ID_RATEIO_CENTRO_RESUL_CAB);
CREATE INDEX RATEIO_CENTRO_RESUL_DET_FK2 ON RATEIO_CENTRO_RESUL_DET (ID_CENTRO_RESULTADO_DESTINO);
CREATE INDEX RATEIO_CENTRO_RESUL_DET_FK3 ON RATEIO_CENTRO_RESUL_DET (ID_CENTRO_RESULTADO_ORIGEM);



-- ------------------------------------------------------------
-- Tabela com a relaçao de fornecedores das empresas.
-- ------------------------------------------------------------

CREATE TABLE FORNECEDOR (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  ID_ATIVIDADE_FOR_CLI INTEGER  NOT NULL  ,
  ID_SITUACAO_FOR_CLI INTEGER  NOT NULL  ,
  DESDE DATE    ,
  OPTANTE_SIMPLES_NACIONAL CHAR(1)    ,
  LOCALIZACAO CHAR(1)    ,
  DATA_CADASTRO DATE    ,
  SOFRE_RETENCAO CHAR(1)    ,
  CHEQUE_NOMINAL_A VARCHAR(100)    ,
  OBSERVACOES TEXT    ,
  CONTA_REMETENTE VARCHAR(30)    ,
  PRAZO_MEDIO_ENTEGRA DECIMAL(4,0)    ,
  GERA_FATURAMENTO CHAR(1)    ,
  NUM_DIAS_PRIM_VENC DECIMAL(4,0)    ,
  NUM_DIAS_INTERVALO DECIMAL(4,0)    ,
  QTD_PARCELAS DECIMAL(4,0)      ,
PRIMARY KEY(ID)        ,
  FOREIGN KEY(ID_SITUACAO_FOR_CLI)
    REFERENCES SITUACAO_FOR_CLI(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_ATIVIDADE_FOR_CLI)
    REFERENCES ATIVIDADE_FOR_CLI(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_SITUACAO_FORNECEDOR ON FORNECEDOR (ID_SITUACAO_FOR_CLI);
CREATE INDEX FK_ATIVIDADE_FORNECEDOR ON FORNECEDOR (ID_ATIVIDADE_FOR_CLI);
CREATE INDEX FK_PESSOA_FORNECEDOR ON FORNECEDOR (ID_PESSOA);
CREATE INDEX FORNECEDOR_FKIndex4 ON FORNECEDOR (ID_CONTABIL_CONTA);











-- ------------------------------------------------------------
-- Esta tabela irá armazenar todos os lançamentos nos CENTROS DE RESULTADOS (tambem chamado de CENTRO DE CUSTOS).
-- ------------------------------------------------------------

CREATE TABLE LANCA_CENTRO_RESULTADO (
  ID INTEGER  NOT NULL  ,
  ID_CENTRO_RESULTADO INTEGER  NOT NULL  ,
  VALOR INTEGER    ,
  HISTORICO INTEGER    ,
  DOCUMENTO VARCHAR(30)    ,
  DATA_LANCAMENTO DATE    ,
  DATA_INC DATE    ,
  ORIGEM_DE_RATEIO CHAR(1)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_CENTRO_RESULTADO)
    REFERENCES CENTRO_RESULTADO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX LANCA_CENTRO_RESULTADO_FK1 ON LANCA_CENTRO_RESULTADO (ID_CENTRO_RESULTADO);




-- ------------------------------------------------------------
-- Tabela com as cidades de determinado Estado.
-- ------------------------------------------------------------

CREATE TABLE MUNICIPIO (
  ID INTEGER  NOT NULL  ,
  ID_UF INTEGER  NOT NULL  ,
  NOME VARCHAR(100)    ,
  CODIGO_IBGE INTEGER    ,
  CODIGO_RECEITA_FEDERAL INTEGER    ,
  CODIGO_ESTADUAL INTEGER      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_UF)
    REFERENCES UF(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_UF_MUNICIPIO ON MUNICIPIO (ID_UF);



-- ------------------------------------------------------------
-- Tabela dos bairros de uma cidade
-- ------------------------------------------------------------

CREATE TABLE BAIRRO (
  ID INTEGER  NOT NULL  ,
  ID_MUNICIPIO INTEGER  NOT NULL  ,
  NOME VARCHAR(100)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_MUNICIPIO)
    REFERENCES MUNICIPIO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_MUNICIPIO_BAIRRO ON BAIRRO (ID_MUNICIPIO);



-- ------------------------------------------------------------
-- Tabela com a relação de CEPs do Brasil.
-- ------------------------------------------------------------

CREATE TABLE CEP (
  ID INTEGER  NOT NULL  ,
  ID_BAIRRO INTEGER  NOT NULL  ,
  CEP VARCHAR(8)    ,
  LOGRADOURO VARCHAR(100)    ,
  COMPLEMENTO VARCHAR(100)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_BAIRRO)
    REFERENCES BAIRRO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_BAIRRO_CEP ON CEP (ID_BAIRRO);



-- ------------------------------------------------------------
-- Itinerários das empresas de transporte.
-- ------------------------------------------------------------

CREATE TABLE EMPRESA_TRANSPORTE_ITINERARIO (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA_TRANSPORTE INTEGER  NOT NULL  ,
  NOME VARCHAR(100)    ,
  TARIFA DECIMAL(18,6)    ,
  TRAJETO TEXT      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA_TRANSPORTE)
    REFERENCES EMPRESA_TRANSPORTE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_EMPRESA_TRANSP_ITINERARIO ON EMPRESA_TRANSPORTE_ITINERARIO (ID_EMPRESA_TRANSPORTE);




-- ------------------------------------------------------------
-- Tabela que armazena os pedidos de compra.
-- ------------------------------------------------------------

CREATE TABLE PEDIDO_COMPRA (
  ID INTEGER  NOT NULL  ,
  ID_FORNECEDOR INTEGER  NOT NULL  ,
  ID_TIPO_PEDIDO_COMPRA INTEGER  NOT NULL  ,
  DATA_PEDIDO DATE    ,
  DATA_PREVISTA_ENTREGA DATE    ,
  DATA_PREVISAO_PAGAMENTO DATE    ,
  LOCAL_ENTREGA VARCHAR(100)    ,
  LOCAL_COBRANCA VARCHAR(100)    ,
  CONTATO VARCHAR(30)    ,
  VALOR_SUBTOTAL DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  VALOR_DESCONTO DECIMAL(18,6)    ,
  VALOR_TOTAL_PEDIDO DECIMAL(18,6)    ,
  TIPO_FRETE CHAR(1)    ,
  FORMA_PAGAMENTO CHAR(1)    ,
  BASE_CALCULO_ICMS DECIMAL(18,6)    ,
  VALOR_ICMS DECIMAL(18,6)    ,
  BASE_CALCULO_ICMS_ST DECIMAL(18,6)    ,
  VALOR_ICMS_ST DECIMAL(18,6)    ,
  VALOR_TOTAL_PRODUTOS DECIMAL(18,6)    ,
  VALOR_FRETE DECIMAL(18,6)    ,
  VALOR_SEGURO DECIMAL(18,6)    ,
  VALOR_OUTRAS_DESPESAS DECIMAL(18,6)    ,
  VALOR_IPI DECIMAL(18,6)    ,
  VALOR_TOTAL_NF DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_TIPO_PEDIDO_COMPRA)
    REFERENCES TIPO_PEDIDO_COMPRA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_FORNECEDOR)
    REFERENCES FORNECEDOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_TIPO_PEDIDO_COMPRA ON PEDIDO_COMPRA (ID_TIPO_PEDIDO_COMPRA);
CREATE INDEX PEDIDO_COMPRA_FKIndex3 ON PEDIDO_COMPRA (ID_FORNECEDOR);





-- ------------------------------------------------------------
-- Armazena os dados do responsável legal pela empresa. 
-- ------------------------------------------------------------

CREATE TABLE RESPONSAVEL_SOCIOS (
  ID INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  FONE VARCHAR(10)    ,
  FAX VARCHAR(10)    ,
  LOGRADOURO VARCHAR(100)    ,
  NUMERO VARCHAR(10)    ,
  COMPLEMENTO VARCHAR(100)    ,
  BAIRRO VARCHAR(60)    ,
  CEP VARCHAR(8)    ,
  MUNICIPIO_IBGE INTEGER    ,
  UF CHAR(2)    ,
  EMAIL VARCHAR(250)    ,
  PIS_NIT INTEGER      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX RESPONSAVEL_SOCIOS_FKIndex1 ON RESPONSAVEL_SOCIOS (ID_CONTABIL_CONTA);
CREATE INDEX RESPONSAVEL_SOCIOS_FKIndex2 ON RESPONSAVEL_SOCIOS (ID_PESSOA);



CREATE TABLE SOCIO_DEPENDENTES (
  ID INTEGER  NOT NULL  ,
  ID_RESPONSAVEL_SOCIOS INTEGER  NOT NULL  ,
  ID_TIPO_RELACIONAMENTO INTEGER  NOT NULL  ,
  NOME INTEGER    ,
  DATA_NASCIMENTO DATE    ,
  DATA_INICIO_DEPEDENCIA DATE    ,
  DATA_FIM_DEPENDENCIA DATE    ,
  CPF VARCHAR(11)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_TIPO_RELACIONAMENTO)
    REFERENCES TIPO_RELACIONAMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_RESPONSAVEL_SOCIOS)
    REFERENCES RESPONSAVEL_SOCIOS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX SOCIO_DEPENDENTES_FKIndex1 ON SOCIO_DEPENDENTES (ID_TIPO_RELACIONAMENTO);
CREATE INDEX SOCIO_DEPENDENTES_FKIndex2 ON SOCIO_DEPENDENTES (ID_RESPONSAVEL_SOCIOS);



-- ------------------------------------------------------------
-- Tabela das sindicatos patronais
-- ------------------------------------------------------------

CREATE TABLE SINDICATO (
  ID INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  COD_BANCO INTEGER    ,
  COD_AGENCIA INTEGER    ,
  CONTA_BANCO VARCHAR(20)    ,
  COD_CEDENTE VARCHAR(30)    ,
  LOGRADOURO VARCHAR(100)    ,
  NUMERO VARCHAR(10)    ,
  BAIRRO VARCHAR(100)    ,
  MUNICIPIO_IBGE INTEGER    ,
  UF CHAR(2)    ,
  FONE VARCHAR(14)    ,
  FONE2 VARCHAR(14)    ,
  EMAIL VARCHAR(100)    ,
  TIPO_SINDICATO CHAR(1)    ,
  DATA_BASE DATE      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX SINDICATO_FKIndex1 ON SINDICATO (ID_CONTABIL_CONTA);
CREATE INDEX SINDICATO_FKIndex2 ON SINDICATO (ID_PESSOA);




-- ------------------------------------------------------------
-- Esta tabela irá armazenar os pararamentros para o Rateio automático dos lançamentos nas CONTA_CONTABIL para os CENTRO_RESULTADO. Toda vez que aquela conta recebe um lançamento o sistema deve ter uma rotina que checa se esta conta posssui Paramentro nesta tabela e procede aos devidos lançamentos nos CENTROS DE RESULTADOS. A vantagem deste procedimento é que vai evitar que usuario tenha de fazer isso de forma Manual perdendo tempo e aumentando as chances de erro operacional. Ex. A CONTA DE LUZ da empresa é compartilhada por todos os CENTROS DE RESULTADOS, mas a empresa precisa fazer esse rateio de forma que cada CENTRO recebe seu respectivo valor. Neste caso, iremos no CAD DA  CONTA CONTABIL informar quais os CENTROS e os PERCENTUAIS que serão RATEADOS pra cada CENTRO.
-- ------------------------------------------------------------

CREATE TABLE CONTA_CONTABIL_RATEIO (
  ID INTEGER  NOT NULL  ,
  ID_CENTRO_RESULTADO INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  PORCENTO_RATEIRO DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CENTRO_RESULTADO)
    REFERENCES CENTRO_RESULTADO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CONTA_CONTABIL_RATEIO_FK1 ON CONTA_CONTABIL_RATEIO (ID_CONTABIL_CONTA);
CREATE INDEX CONTA_CONTABIL_RATEIO_FK2 ON CONTA_CONTABIL_RATEIO (ID_CENTRO_RESULTADO);



CREATE TABLE TRANSPORTADORA_MUNICIPIO (
  ID INTEGER  NOT NULL  ,
  ID_MUNICIPIO INTEGER  NOT NULL  ,
  ID_TRANSPORTADORA INTEGER  NOT NULL    ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_TRANSPORTADORA)
    REFERENCES TRANSPORTADORA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_MUNICIPIO)
    REFERENCES MUNICIPIO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX TRANSPORTADORA_MUNICIPIO ON TRANSPORTADORA_MUNICIPIO (ID_TRANSPORTADORA);
CREATE INDEX TRANSPORTADORA_MUNICIPIO3 ON TRANSPORTADORA_MUNICIPIO (ID_MUNICIPIO);



-- ------------------------------------------------------------
-- Uma cotação pode ter vários fornecedores e um fornecedor pode fazer parte de várias cotações.
-- ------------------------------------------------------------

CREATE TABLE FORNECEDOR_COTACAO_COMPRA (
  ID INTEGER  NOT NULL  ,
  ID_FORNECEDOR INTEGER  NOT NULL  ,
  ID_COTACAO_COMPRA INTEGER  NOT NULL  ,
  PRAZO_ENTREGA VARCHAR(30)    ,
  CONDICOES_PAGAMENTO VARCHAR(30)    ,
  VALOR_SUBTOTAL DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  VALOR_DESCONTO DECIMAL(18,6)    ,
  TOTAL DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_COTACAO_COMPRA)
    REFERENCES COTACAO_COMPRA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_FORNECEDOR)
    REFERENCES FORNECEDOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_COTACAO_FORNECEDOR ON FORNECEDOR_COTACAO_COMPRA (ID_COTACAO_COMPRA);
CREATE INDEX FORNECEDOR_COTACAO_COMPRA ON FORNECEDOR_COTACAO_COMPRA (ID_FORNECEDOR);



-- ------------------------------------------------------------
-- Tabela com as empresas que utilizam o sistema. ERP multi-empresa.
-- ------------------------------------------------------------

CREATE TABLE EMPRESA (
  ID INTEGER  NOT NULL  ,
  ID_MATRIZ INTEGER  NOT NULL  ,
  ID_RESPONSAVEL_SOCIOS INTEGER  NOT NULL  ,
  ID_SINDICATO_PATRONAL INTEGER  NOT NULL  ,
  ID_FPAS INTEGER  NOT NULL  ,
  ID_CONTADOR INTEGER  NOT NULL  ,
  RAZAO_SOCIAL VARCHAR(150)    ,
  NOME_FANTASIA VARCHAR(150)    ,
  CNPJ VARCHAR(14)    ,
  INSCRICAO_ESTADUAL VARCHAR(30)    ,
  INSCRICAO_ESTADUAL_ST VARCHAR(30)    ,
  INSCRICAO_MUNICIPAL VARCHAR(30)    ,
  INSCRICAO_JUNTA_COMERCIAL VARCHAR(30)    ,
  DATA_INSC_JUNTA_COMERCIAL DATE    ,
  TIPO CHAR(1)    ,
  DATA_CADASTRO DATE    ,
  DATA_INICIO_ATIVIDADES DATE    ,
  SUFRAMA VARCHAR(9)    ,
  EMAIL VARCHAR(250)    ,
  IMAGEM_LOGOTIPO TEXT    ,
  CRT CHAR(1)    ,
  TIPO_REGIME CHAR(1)    ,
  ALIQUOTA_PIS DECIMAL(18,6)    ,
  CONTATO VARCHAR(50)    ,
  ALIQUOTA_COFINS DECIMAL(18,6)    ,
  CODIGO_IBGE_CIDADE INTEGER    ,
  CODIGO_IBGE_UF INTEGER    ,
  COD_TERCEIROS DECIMAL(18,6)    ,
  COD_GPS INTEGER    ,
  ALIQUOTA_SAT DECIMAL(18,6)      ,
PRIMARY KEY(ID)          ,
  FOREIGN KEY(ID_CONTADOR)
    REFERENCES CONTADOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_RESPONSAVEL_SOCIOS)
    REFERENCES RESPONSAVEL_SOCIOS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_FPAS)
    REFERENCES FPAS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_SINDICATO_PATRONAL)
    REFERENCES SINDICATO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_MATRIZ)
    REFERENCES MATRIZ(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_CONTADOR_EMPRESA ON EMPRESA (ID_CONTADOR);
CREATE INDEX FK_RESPONSAVEL_SOCIO_EMPRESA ON EMPRESA (ID_RESPONSAVEL_SOCIOS);
CREATE INDEX EMPRESA_FKIndex4 ON EMPRESA (ID_FPAS);
CREATE INDEX EMPRESA_FK6 ON EMPRESA (ID_SINDICATO_PATRONAL);
CREATE INDEX EMPRESA_FKIndex6 ON EMPRESA (ID_MATRIZ);











-- ------------------------------------------------------------
-- Tabela para controle da Situação Tributaria por UF.
-- ------------------------------------------------------------

CREATE TABLE IMPOSTO_ST_UF (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(50)    ,
  DATA_CADASTRO DATE    ,
  DATA_ALTERACAO DATE    ,
  TAXA_ACRESCIMO_AC DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_AL DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_AP DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_AM DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_BA DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_CE DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_DF DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_ES DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_GO DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_MA DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_MT DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_MS DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_MG DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_PA DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_PB DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_PR DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_PE DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_PI DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_RJ DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_RN DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_RS DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_RO DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_RR DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_SC DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_SP DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_SE DECIMAL(18,6)    ,
  TAXA_ACRESCIMO_TO DECIMAL(18,6)    ,
  VALOR_PAUTA_AC DECIMAL(18,6)    ,
  VALOR_PAUTA_AL DECIMAL(18,6)    ,
  VALOR_PAUTA_AP DECIMAL(18,6)    ,
  VALOR_PAUTA_AM DECIMAL(18,6)    ,
  VALOR_PAUTA_BA DECIMAL(18,6)    ,
  VALOR_PAUTA_CE DECIMAL(18,6)    ,
  VALOR_PAUTA_DF DECIMAL(18,6)    ,
  VALOR_PAUTA_ES DECIMAL(18,6)    ,
  VALOR_PAUTA_GO DECIMAL(18,6)    ,
  VALOR_PAUTA_MA DECIMAL(18,6)    ,
  VALOR_PAUTA_MT DECIMAL(18,6)    ,
  VALOR_PAUTA_MS DECIMAL(18,6)    ,
  VALOR_PAUTA_MG DECIMAL(18,6)    ,
  VALOR_PAUTA_PA DECIMAL(18,6)    ,
  VALOR_PAUTA_PB DECIMAL(18,6)    ,
  VALOR_PAUTA_PR DECIMAL(18,6)    ,
  VALOR_PAUTA_PE DECIMAL(18,6)    ,
  VALOR_PAUTA_PI DECIMAL(18,6)    ,
  VALOR_PAUTA_RJ DECIMAL(18,6)    ,
  VALOR_PAUTA_RN DECIMAL(18,6)    ,
  VALOR_PAUTA_RS DECIMAL(18,6)    ,
  VALOR_PAUTA_RO DECIMAL(18,6)    ,
  VALOR_PAUTA_RR DECIMAL(18,6)    ,
  VALOR_PAUTA_SC DECIMAL(18,6)    ,
  VALOR_PAUTA_SP DECIMAL(18,6)    ,
  VALOR_PAUTA_SE DECIMAL(18,6)    ,
  VALOR_PAUTA_TO DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_EMPRESA_IMPOSTO_ST_UF ON IMPOSTO_ST_UF (ID_EMPRESA);



-- ------------------------------------------------------------
-- Cadastro dos lançamentos padrões: aqueles que são usados freqüentemente, permitindo agilidade no momento dos lançamentos - detalhes.
-- ------------------------------------------------------------

CREATE TABLE LANCAMENTO_PADRAO (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)    ,
  HISTORICO TEXT    ,
  ID_CONTA_DEBITO INTEGER    ,
  ID_CONTA_CREDITO INTEGER      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX LANCAMENTO_PADRAO_FK2 ON LANCAMENTO_PADRAO (ID_EMPRESA);





-- ------------------------------------------------------------
-- Esta tabela deve irá armazenar as diferentes operações presentes na empresa conforme cada tratamento tributário nela existente do ponto de vista do Cliente ou Destinatário. Ou seja, para espécie de destinatário, assim considerado àqueles para os quais houvesse diferença de tratamento tributário.
-- Ex. 
-- 1. Venda a  não contribuinte. Ex. Consumidor final, Construtora ou empresas que comprem os produtos para uso próprio.
-- 2. Venda para Lojistas (Revendedor)
-- 3. Venda Consumidor fora do Estado
-- 4. Venda a Contribuinte Usuário final (ex. construtora, empresa que comprem para consumo)
-- 5. Venda Lojista fora do Estado
-- ------------------------------------------------------------

CREATE TABLE OPERACAO_FISCAL (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)    ,
  COMENTARIO BLOB    ,
  ID_CFOP INTEGER    ,
  DESCRICAO_NA_NF VARCHAR(100)    ,
  MENSAGEM_FISCAL TEXT      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX OPERACAO_FISCAL_FK1 ON OPERACAO_FISCAL (ID_EMPRESA);



-- ------------------------------------------------------------
-- Armazena os tipos de requisição:
-- 
-- 01=INTERNA = requisição onde os itens são utilizados pela própria empresa
-- 02=EXTERNA = requisição onde os itens são utilizados para venda ao consumidor
-- ------------------------------------------------------------

CREATE TABLE TIPO_REQUISICAO_COMPRA (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  CODIGO CHAR(2)    ,
  NOME VARCHAR(30)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX TIPO_REQUISICAO_COMPRA_FK ON TIPO_REQUISICAO_COMPRA (ID_EMPRESA);




-- ------------------------------------------------------------
-- Tabela que armazena os dados do ICMS Interestadual.
-- ------------------------------------------------------------

CREATE TABLE ICMS_INTERESTADUAL (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(50)    ,
  DATA_CADASTRO DATE    ,
  DATA_ALTERACAO DATE    ,
  UF_AC DECIMAL(18,6)    ,
  UF_AL DECIMAL(18,6)    ,
  UF_AP DECIMAL(18,6)    ,
  UF_AM DECIMAL(18,6)    ,
  UF_BA DECIMAL(18,6)    ,
  UF_CE DECIMAL(18,6)    ,
  UF_DF DECIMAL(18,6)    ,
  UF_ES DECIMAL(18,6)    ,
  UF_GO DECIMAL(18,6)    ,
  UF_MA DECIMAL(18,6)    ,
  UF_MT DECIMAL(18,6)    ,
  UF_MS DECIMAL(18,6)    ,
  UF_MG DECIMAL(18,6)    ,
  UF_PA DECIMAL(18,6)    ,
  UF_PB DECIMAL(18,6)    ,
  UF_PR DECIMAL(18,6)    ,
  UF_PE DECIMAL(18,6)    ,
  UF_PI DECIMAL(18,6)    ,
  UF_RJ DECIMAL(18,6)    ,
  UF_RN DECIMAL(18,6)    ,
  UF_RS DECIMAL(18,6)    ,
  UF_RO DECIMAL(18,6)    ,
  UF_RR DECIMAL(18,6)    ,
  UF_SC DECIMAL(18,6)    ,
  UF_SP DECIMAL(18,6)    ,
  UF_SE DECIMAL(18,6)    ,
  UF_TO DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_EMPRESA_ICMS_INTERES ON ICMS_INTERESTADUAL (ID_EMPRESA);



-- ------------------------------------------------------------
-- Dados do encerramento do exercício;
-- ------------------------------------------------------------

CREATE TABLE CONTABIL_ENCERRAMENTO_EXE (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  DATA_INICIO DATE    ,
  DATA_FIM DATE    ,
  DATA_INC DATE    ,
  MOTIVO VARCHAR(100)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CONTABIL_ENCERRAMENTO_FK1 ON CONTABIL_ENCERRAMENTO_EXE (ID_EMPRESA);



-- ------------------------------------------------------------
-- Cadastro de todos os históricos padrões com as informações correspondentes aos lançamentos
-- ------------------------------------------------------------

CREATE TABLE CONTABIL_HISTORICO (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)    ,
  HISTORICO VARCHAR(100)    ,
  PEDE_COMPLEMENTO CHAR(1)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CONTABIL_HISTORICO_FKIndex1 ON CONTABIL_HISTORICO (ID_EMPRESA);



-- ------------------------------------------------------------
-- Armazena as condições de pagamento.
-- ------------------------------------------------------------

CREATE TABLE CONDICOES_PAGAMENTO (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  NOME VARCHAR(50)    ,
  DESCRICAO TEXT    ,
  FATURAMENTO_MINIMO DECIMAL(18,6)    ,
  FATURAMENTO_MAXIMO DECIMAL(18,6)    ,
  INDICE_CORRECAO DECIMAL(18,6)    ,
  DIAS_TOLERANCIA INTEGER    ,
  VALOR_TOLERANCIA DECIMAL(18,6)    ,
  PRAZO_MEDIO INTEGER      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CONDICOES_PAGAMENTO_FKIndex2 ON CONDICOES_PAGAMENTO (ID_EMPRESA);











-- ------------------------------------------------------------
-- Tabela matriz para geração de parcelas.
-- ------------------------------------------------------------

CREATE TABLE CONDICOES_PARCELAS (
  ID INTEGER  NOT NULL  ,
  ID_CONDICOES_PAGAMENTO INTEGER  NOT NULL  ,
  QTD_PARCELAS INTEGER    ,
  DIAS_PRIMEIRO_VENC INTEGER    ,
  TAXA DECIMAL(18,6)    ,
  INTERVALO_PARCELAS INTEGER      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_CONDICOES_PAGAMENTO)
    REFERENCES CONDICOES_PAGAMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_CONDICOES_PARCELAS ON CONDICOES_PARCELAS (ID_CONDICOES_PAGAMENTO);






-- ------------------------------------------------------------
-- DRE - cabeçalho.
-- ------------------------------------------------------------

CREATE TABLE CONTABIL_DRE_CABECALHO (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)    ,
  PADRAO CHAR(1)    ,
  PERIODO_INICIAL VARCHAR(7)    ,
  PERIODO_FINAL VARCHAR(7)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CONTABIL_DRE_CABECALHO_FKIndex1 ON CONTABIL_DRE_CABECALHO (ID_EMPRESA);




-- ------------------------------------------------------------
-- Tabela de setores/departamentos.
-- ------------------------------------------------------------

CREATE TABLE SETOR (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  NOME VARCHAR(50)    ,
  DESCRICAO TEXT      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_EMPRESA_SETOR ON SETOR (ID_EMPRESA);



-- ------------------------------------------------------------
-- Livros contábeis.
-- ------------------------------------------------------------

CREATE TABLE CONTABIL_LIVRO (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(50)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CONTABIL_LIVRO_FKIndex1 ON CONTABIL_LIVRO (ID_EMPRESA);



-- ------------------------------------------------------------
-- Parâmetros do sistema contábil.
-- ------------------------------------------------------------

CREATE TABLE CONTABIL_PARAMETROS (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  MASCARA VARCHAR(30)    ,
  NIVEIS INTEGER    ,
  INFORMAR_CONTA_POR CHAR(1)    ,
  COMPARTILHA_PLANO_CONTAS CHAR(1)    ,
  COMPARTILHA_HISTORICOS CHAR(1)    ,
  ALTERA_LANCAMENTO_OUTRO CHAR(1)    ,
  HISTORICO_OBRIGATORIO CHAR(1)    ,
  PERMITE_LANCAMENTO_ZERADO CHAR(1)    ,
  GERA_INFORMATIVO_SPED CHAR(1)    ,
  SPED_FORMA_ESCRIT_DIARIO CHAR(3)    ,
  SPED_NOME_LIVRO_DIARIO VARCHAR(100)    ,
  ASSINATURA_DIREITA TEXT    ,
  ASSINATURA_ESQUERDA TEXT    ,
  CONTA_ATIVO INTEGER    ,
  CONTA_PASSIVO INTEGER    ,
  CONTA_PATRIMONIO_LIQUIDO INTEGER    ,
  CONTA_DEPRECIACAO_ACUMU INTEGER    ,
  CONTA_CAPITAL_SOCIAL INTEGER    ,
  CONTA_RESULTADO_EXER INTEGER    ,
  ID_HIST_PADRAO_RESULT INTEGER    ,
  ID_CONTA_LUCROS_ACUM INTEGER    ,
  ID_HIST_PADRAO_LUCRO INTEGER    ,
  CONTA_PREJ_ACUM INTEGER    ,
  ID_HIST_PADRAO_PREJUIZO INTEGER    ,
  ID_CONTA_TIT_PAGAR INTEGER    ,
  ID_CONTA_JUROS_PASSIVO INTEGER    ,
  ID_CONTA_TIT_RECEBER INTEGER    ,
  ID_CONTA_JUROS_ATIVOS INTEGER    ,
  ID_CONTA_DESCONTO_OBITIDO INTEGER    ,
  ID_CONTA_DESCONTO_CONCEDIDO INTEGER    ,
  ID_CONTA_CMV INTEGER    ,
  ID_CONTA_VENDAS INTEGER    ,
  ID_CONTA_VENDA_SERVICO INTEGER    ,
  ID_CONTA_ESTOQUE INTEGER    ,
  ID_CONTA_APURA_RESULTADO INTEGER    ,
  ID_CONTA_JUROS_APROPRIAR INTEGER      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CONTABIL_PARAMETROS_FKIndex1 ON CONTABIL_PARAMETROS (ID_EMPRESA);













-- ------------------------------------------------------------
-- Termos de abertura e encerramento dos livros.
-- ------------------------------------------------------------

CREATE TABLE CONTABIL_TERMO (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_LIVRO INTEGER  NOT NULL  ,
  NUMERO INTEGER    ,
  PAGINA_INICIAL INTEGER    ,
  PAGINA_FINAL INTEGER    ,
  REGISTRADO VARCHAR(100)    ,
  NUMERO_REGISTRO VARCHAR(50)    ,
  DATA_DESPACHO DATE    ,
  DATA_ABERTURA DATE    ,
  DATA_ENCERRAMENTO DATE    ,
  ESCRITURACA0_INICIO DATE    ,
  ESCRITURACAO_FIM DATE    ,
  TEXTO TEXT      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_CONTABIL_LIVRO)
    REFERENCES CONTABIL_LIVRO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_CONTABIL_LIVRO_TERMO ON CONTABIL_TERMO (ID_CONTABIL_LIVRO);



-- ------------------------------------------------------------
-- Tabela que armazena as possíveis situações de uma parcela: PAGO, BAIXA PARCIAL, EM ABERTO,  RETENCAO, etc.
-- Status padrões (já são criados para cada empresa):
-- 01 = A pagar | 02 = Pago | 03 = Pago Parcial | 04 = Vencida
-- ------------------------------------------------------------

CREATE TABLE STATUS_PARCELA (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  SITUACAO CHAR(2)  NOT NULL  ,
  DESCRICAO VARCHAR(30)    ,
  PROCEDIMENTO TEXT      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX STATUS_PARCELA_FK1 ON STATUS_PARCELA (ID_EMPRESA);






-- ------------------------------------------------------------
-- Tabela que armazena os dados de Base de Calculo Reduzida dos produtos.
-- ------------------------------------------------------------

CREATE TABLE BASE_CALCULO_REDUZIDA (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(50)    ,
  DATA_CADASTRO DATE    ,
  DATA_ALTERACAO DATE    ,
  UF_AC DECIMAL(18,6)    ,
  UF_AL DECIMAL(18,6)    ,
  UF_AP DECIMAL(18,6)    ,
  UF_AM DECIMAL(18,6)    ,
  UF_BA DECIMAL(18,6)    ,
  UF_CE DECIMAL(18,6)    ,
  UF_DF DECIMAL(18,6)    ,
  UF_ES DECIMAL(18,6)    ,
  UF_GO DECIMAL(18,6)    ,
  UF_MA DECIMAL(18,6)    ,
  UF_MT DECIMAL(18,6)    ,
  UF_MS DECIMAL(18,6)    ,
  UF_MG DECIMAL(18,6)    ,
  UF_PA DECIMAL(18,6)    ,
  UF_PB DECIMAL(18,6)    ,
  UF_PR DECIMAL(18,6)    ,
  UF_PE DECIMAL(18,6)    ,
  UF_PI DECIMAL(18,6)    ,
  UF_RJ DECIMAL(18,6)    ,
  UF_RN DECIMAL(18,6)    ,
  UF_RS DECIMAL(18,6)    ,
  UF_RO DECIMAL(18,6)    ,
  UF_RR DECIMAL(18,6)    ,
  UF_SC DECIMAL(18,6)    ,
  UF_SP DECIMAL(18,6)    ,
  UF_SE DECIMAL(18,6)    ,
  UF_TO DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_EMPRESA_BCR ON BASE_CALCULO_REDUZIDA (ID_EMPRESA);



-- ------------------------------------------------------------
-- Autorização de Impressão de Doc. Fiscais
-- ------------------------------------------------------------

CREATE TABLE AIDF_AIMDF (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  NUMERO INTEGER    ,
  DATA_VALIDADE DATE    ,
  DATA_AUTORIZACAO DATE    ,
  NUMERO_AUTORIZACAO VARCHAR(20)    ,
  SEM_FORMULARIO_DISPONIVEL CHAR(1)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_EMPRESA_AIDF ON AIDF_AIMDF (ID_EMPRESA);




-- ------------------------------------------------------------
-- Armazena os almoxarifados vinculados ao depósito ou à própria empresa. Deve existir pelo menos um almoxarifado padrão.
-- ------------------------------------------------------------

CREATE TABLE ALMOXARIFADO (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  NOME VARCHAR(50)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_EMPRESA_ALMOXARIFADO ON ALMOXARIFADO (ID_EMPRESA);



CREATE TABLE TRIBUTACAO_ISS (
  ID INTEGER  NOT NULL  ,
  ID_OPERACAO_FISCAL INTEGER  NOT NULL  ,
  MODALIDADE_BC DECIMAL(18,6)    ,
  PORCENTO_BC DECIMAL(18,6)    ,
  ALIQ_PORCENTO DECIMAL(18,6)    ,
  ALIQ_UNID_ISS DECIMAL(18,6)    ,
  PAUTA_PRECO_MAXIMO DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_OPERACAO_FISCAL)
    REFERENCES OPERACAO_FISCAL(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX TRIBUTACAO_ISS_FK1 ON TRIBUTACAO_ISS (ID_OPERACAO_FISCAL);



-- ------------------------------------------------------------
-- Dados do registro em cartório;
-- ------------------------------------------------------------

CREATE TABLE REGISTRO_CARTORIO (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  NOME_CARTORIO VARCHAR(100)    ,
  DATA_REGISTRO DATE    ,
  NUMERO INTEGER    ,
  FOLHA INTEGER    ,
  LIVRO INTEGER    ,
  NIRE VARCHAR(50)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX REGISTRO_CARTORIO_FKIndex1 ON REGISTRO_CARTORIO (ID_EMPRESA);






CREATE TABLE FAP (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  FAP DECIMAL(18,6)    ,
  DATA_NICIAL DATE    ,
  DATA_FINAL DATE      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FAP_FKIndex1 ON FAP (ID_EMPRESA);



-- ------------------------------------------------------------
-- Esta tabela irá armazenar os Perfis tributários  diferentes existentes dentro do mix de produtos da empresa. Ou seja, os diferentes conjuntos de produtos cuja tributação sofrem variações. Definindo o GRUPO TRIBUTÁRIO (independente da classificação de grupo gerencial empregada pelo cliente). Isto é, produtos com tributações idênticas ficariam todos em um grupo independentemente  suas características intrínsecas.
-- Exemplos:
-- 1. Produtos de fabricação própria (sujeitos ao ICMS ST)
-- 2. Produtos de Revenda (sujeitos ao Regime do ICMS ST)
-- 3. Produtos de Revenda Não sujeitos ao ICMS ST
-- 4. Produtos com Suspensao de IPI
-- 5. Produtos com Suspensaçao de PIS, COFINS
-- 6. etc.
-- ------------------------------------------------------------

CREATE TABLE GRUPO_TRIBUTARIO (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)    ,
  COMENTARIO TEXT      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX GRUPO_TRIBUTARIO_FKIndex1 ON GRUPO_TRIBUTARIO (ID_EMPRESA);



-- ------------------------------------------------------------
-- Tabela para cadastro dos tipo de documentos que podem gerar contas a pagar: nota fiscal, boleto, recibo, etc.
-- ------------------------------------------------------------

CREATE TABLE DOCUMENTO_ORIGEM (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(30)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX DOCUMENTO_ORIGEM_FKIndex1 ON DOCUMENTO_ORIGEM (ID_EMPRESA);




-- ------------------------------------------------------------
-- Tabela com as contribuições para os sindicados patronais.
-- ------------------------------------------------------------

CREATE TABLE CONTRIB_SIND_PATRONAL (
  ID INTEGER  NOT NULL  ,
  ID_SINDICATO INTEGER  NOT NULL  ,
  VIGENCIA_ANO CHAR(4)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_SINDICATO)
    REFERENCES SINDICATO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_SIND_PATRO_CONTR ON CONTRIB_SIND_PATRONAL (ID_SINDICATO);




CREATE TABLE CONTRIB_SIND_PATRONAL_DET (
  ID INTEGER  NOT NULL  ,
  ID_CONTRIB_SIND_PATRONAL INTEGER  NOT NULL  ,
  DE DECIMAL(18,6)    ,
  ATE DECIMAL(18,6)    ,
  PERCENTUAL DECIMAL(18,6)    ,
  VALOR_ADICIONAR DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_CONTRIB_SIND_PATRONAL)
    REFERENCES CONTRIB_SIND_PATRONAL(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_CONTR_SIND_PATRONAL ON CONTRIB_SIND_PATRONAL_DET (ID_CONTRIB_SIND_PATRONAL);



-- ------------------------------------------------------------
-- Tabela que armazena os tipos de pagamento: DINHEIRO, CARTÃO, CHEQUE, etc.
-- Tipos padões já cadastrados pelo sistema para toda empresa:
-- 01 = Dinheiro | 02 = Cheque | 03 = Cartao
-- ------------------------------------------------------------

CREATE TABLE TIPO_PAGAMENTO (
  ID INTEGER  NOT NULL  ,
  ID_NATUREZA_FINANCEIRA INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  TIPO CHAR(2)    ,
  DESCRICAO VARCHAR(30)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_NATUREZA_FINANCEIRA)
    REFERENCES NATUREZA_FINANCEIRA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX TIPO_PAGAMENTO_FKIndex1 ON TIPO_PAGAMENTO (ID_EMPRESA);
CREATE INDEX TIPO_PAGAMENTO_FKIndex2 ON TIPO_PAGAMENTO (ID_NATUREZA_FINANCEIRA);





CREATE TABLE SOCIOS_RESP_EMPRESAS (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  ID_RESPONSAVEL_SOCIOS INTEGER  NOT NULL  ,
  RESPONSAVEL CHAR(1)    ,
  DATA_INGRESSO DATE    ,
  DATA_SAIDA DATE    ,
  PORCENTO_CAPITAL_VOTANTE DECIMAL(18,6)    ,
  PORCENTO_CAPITAL_TOTAL DECIMAL(18,6)    ,
  CODIGO_SOCIO_RFB INTEGER    ,
  VALOR_PRO_LABORE DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_RESPONSAVEL_SOCIOS)
    REFERENCES RESPONSAVEL_SOCIOS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX SOCIOS_RESP_EMPRESAS_FKIndex1 ON SOCIOS_RESP_EMPRESAS (ID_RESPONSAVEL_SOCIOS);
CREATE INDEX SOCIOS_RESP_EMPRESAS_FKIndex2 ON SOCIOS_RESP_EMPRESAS (ID_EMPRESA);




CREATE TABLE TIPO_RECEBIMENTO (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  ID_NATUREZA_FINANCEIRA INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)    ,
  TIPO CHAR(1)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_NATUREZA_FINANCEIRA)
    REFERENCES NATUREZA_FINANCEIRA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX TIPO_RECEBIMENTO_FKIndex1 ON TIPO_RECEBIMENTO (ID_NATUREZA_FINANCEIRA);
CREATE INDEX TIPO_RECEBIMENTO_FKIndex2 ON TIPO_RECEBIMENTO (ID_EMPRESA);



-- ------------------------------------------------------------
-- Tabela de contatos.
-- ------------------------------------------------------------

CREATE TABLE CONTATO (
  ID INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER    ,
  NOME VARCHAR(100)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_EMPRESA_CONTATO ON CONTATO (ID_EMPRESA);
CREATE INDEX FK_PESSOA_CONTATO ON CONTATO (ID_PESSOA);



-- ------------------------------------------------------------
-- Tabela dos e-mails dos contatos.
-- ------------------------------------------------------------

CREATE TABLE CONTATO_EMAIL (
  ID INTEGER  NOT NULL  ,
  ID_CONTATO INTEGER  NOT NULL  ,
  ID_TIPO_EMAIL INTEGER  NOT NULL  ,
  EMAIL VARCHAR(250)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_CONTATO)
    REFERENCES CONTATO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TIPO_EMAIL)
    REFERENCES TIPO_EMAIL(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_CONTATO_EMAIL ON CONTATO_EMAIL (ID_CONTATO);
CREATE INDEX FK_TIPO_EMAIL_CONTATO ON CONTATO_EMAIL (ID_TIPO_EMAIL);



-- ------------------------------------------------------------
-- Armazena os saldos de determinada conta para todos os meses do ano. A partir daí o usuário poderá fazer um comparativo dos saldos orçados com os valores realizados nos lançamentos contábeis.
-- ------------------------------------------------------------

CREATE TABLE CONTABIL_LANCAMENTO_ORCADO (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  ANO CHAR(4)    ,
  JANEIRO DECIMAL(18,6)    ,
  FEVEREIRO DECIMAL(18,6)    ,
  MARCO DECIMAL(18,6)    ,
  ABRIL DECIMAL(18,6)    ,
  MAIO DECIMAL(18,6)    ,
  JUNHO DECIMAL(18,6)    ,
  JULHO DECIMAL(18,6)    ,
  AGOSTO DECIMAL(18,6)    ,
  SETEMBRO DECIMAL(18,6)    ,
  OUTUBRO DECIMAL(18,6)    ,
  NOVEMBRO DECIMAL(18,6)    ,
  DEZEMBRO DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_CONTA_LANC_ORCADO ON CONTABIL_LANCAMENTO_ORCADO (ID_CONTABIL_CONTA);
CREATE INDEX CONTABIL_LANCAMENTO_ORCADO ON CONTABIL_LANCAMENTO_ORCADO (ID_EMPRESA);



-- ------------------------------------------------------------
-- Lançamentos efetuados no sistema contábil - cabeçalho
-- ------------------------------------------------------------

CREATE TABLE CONTABIL_LANCAMENTO_CAB (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  ID_CONTABIL_LOTE INTEGER  NOT NULL  ,
  DATA_LANCAMENTO DATE    ,
  TIPO CHAR(4)    ,
  LIBERADO CHAR(1)    ,
  DATA_INC DATE    ,
  DOCUMENTO VARCHAR(50)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_CONTABIL_LOTE)
    REFERENCES CONTABIL_LOTE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CONTABIL_LANCAMENTO_CAB_FK2 ON CONTABIL_LANCAMENTO_CAB (ID_CONTABIL_LOTE);
CREATE INDEX CONTABIL_LANCAMENTO_CAB ON CONTABIL_LANCAMENTO_CAB (ID_EMPRESA);




-- ------------------------------------------------------------
-- Tabela dos telefones dos contatos.
-- ------------------------------------------------------------

CREATE TABLE CONTATO_TELEFONE (
  ID INTEGER  NOT NULL  ,
  ID_TIPO_TELEFONE INTEGER  NOT NULL  ,
  ID_CONTATO INTEGER  NOT NULL  ,
  TELEFONE VARCHAR(10)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_CONTATO)
    REFERENCES CONTATO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TIPO_TELEFONE)
    REFERENCES TIPO_TELEFONE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_CONTATO_TELEFONE ON CONTATO_TELEFONE (ID_CONTATO);
CREATE INDEX FK_TIPO_TELEFONE_CONTATO ON CONTATO_TELEFONE (ID_TIPO_TELEFONE);



CREATE TABLE EMPRESA_CNAE (
  ID_CNAE INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  PRINCIPAL CHAR(1)    ,
  RAMO_ATIVIDADE VARCHAR(50)    ,
  OBJETO_SOCIAL TEXT      ,
PRIMARY KEY(ID_CNAE, ID_EMPRESA)    ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CNAE)
    REFERENCES CNAE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_EMPRESA_CNAE ON EMPRESA_CNAE (ID_EMPRESA);
CREATE INDEX FK_CNAE_EMPRESA ON EMPRESA_CNAE (ID_CNAE);





-- ------------------------------------------------------------
-- Tabela de cargos.
-- ------------------------------------------------------------

CREATE TABLE CARGO (
  ID INTEGER  NOT NULL  ,
  ID_CBO INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  NOME VARCHAR(50)    ,
  DESCRICAO TEXT    ,
  SALARIO DECIMAL(18,6)    ,
  CBO_94 VARCHAR(10)    ,
  CBO_02 VARCHAR(10)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CBO)
    REFERENCES CBO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_EMPRESA_CARGO ON CARGO (ID_EMPRESA);
CREATE INDEX CARGO_FKIndex2 ON CARGO (ID_CBO);





CREATE TABLE EMPRESA_PESSOA (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL    ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX EMPRESA_PESSOA_FKIndex1 ON EMPRESA_PESSOA (ID_EMPRESA);
CREATE INDEX EMPRESA_PESSOA_FKIndex2 ON EMPRESA_PESSOA (ID_PESSOA);



-- ------------------------------------------------------------
-- Esta tabela irá armazenar os lançamentos Programados, assim chamados aqueles que tem data e valor já conhecidos, porém pelo regime de Competencia deve aguardar as data próprias para serem efetivados. Ex. A empresa contratou um seguro com validade de 12 meses, pelo regime de competencia deve ser lançar este valor em ATIVO CIRCULANTE sub grupo DESP. ANTECIPADAS (ou do EXERC. SEGUINTE) e depois em dada mês fazer o lançamento baixando do ATIVO CIRCULANTE  e lançando no GRUPO DE CONTA DE RESULTADO. Desta forma, sempre que ocorrer tais eventos na empresa o usuario irá deixar estes lançamentos Agendados para o sistema processar nas datas próprias. Para isso, devemo criar uma rotina no Executável que toda vez que o sistema contábil for aberto ela cheque nesta tabela a existencia de Lançamentos programados e os efetive.
-- ------------------------------------------------------------

CREATE TABLE LANCAM_PROGRAMADO_CAB (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  ID_CONTABIL_LOTE INTEGER  NOT NULL  ,
  TIPO CHAR(4)    ,
  DATA_INC DATE    ,
  DATA_REALIZADA DATE    ,
  LIBERADO CHAR(1)    ,
  DATA_PREVISTA DATE    ,
  DOCUMENTO VARCHAR(30)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_CONTABIL_LOTE)
    REFERENCES CONTABIL_LOTE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX LANCAMENTO_PROGRAMADO_FK1 ON LANCAM_PROGRAMADO_CAB (ID_CONTABIL_LOTE);
CREATE INDEX LANCAM_PROGRAMADO_CAB ON LANCAM_PROGRAMADO_CAB (ID_EMPRESA);



-- ------------------------------------------------------------
-- Esta tabela ira armazenar os titulos transferidos para BANCOS com finalidade de desconto ou para Fornecedores.
-- ------------------------------------------------------------

CREATE TABLE TRANSFERENCIA_TITULO (
  ID INTEGER  NOT NULL  ,
  ID_TIPO_RECEBIMENTO INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER    ,
  DESCRICAO VARCHAR(100)    ,
  DATA_INC DATE    ,
  VALOR_TOTAL DECIMAL(18,6)    ,
  VALOR_JUROS DECIMAL(18,6)    ,
  TAXA_JUROS DECIMAL(18,6)    ,
  DESPESAS DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TIPO_RECEBIMENTO)
    REFERENCES TIPO_RECEBIMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX TRANSFERENCIA_TITULO_FKIndex1 ON TRANSFERENCIA_TITULO (ID_PESSOA);
CREATE INDEX TRANSFERENCIA_TITULO_FKIndex2 ON TRANSFERENCIA_TITULO (ID_TIPO_RECEBIMENTO);



-- ------------------------------------------------------------
-- Tabela de endereços.
-- ------------------------------------------------------------

CREATE TABLE ENDERECO (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER    ,
  ID_PESSOA INTEGER    ,
  LOGRADOURO VARCHAR(100)    ,
  NUMERO VARCHAR(10)    ,
  COMPLEMENTO VARCHAR(100)    ,
  BAIRRO VARCHAR(100)    ,
  CIDADE VARCHAR(100)    ,
  CEP VARCHAR(8)    ,
  MUNICIPIO_IBGE INTEGER    ,
  UF CHAR(2)    ,
  FONE VARCHAR(10)    ,
  FAX VARCHAR(10)    ,
  PRINCIPAL CHAR(1)    ,
  ENTREGA CHAR(1)    ,
  COBRANCA CHAR(1)    ,
  CORRESPONDENCIA CHAR(1)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_PESSOA_ENDERECO ON ENDERECO (ID_PESSOA);
CREATE INDEX FK_EMPRESA_ENDERECO ON ENDERECO (ID_EMPRESA);



CREATE TABLE ENCERRAMENTO_DET (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  ID_CONTABIL_ENCERRAMENTO_EXE INTEGER  NOT NULL  ,
  SALDO_ANTERIOR DECIMAL(18,6)    ,
  VALOR_DEBITO DECIMAL(18,6)    ,
  VALOR_CREDITO DECIMAL(18,6)    ,
  SALDO DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_CONTABIL_ENCERRAMENTO_EXE)
    REFERENCES CONTABIL_ENCERRAMENTO_EXE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ENCERRAMENTO_DET_FK1 ON ENCERRAMENTO_DET (ID_CONTABIL_ENCERRAMENTO_EXE);
CREATE INDEX ENCERRAMENTO_DET_FK2 ON ENCERRAMENTO_DET (ID_CONTABIL_CONTA);



-- ------------------------------------------------------------
-- Tabela de lançamentos das contas a pagar.
-- ------------------------------------------------------------

CREATE TABLE LANCAMENTO_PAGAR (
  ID INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  ID_DOCUMENTO_ORIGEM INTEGER  NOT NULL  ,
  PAGAMENTO_COMPARTILHADO CHAR(1)    ,
  QUANTIDADE_PARCELA INTEGER    ,
  VALOR_TOTAL DECIMAL(18,6)    ,
  VALOR_A_PAGAR DECIMAL(18,6)    ,
  DATA_LANCAMENTO DATE    ,
  IMAGEM_DOCUMENTO TEXT    ,
  PRIMEIRO_VENCIMENTO DATE    ,
  TIPO_CONTABIL CHAR(1)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_DOCUMENTO_ORIGEM)
    REFERENCES DOCUMENTO_ORIGEM(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_DOC_OR_LCTO_PAGAR ON LANCAMENTO_PAGAR (ID_DOCUMENTO_ORIGEM);
CREATE INDEX LANCAMENTO_PAGAR_FKIndex2 ON LANCAMENTO_PAGAR (ID_PESSOA);






-- ------------------------------------------------------------
-- Atende a empresas como supermercados e distribuidores. Tabela amarrada ao NCM.
-- ------------------------------------------------------------

CREATE TABLE TRIBUTACAO_FEDERAL (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  ID_NCM INTEGER  NOT NULL  ,
  PIS DECIMAL(18,6)    ,
  CST_PIS CHAR(2)    ,
  COFINS DECIMAL(18,6)    ,
  CST_COFINS CHAR(2)    ,
  IPI DECIMAL(18,6)    ,
  CST_IPI CHAR(2)    ,
  BASE_CALCULO DECIMAL(18,6)    ,
  CFOP INTEGER      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_NCM)
    REFERENCES NCM(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_NCM_TRIBUTACAO_FEDERAL ON TRIBUTACAO_FEDERAL (ID_NCM);
CREATE INDEX FK_EMPRESA_TRIBUTACAO_FEDERAL ON TRIBUTACAO_FEDERAL (ID_EMPRESA);



CREATE TABLE LANC_PROGRAMADO_DET (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  ID_CONTABIL_HISTORICO INTEGER  NOT NULL  ,
  ID_LANCAM_PROGRAMADO_CAB INTEGER  NOT NULL  ,
  HISTORICO VARCHAR(200)    ,
  VALOR DECIMAL(18,6)      ,
PRIMARY KEY(ID)      ,
  FOREIGN KEY(ID_LANCAM_PROGRAMADO_CAB)
    REFERENCES LANCAM_PROGRAMADO_CAB(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_HISTORICO)
    REFERENCES CONTABIL_HISTORICO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX LANC_PROGRAMADO_DET_FK1 ON LANC_PROGRAMADO_DET (ID_LANCAM_PROGRAMADO_CAB);
CREATE INDEX LANC_PROGRAMADO_DET_FK2 ON LANC_PROGRAMADO_DET (ID_CONTABIL_CONTA);
CREATE INDEX LANC_PROGRAMADO_DET_FK3 ON LANC_PROGRAMADO_DET (ID_CONTABIL_HISTORICO);



-- ------------------------------------------------------------
-- Armazenas as contas de banco e de caixa interno da empresa.
-- ------------------------------------------------------------

CREATE TABLE CONTA_CAIXA (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  ID_AGENCIA_BANCO INTEGER  NOT NULL  ,
  CODIGO VARCHAR(20)    ,
  NOME VARCHAR(50)    ,
  DESCRICAO TEXT    ,
  TIPO CHAR(1)      ,
PRIMARY KEY(ID)      ,
  FOREIGN KEY(ID_AGENCIA_BANCO)
    REFERENCES AGENCIA_BANCO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_AGENCIA_CONTA ON CONTA_CAIXA (ID_AGENCIA_BANCO);
CREATE INDEX FK_EMPRESA_CONTA_CAIXA ON CONTA_CAIXA (ID_EMPRESA);
CREATE INDEX CONTA_CAIXA_FKIndex3 ON CONTA_CAIXA (ID_CONTABIL_CONTA);




-- ------------------------------------------------------------
-- Armazena os lançamentos contábeis - detalhes.
-- ------------------------------------------------------------

CREATE TABLE CONTABIL_LANCAMENTO_DET (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  ID_CONTABIL_HISTORICO INTEGER  NOT NULL  ,
  ID_CONTABIL_LANCAMENTO_CAB INTEGER  NOT NULL  ,
  HISTORICO TEXT    ,
  VALOR DECIMAL(18,6)    ,
  TIPO CHAR(1)      ,
PRIMARY KEY(ID)      ,
  FOREIGN KEY(ID_CONTABIL_LANCAMENTO_CAB)
    REFERENCES CONTABIL_LANCAMENTO_CAB(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_HISTORICO)
    REFERENCES CONTABIL_HISTORICO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_CONTABIL_LANCAMENTO ON CONTABIL_LANCAMENTO_DET (ID_CONTABIL_LANCAMENTO_CAB);
CREATE INDEX FK_HIST_LANCAMENTO ON CONTABIL_LANCAMENTO_DET (ID_CONTABIL_HISTORICO);
CREATE INDEX FK_CONTA_LANCAMENTO ON CONTABIL_LANCAMENTO_DET (ID_CONTABIL_CONTA);




-- ------------------------------------------------------------
-- Tabela de convênios.
-- ------------------------------------------------------------

CREATE TABLE CONVENIO (
  ID INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  NOME VARCHAR(100)    ,
  DESCRICAO TEXT    ,
  DESCONTO DECIMAL(18,6)    ,
  DATA_VENCIMENTO DATE    ,
  LOGRADOURO VARCHAR(100)    ,
  NUMERO VARCHAR(10)    ,
  BAIRRO VARCHAR(60)    ,
  MUNICIPIO_IBGE INTEGER    ,
  UF CHAR(2)    ,
  CONTATO VARCHAR(30)    ,
  TELEFONE VARCHAR(10)    ,
  DATA_CADASTRO DATE      ,
PRIMARY KEY(ID)      ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_EMPRESA_CONVENIO ON CONVENIO (ID_EMPRESA);
CREATE INDEX CONVENIO_FKIndex2 ON CONVENIO (ID_CONTABIL_CONTA);
CREATE INDEX CONVENIO_FKIndex3 ON CONVENIO (ID_PESSOA);



-- ------------------------------------------------------------
-- Tabela das operadoras de cartão.
-- ------------------------------------------------------------

CREATE TABLE OPERADORA_CARTAO (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  ID_CONTA_CAIXA INTEGER  NOT NULL  ,
  BANDEIRA VARCHAR(30)    ,
  NOME VARCHAR(50)    ,
  TAXA_ADM DECIMAL(18,6)    ,
  TAXA_ADM_DEBITO DECIMAL(18,6)    ,
  VALOR_ALUGUEL_POS_PIN DECIMAL(18,6)    ,
  VENCIMENTO_ALUGUEL INTEGER    ,
  FONE VARCHAR(14)    ,
  FONE2 VARCHAR(14)      ,
PRIMARY KEY(ID)      ,
  FOREIGN KEY(ID_CONTA_CAIXA)
    REFERENCES CONTA_CAIXA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX OPERADORA_CARTAO_FKIndex1 ON OPERADORA_CARTAO (ID_CONTA_CAIXA);
CREATE INDEX OPERADORA_CARTAO_FKIndex2 ON OPERADORA_CARTAO (ID_PESSOA);
CREATE INDEX OPERADORA_CARTAO_FKIndex3 ON OPERADORA_CARTAO (ID_CONTABIL_CONTA);



CREATE TABLE CAIXA_LANC_CONTAB (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_LANCAMENTO_DET INTEGER  NOT NULL  ,
  ID_TIPO_RECEBIMENTO INTEGER    ,
  ID_TIPO_PAGAMENTO INTEGER    ,
  ID_CONTA_CAIXA INTEGER  NOT NULL  ,
  DATA_INC DATE    ,
  VALOR DECIMAL(18,6)      ,
PRIMARY KEY(ID)        ,
  FOREIGN KEY(ID_CONTA_CAIXA)
    REFERENCES CONTA_CAIXA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TIPO_PAGAMENTO)
    REFERENCES TIPO_PAGAMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TIPO_RECEBIMENTO)
    REFERENCES TIPO_RECEBIMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_LANCAMENTO_DET)
    REFERENCES CONTABIL_LANCAMENTO_DET(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CAIXA_LANC_CONTAB_FKIndex1 ON CAIXA_LANC_CONTAB (ID_CONTA_CAIXA);
CREATE INDEX CAIXA_LANC_CONTAB_FKIndex3 ON CAIXA_LANC_CONTAB (ID_TIPO_PAGAMENTO);
CREATE INDEX CAIXA_LANC_CONTAB_FKIndex4 ON CAIXA_LANC_CONTAB (ID_TIPO_RECEBIMENTO);
CREATE INDEX CAIXA_LANC_CONTAB_FK4 ON CAIXA_LANC_CONTAB (ID_CONTABIL_LANCAMENTO_DET);



-- ------------------------------------------------------------
-- Esta tabela irá armazenar as tributações de IPI usadas pelas empresas.
-- ------------------------------------------------------------

CREATE TABLE TRIBUTACAO_IPI_DIPI (
  ID_TRIBUTACAO_IPI INTEGER  NOT NULL  ,
  ID_GRUPO_TRIBUTARIO INTEGER  NOT NULL  ,
  ID_OPERACAO_FISCAL INTEGER  NOT NULL  ,
  ID_TIPO_RECEITA_DIPI INTEGER  NOT NULL  ,
  ID_CST_IPI INTEGER  NOT NULL  ,
  MODALIDADE_BASE_CALCULO CHAR(1)    ,
  ALIQ_PORCENTO DECIMAL(18,6)    ,
  ALIQ_UNID DECIMAL(18,6)    ,
  PORCENTO_BASE_CALCULO DECIMAL(18,6)    ,
  PRECO_MAXIMO DECIMAL(18,6)    ,
  PAUTA_FISCAL DECIMAL(18,6)              ,
  FOREIGN KEY(ID_OPERACAO_FISCAL)
    REFERENCES OPERACAO_FISCAL(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TRIBUTACAO_IPI)
    REFERENCES TRIBUTACAO_IPI(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_GRUPO_TRIBUTARIO)
    REFERENCES GRUPO_TRIBUTARIO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CST_IPI)
    REFERENCES CST_IPI(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TIPO_RECEITA_DIPI)
    REFERENCES TIPO_RECEITA_DIPI(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX TRIBUTACAO_IPI_DIPI_FK1 ON TRIBUTACAO_IPI_DIPI (ID_OPERACAO_FISCAL);
CREATE INDEX TRIBUTACAO_IPI_DIPI_FK2 ON TRIBUTACAO_IPI_DIPI (ID_TRIBUTACAO_IPI);
CREATE INDEX TRIBUTACAO_IPI_DIPI_FK3 ON TRIBUTACAO_IPI_DIPI (ID_GRUPO_TRIBUTARIO);
CREATE INDEX TRIBUTACAO_IPI_DIPI_FK4 ON TRIBUTACAO_IPI_DIPI (ID_CST_IPI);
CREATE INDEX TRIBUTACAO_IPI_DIPI_FK5 ON TRIBUTACAO_IPI_DIPI (ID_TIPO_RECEITA_DIPI);



CREATE TABLE ICMS_CUSTOMIZADO (
  ID INTEGER  NOT NULL  ,
  ID_CSOSN INTEGER  NOT NULL  ,
  ID_CFOP INTEGER  NOT NULL  ,
  ID_UF INTEGER  NOT NULL  ,
  ID_CST_B_ICMS INTEGER  NOT NULL  ,
  ID_OPERACAO_FISCAL INTEGER  NOT NULL  ,
  MODALIDADE_BC CHAR(1)    ,
  PORCENTO_BC_INTERNA DECIMAL(18,6)    ,
  PAUTA_PRECO_MAXIMO DECIMAL(18,6)    ,
  ALIQ_INTERNA_ORIGEM DECIMAL(18,6)    ,
  MODALIDADE_BC_ICMS_ST CHAR(1)    ,
  MVA DECIMAL(18,6)    ,
  PORCENTO_BC_ICMS_ST DECIMAL(18,6)    ,
  ALIQ_INTERESTADUAL DECIMAL(18,6)    ,
  ALIQ_INTERNA_DESTINO DECIMAL(18,6)    ,
  PAUTA_ICMS_ST DECIMAL(18,6)      ,
PRIMARY KEY(ID)          ,
  FOREIGN KEY(ID_CFOP)
    REFERENCES CFOP(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CSOSN)
    REFERENCES CSOSN(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CST_B_ICMS)
    REFERENCES CST_B_ICMS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_UF)
    REFERENCES UF(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_OPERACAO_FISCAL)
    REFERENCES OPERACAO_FISCAL(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ICMS_CUSTOMIZADO_FKIndex1 ON ICMS_CUSTOMIZADO (ID_CFOP);
CREATE INDEX ICMS_CUSTOMIZADO_FKIndex2 ON ICMS_CUSTOMIZADO (ID_CSOSN);
CREATE INDEX ICMS_CUSTOMIZADO_FKIndex3 ON ICMS_CUSTOMIZADO (ID_CST_B_ICMS);
CREATE INDEX ICMS_CUSTOMIZADO_FKIndex4 ON ICMS_CUSTOMIZADO (ID_UF);
CREATE INDEX ICMS_CUSTOMIZADO_FKIndex5 ON ICMS_CUSTOMIZADO (ID_OPERACAO_FISCAL);



-- ------------------------------------------------------------
-- O objetivo é relacionar para cada CST_PIS um codigo de apuração conforme a tabela acima, informando ainda a modalidade calculo do PIS que pode ser por percentual ou por unidade de produto.
-- Com esta tabela podemos armazenar as inúmeras formas de calculo, combinada com suas respectivas alíquotas e CST_PIS possíves e imagináveis que existem ou venha a existir na nossa complexa legislação.
-- Desta forma, podemos fazer este vínculo em TABELA DE GRUPO_TRIBUTACAO (conforme venho defendendo desde o início do projeto) e depois vincular este ID_GRUPO_TRIBUTACAO no cadastro de cada dos produtos possibilitando um calculo totalmente automatizado em todo o sistema especialmente na EMISSAO de NFe e do CUPOM FISCAL.
-- Ainda não conseguir imaginar uma forma melhor de fazer o tratamento da imensa diversidade tributária brasileira, se não esta.
-- ------------------------------------------------------------

CREATE TABLE TRIB_PIS_COD_APURACAO (
  ID INTEGER  NOT NULL  ,
  ID_TRIBUTACAO_PIS INTEGER  NOT NULL  ,
  ID_OPERACAO_FISCAL INTEGER  NOT NULL  ,
  ID_GRUPO_TRIBUTARIO INTEGER  NOT NULL  ,
  ID_CST_PIS INTEGER  NOT NULL  ,
  ID_COD_APURACAO INTEGER  NOT NULL  ,
  MODALIDADE_BASE_CALCULO CHAR(1)    ,
  ALIQ_PORCENTO DECIMAL(18,6)    ,
  ALIQ_UNID DECIMAL(18,6)    ,
  PORCENTO_BASE_CALCULO DECIMAL(18,6)    ,
  PRECO_MAXIMO DECIMAL(18,6)    ,
  PAUTA_FISCAL DECIMAL(18,6)      ,
PRIMARY KEY(ID)          ,
  FOREIGN KEY(ID_CST_PIS)
    REFERENCES CST_PIS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_GRUPO_TRIBUTARIO)
    REFERENCES GRUPO_TRIBUTARIO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TRIBUTACAO_PIS)
    REFERENCES TRIBUTACAO_PIS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_OPERACAO_FISCAL)
    REFERENCES OPERACAO_FISCAL(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_COD_APURACAO)
    REFERENCES COD_APURACAO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX TRIB_PIS_COD_APURACAO_FK1 ON TRIB_PIS_COD_APURACAO (ID_CST_PIS);
CREATE INDEX TRIB_PIS_COD_APURACAO_FK2 ON TRIB_PIS_COD_APURACAO (ID_GRUPO_TRIBUTARIO);
CREATE INDEX TRIB_PIS_COD_APURACAO_FK3 ON TRIB_PIS_COD_APURACAO (ID_TRIBUTACAO_PIS);
CREATE INDEX TRIB_PIS_COD_APURACAO_FK4 ON TRIB_PIS_COD_APURACAO (ID_OPERACAO_FISCAL);
CREATE INDEX TRIB_PIS_COD_APURACAO_FK5 ON TRIB_PIS_COD_APURACAO (ID_COD_APURACAO);



-- ------------------------------------------------------------
-- O objetivo é relacionar para cada CST_COFINS um codigo de apuração conforme a tabela acima, informando ainda a modalidade calculo do COFINS que pode ser por percentual ou por unidade de produto.
-- Com esta tabela podemos armazenar as inúmeras formas de calculo, combinada com suas respectivas alíquotas e CST_COFINS possíves e imagináveis que existem ou venha a existir na nossa complexa legislação.
-- Desta forma, podemos fazer este vínculo em TABELA DE GRUPO_TRIBUTACAO (conforme venho defendendo desde o início do projeto) e depois vincular este ID_GRUPO_TRIBUTACAO no cadastro de cada dos produtos possibilitando um calculo totalmente automatizado em todo o sistema especialmente na EMISSAO de NFe e do CUPOM FISCAL.
-- Ainda não conseguir imaginar uma forma melhor de fazer o tratamento da imensa diversidade tributária brasileira, se não esta.
-- ------------------------------------------------------------

CREATE TABLE TRIB_COFINS_COD_APURACAO (
  ID INTEGER  NOT NULL  ,
  ID_TRIBUTACAO_COFINS INTEGER  NOT NULL  ,
  ID_GRUPO_TRIBUTARIO INTEGER  NOT NULL  ,
  ID_OPERACAO_FISCAL INTEGER  NOT NULL  ,
  ID_CST_COFINS INTEGER  NOT NULL  ,
  ID_COD_APURACAO INTEGER  NOT NULL  ,
  MODALIDADE_BASE_CALCULO CHAR(1)    ,
  ALIQ_PORCENTO DECIMAL(18,6)    ,
  ALIQ_UNID DECIMAL(18,6)    ,
  PORCENTO_BASE_CALCULO DECIMAL(18,6)    ,
  PRECO_MAXIMO DECIMAL(18,6)    ,
  PAUTA_FISCAL DECIMAL(18,6)      ,
PRIMARY KEY(ID)          ,
  FOREIGN KEY(ID_OPERACAO_FISCAL)
    REFERENCES OPERACAO_FISCAL(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TRIBUTACAO_COFINS)
    REFERENCES TRIBUTACAO_COFINS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_GRUPO_TRIBUTARIO)
    REFERENCES GRUPO_TRIBUTARIO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_COD_APURACAO)
    REFERENCES COD_APURACAO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CST_COFINS)
    REFERENCES CST_COFINS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX TRIB_COFINS_COD_APURACAO_FK1 ON TRIB_COFINS_COD_APURACAO (ID_OPERACAO_FISCAL);
CREATE INDEX TRIB_COFINS_COD_APURACAO_FK2 ON TRIB_COFINS_COD_APURACAO (ID_TRIBUTACAO_COFINS);
CREATE INDEX TRIB_COFINS_COD_APURACAO_FK3 ON TRIB_COFINS_COD_APURACAO (ID_GRUPO_TRIBUTARIO);
CREATE INDEX TRIB_COFINS_COD_APURACAO_FK4 ON TRIB_COFINS_COD_APURACAO (ID_COD_APURACAO);
CREATE INDEX TRIB_COFINS_COD_APURACAO_FK5 ON TRIB_COFINS_COD_APURACAO (ID_CST_COFINS);



-- ------------------------------------------------------------
-- Esta tabela ira armazenar a tributaçao para cada UF em cada GRUPO TRIBUTARIO dentro de cada operação cadastrada.
-- Uma tributaçao pode ser usada para uma UF ou várias UFs
-- ------------------------------------------------------------

CREATE TABLE TRIBUTACAO_ICMS_UF (
  ID INTEGER  NOT NULL  ,
  ID_TRIBUTACAO_ICMS INTEGER    ,
  ID_GRUPO_TRIBUTARIO INTEGER  NOT NULL  ,
  ID_CFOP INTEGER  NOT NULL  ,
  ID_CSOSN INTEGER  NOT NULL  ,
  ID_CST_B_ICMS INTEGER  NOT NULL  ,
  ID_OPERACAO_FISCAL INTEGER  NOT NULL  ,
  UF_ID INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)    ,
  MVA DECIMAL(18,6)    ,
  PORCENTO_BC_ICMS_ST DECIMAL(18,6)    ,
  MODALIDADE_BC_ICMS_ST CHAR(1)    ,
  ALIQ_INTERNA_DESTINO DECIMAL(18,6)    ,
  ALIQ_UNID_ICMS_ST DECIMAL(18,6)  NOT NULL  ,
  ALIQ_INTERESTADUAL DECIMAL(18,6)  NOT NULL  ,
  PRECO_MAXIMO_ICMS_ST INTEGER    ,
  PAUTA_ICMS_ST DECIMAL(18,6)  NOT NULL  ,
  ALIQ_INTERNA_ORIGEM DECIMAL(18,6)    ,
  ALIQ_UNID_INTERNA DECIMAL(18,6)    ,
  PAUTA_INTERNA DECIMAL(18,6)    ,
  PRECO_MAXIMO_INTERNA DECIMAL(18,6)    ,
  PORCENTO_BC_INTERNA DECIMAL(18,6)    ,
  MODALIDADE_BC_ICMS CHAR(1)      ,
PRIMARY KEY(ID)              ,
  FOREIGN KEY(ID_CFOP)
    REFERENCES CFOP(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CSOSN)
    REFERENCES CSOSN(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CST_B_ICMS)
    REFERENCES CST_B_ICMS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(UF_ID)
    REFERENCES UF(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_GRUPO_TRIBUTARIO)
    REFERENCES GRUPO_TRIBUTARIO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_OPERACAO_FISCAL)
    REFERENCES OPERACAO_FISCAL(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TRIBUTACAO_ICMS)
    REFERENCES TRIBUTACAO_ICMS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX TRIBUTACAO_ICMS_UF_FKI1 ON TRIBUTACAO_ICMS_UF (ID_CFOP);
CREATE INDEX TRIBUTACAO_ICMS_UF_FK2 ON TRIBUTACAO_ICMS_UF (ID_CSOSN);
CREATE INDEX TRIBUTACAO_ICMS_UF_FK3 ON TRIBUTACAO_ICMS_UF (ID_CST_B_ICMS);
CREATE INDEX TRIBUTACAO_ICMS_UF_FK4 ON TRIBUTACAO_ICMS_UF (UF_ID);
CREATE INDEX TRIBUTACAO_ICMS_UF_FK5 ON TRIBUTACAO_ICMS_UF (ID_GRUPO_TRIBUTARIO);
CREATE INDEX TRIBUTACAO_ICMS_UF_FK6 ON TRIBUTACAO_ICMS_UF (ID_OPERACAO_FISCAL);
CREATE INDEX TRIBUTACAO_ICMS_UF_FK7 ON TRIBUTACAO_ICMS_UF (ID_TRIBUTACAO_ICMS);



-- ------------------------------------------------------------
-- Tabela com a relação dos clientes.
-- ------------------------------------------------------------

CREATE TABLE CLIENTE (
  ID INTEGER  NOT NULL  ,
  ID_TRANSPORTADORA INTEGER  NOT NULL  ,
  ID_CONDICOES_PAGAMENTO INTEGER  NOT NULL  ,
  ID_TABELA_PRECO INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  ID_OPERACAO_FISCAL INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  ID_ATIVIDADE_FOR_CLI INTEGER  NOT NULL  ,
  ID_SITUACAO_FOR_CLI INTEGER  NOT NULL  ,
  DESDE DATE    ,
  DATA_CADASTRO DATE    ,
  OBSERVACOES TEXT    ,
  CONTA_TOMADOR VARCHAR(30)    ,
  NUM_DIAS_PRIM_VENC DECIMAL(4,0)    ,
  NUM_DIAS_INTERVALO_PARC DECIMAL(4,0)    ,
  QTD_PARCELAS DECIMAL(4,0)    ,
  GERA_FINANCEIRO CHAR(1)    ,
  INDICADOR_PRECO CHAR(1)    ,
  PORCENTO_DESCONTO DECIMAL(18,6)    ,
  FORMA_DESCONTO CHAR(1)    ,
  LIMITE_CREDITO DECIMAL(18,6)    ,
  TIPO_FRETE CHAR(1)      ,
PRIMARY KEY(ID)                ,
  FOREIGN KEY(ID_SITUACAO_FOR_CLI)
    REFERENCES SITUACAO_FOR_CLI(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_ATIVIDADE_FOR_CLI)
    REFERENCES ATIVIDADE_FOR_CLI(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_OPERACAO_FISCAL)
    REFERENCES OPERACAO_FISCAL(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TABELA_PRECO)
    REFERENCES TABELA_PRECO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONDICOES_PAGAMENTO)
    REFERENCES CONDICOES_PAGAMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TRANSPORTADORA)
    REFERENCES TRANSPORTADORA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_SITUACAO_CLIENTE ON CLIENTE (ID_SITUACAO_FOR_CLI);
CREATE INDEX FK_ATIVIDADE_CLIENTE ON CLIENTE (ID_ATIVIDADE_FOR_CLI);
CREATE INDEX FK_PESSOA_CLIENTE ON CLIENTE (ID_PESSOA);
CREATE INDEX CLIENTE_FKIndex4 ON CLIENTE (ID_OPERACAO_FISCAL);
CREATE INDEX CLIENTE_FKIndex5 ON CLIENTE (ID_CONTABIL_CONTA);
CREATE INDEX CLIENTE_FKIndex6 ON CLIENTE (ID_TABELA_PRECO);
CREATE INDEX CLIENTE_FKIndex7 ON CLIENTE (ID_CONDICOES_PAGAMENTO);
CREATE INDEX CLIENTE_FKIndex8 ON CLIENTE (ID_TRANSPORTADORA);











-- ------------------------------------------------------------
-- Tabela com os colaboradores da empresa.
-- ------------------------------------------------------------

CREATE TABLE COLABORADOR (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  ID_SINDICATO INTEGER  NOT NULL  ,
  ID_TIPO_ADMISSAO INTEGER  NOT NULL  ,
  ID_SITUACAO_COLABORADOR INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  ID_TIPO_COLABORADOR INTEGER  NOT NULL  ,
  ID_NIVEL_FORMACAO INTEGER  NOT NULL  ,
  ID_CARGO INTEGER  NOT NULL  ,
  ID_SETOR INTEGER  NOT NULL  ,
  MATRICULA VARCHAR(10)    ,
  TIPO_SANGUINEO VARCHAR(5)    ,
  FOTO_34 TEXT    ,
  DATA_CADASTRO DATE    ,
  DATA_ADMISSAO DATE    ,
  VENCIMENTO_FERIAS DATE    ,
  DATA_TRANSFERENCIA DATE    ,
  FGTS_OPTANTE CHAR(1)    ,
  FGTS_DATA_OPCAO DATE    ,
  FGTS_CONTA INTEGER    ,
  PAGAMENTO_FORMA CHAR(1)    ,
  PAGAMENTO_BANCO VARCHAR(10)    ,
  PAGAMENTO_AGENCIA INTEGER    ,
  PAGAMENTO_AGENCIA_DIGITO INTEGER    ,
  PAGAMENTO_CONTA INTEGER    ,
  PAGAMENTO_CONTA_DIGITO INTEGER    ,
  EXAME_MEDICO_ULTIMO DATE    ,
  EXAME_MEDICO_VENCIMENTO DATE    ,
  PIS_DATA_CADASTRO DATE    ,
  PIS_NUMERO INTEGER    ,
  PIS_BANCO VARCHAR(10)    ,
  PIS_AGENCIA INTEGER    ,
  PIS_AGENCIA_DIGITO INTEGER    ,
  CTPS_NUMERO VARCHAR(10)    ,
  CTPS_SERIE VARCHAR(10)    ,
  CTPS_DATA_EXPEDICAO DATE    ,
  CTPS_UF CHAR(2)    ,
  DESCONTO_PLANO_SAUDE CHAR(1)    ,
  SAI_NA_RAIS CHAR(1)    ,
  CATEGORIA_SEFIP CHAR(2)    ,
  OBSERVACOES TEXT    ,
  OCORRENCIA_SEFIP INTEGER    ,
  COD_ADMISSAO_CAGED INTEGER    ,
  COD_DEMISSAO_CAGED INTEGER    ,
  DATA_DEMISSAO DATE    ,
  CODIGO_DEMISSAO_SEFIP INTEGER      ,
PRIMARY KEY(ID)                  ,
  FOREIGN KEY(ID_SETOR)
    REFERENCES SETOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CARGO)
    REFERENCES CARGO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TIPO_COLABORADOR)
    REFERENCES TIPO_COLABORADOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_NIVEL_FORMACAO)
    REFERENCES NIVEL_FORMACAO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_SITUACAO_COLABORADOR)
    REFERENCES SITUACAO_COLABORADOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TIPO_ADMISSAO)
    REFERENCES TIPO_ADMISSAO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_SINDICATO)
    REFERENCES SINDICATO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_COLABORADOR_SETOR ON COLABORADOR (ID_SETOR);
CREATE INDEX FK_CARGO_COLABORADOR ON COLABORADOR (ID_CARGO);
CREATE INDEX FK_TIPO_COLABORADOR ON COLABORADOR (ID_TIPO_COLABORADOR);
CREATE INDEX FK_NIVEL_FORMACAO_COLABORADOR ON COLABORADOR (ID_NIVEL_FORMACAO);
CREATE INDEX FK_PESSOA_COLABORADOR ON COLABORADOR (ID_PESSOA);
CREATE INDEX FK_SITUACAO_COLABORADOR ON COLABORADOR (ID_SITUACAO_COLABORADOR);
CREATE INDEX FK_TIPO_ADMISSAO_COL ON COLABORADOR (ID_TIPO_ADMISSAO);
CREATE INDEX COLABORADOR_FKIndex8 ON COLABORADOR (ID_SINDICATO);
CREATE INDEX COLABORADOR_FKIndex9 ON COLABORADOR (ID_CONTABIL_CONTA);

















-- ------------------------------------------------------------
-- Tabela de produtos.
-- ------------------------------------------------------------

CREATE TABLE PRODUTO (
  ID INTEGER  NOT NULL  ,
  ID_ALMOXARIFADO INTEGER  NOT NULL  ,
  ID_GRUPO_TRIBUTARIO INTEGER  NOT NULL  ,
  ID_TIPO_ITEM_SPED INTEGER    ,
  ID_CST_A_ICMS INTEGER  NOT NULL  ,
  ID_NCM INTEGER  NOT NULL  ,
  ID_TRIBUTACAO_ESTADUAL INTEGER  NOT NULL  ,
  ID_BASE_CALCULO_REDUZIDA INTEGER  NOT NULL  ,
  ID_IMPOSTO_ST_UF INTEGER  NOT NULL  ,
  ID_MARCA_PRODUTO INTEGER  NOT NULL  ,
  ID_SUB_GRUPO INTEGER  NOT NULL  ,
  ID_UNIDADE INTEGER  NOT NULL  ,
  GTIN CHAR(14)    ,
  CODIGO_INTERNO VARCHAR(60)    ,
  NBM VARCHAR(10)    ,
  NOME VARCHAR(100)    ,
  DESCRICAO TEXT    ,
  DESCRICAO_PDV VARCHAR(30)    ,
  VALOR_COMPRA DECIMAL(18,6)    ,
  VALOR_VENDA DECIMAL(18,6)    ,
  PRECO_VENDA_MINIMO DECIMAL(18,6)    ,
  PRECO_SUGERIDO DECIMAL(18,6)    ,
  CUSTO_MEDIO_LIQUIDO DECIMAL(18,6)    ,
  PRECO_LUCRO_ZERO DECIMAL(18,6)    ,
  PRECO_LUCRO_MINIMO DECIMAL(18,6)    ,
  PRECO_LUCRO_MAXIMO DECIMAL(18,6)    ,
  MARKUP DECIMAL(18,6)    ,
  QUANTIDADE_ESTOQUE DECIMAL(18,6)    ,
  ESTOQUE_MINIMO DECIMAL(18,6)    ,
  ESTOQUE_MAXIMO DECIMAL(18,6)    ,
  EXCLUIDO CHAR(1)    ,
  INATIVO CHAR(1)    ,
  DATA_CADASTRO DATE    ,
  IMAGEM TEXT    ,
  EX_TIPI CHAR(3)    ,
  CODIGO_LST CHAR(4)    ,
  CLASSE_ABC CHAR(1)    ,
  IAT CHAR(1)    ,
  IPPT CHAR(1)    ,
  TIPO_ITEM_SPED CHAR(2)  NOT NULL  ,
  PESO DECIMAL(18,6)    ,
  PORCENTO_COMISSAO DECIMAL(18,6)    ,
  PONTO_PEDIDO DECIMAL(18,6)    ,
  ESTOQUE_IDEAL DECIMAL(18,6)    ,
  LOTE_ECONOMICO_COMPRA DECIMAL(18,6)      ,
PRIMARY KEY(ID)                      ,
  FOREIGN KEY(ID_UNIDADE)
    REFERENCES UNIDADE_PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_SUB_GRUPO)
    REFERENCES SUB_GRUPO_PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_MARCA_PRODUTO)
    REFERENCES MARCA_PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_IMPOSTO_ST_UF)
    REFERENCES IMPOSTO_ST_UF(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_BASE_CALCULO_REDUZIDA)
    REFERENCES BASE_CALCULO_REDUZIDA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TRIBUTACAO_ESTADUAL)
    REFERENCES TRIBUTACAO_ESTADUAL(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_NCM)
    REFERENCES NCM(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CST_A_ICMS)
    REFERENCES CST_A_ICMS(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TIPO_ITEM_SPED)
    REFERENCES TIPO_ITEM_SPED(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_GRUPO_TRIBUTARIO)
    REFERENCES GRUPO_TRIBUTARIO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_ALMOXARIFADO)
    REFERENCES ALMOXARIFADO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_PRODUTO_UNIDADE ON PRODUTO (ID_UNIDADE);
CREATE INDEX FK_PRODUTO_SUBGRUPO ON PRODUTO (ID_SUB_GRUPO);
CREATE INDEX FK_MARCA_PRODUTO ON PRODUTO (ID_MARCA_PRODUTO);
CREATE INDEX FK_IMPOSTO_ST_UF_PRODUTO ON PRODUTO (ID_IMPOSTO_ST_UF);
CREATE INDEX FK_BCR_PRODUTO ON PRODUTO (ID_BASE_CALCULO_REDUZIDA);
CREATE INDEX FK_TRIB_EST_PRODUTO ON PRODUTO (ID_TRIBUTACAO_ESTADUAL);
CREATE INDEX FK_NCM_PRODUTO ON PRODUTO (ID_NCM);
CREATE INDEX PRODUTO_FKIndex9 ON PRODUTO (ID_CST_A_ICMS);
CREATE INDEX PRODUTO_FKIndex10 ON PRODUTO (ID_TIPO_ITEM_SPED);
CREATE INDEX PRODUTO_FKIndex11 ON PRODUTO (ID_GRUPO_TRIBUTARIO);
CREATE INDEX PRODUTO_FKIndex12 ON PRODUTO (ID_ALMOXARIFADO);

















-- ------------------------------------------------------------
-- Tabela de promoções. 
-- ------------------------------------------------------------

CREATE TABLE PRODUTO_PROMOCAO (
  ID INTEGER  NOT NULL  ,
  ID_PRODUTO INTEGER  NOT NULL  ,
  DATA_INICIO DATE    ,
  DATA_FIM DATE    ,
  QUANTIDADE_EM_PROMOCAO DECIMAL(18,6)    ,
  QUANTIDADE_MAXIMA_CLIENTE DECIMAL(18,6)    ,
  VALOR DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_PRODUTO)
    REFERENCES PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_PRODUTO_PROMOCAO ON PRODUTO_PROMOCAO (ID_PRODUTO);



-- ------------------------------------------------------------
-- DRE - detalhes.
-- ------------------------------------------------------------

CREATE TABLE CONTABIL_DRE_DETALHE (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_DRE_CABECALHO INTEGER  NOT NULL  ,
  CLASSIFICACAO VARCHAR(30)    ,
  DESCRICAO VARCHAR(100)    ,
  FORMA_CALCULO CHAR(1)    ,
  SINAL CHAR(1)    ,
  NATUREZA CHAR(1)    ,
  VALOR DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_CONTABIL_DRE_CABECALHO)
    REFERENCES CONTABIL_DRE_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_DRE_CAB_DET ON CONTABIL_DRE_DETALHE (ID_CONTABIL_DRE_CABECALHO);






-- ------------------------------------------------------------
-- Códigos adicionais para produtos.
-- ------------------------------------------------------------

CREATE TABLE CODIGO_PRODUTO_ADICIONAL (
  ID INTEGER  NOT NULL  ,
  ID_PRODUTO INTEGER  NOT NULL  ,
  CODIGO VARCHAR(14)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_PRODUTO)
    REFERENCES PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_PRODUTO_CODIGO_ADD ON CODIGO_PRODUTO_ADICIONAL (ID_PRODUTO);



CREATE TABLE EXTRATO_CONTA_BANCO (
  ID INTEGER  NOT NULL  ,
  ID_CONTA_CAIXA INTEGER  NOT NULL  ,
  MES CHAR(2)    ,
  ANO CHAR(4)    ,
  DATA_MOVIMENTO DATE    ,
  DATA_BALANCETE DATE    ,
  HISTORICO VARCHAR(50)    ,
  DOCUMENTO VARCHAR(50)    ,
  VALOR DECIMAL(18,6)    ,
  CONCILIADO CHAR(1)    ,
  OBSERVACOES TEXT      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_CONTA_CAIXA)
    REFERENCES CONTA_CAIXA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX EXTRATO_CONTA_BANCO ON EXTRATO_CONTA_BANCO (ID_CONTA_CAIXA);




-- ------------------------------------------------------------
-- Armazena os possíveis períodos para gerar os fluxos de caixa.
-- 
-- Existem sete períodos padrões que já serão armazenados para todas as empresas cadastradas:
-- 01=Diário | 02=Semanal | 03=Mensal | 04=Bimestral | 05=Trimestral | 06=Semestral | 07=Anual
-- 
-- O objetivo é gerar de forma automática os períodos que serão informados pelo sistema/usuário.
-- ------------------------------------------------------------

CREATE TABLE FLUXO_CAIXA_PERIODO (
  ID INTEGER  NOT NULL  ,
  ID_CONTA_CAIXA INTEGER  NOT NULL  ,
  PERIODO CHAR(02)    ,
  NOME VARCHAR(30)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_CONTA_CAIXA)
    REFERENCES CONTA_CAIXA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FLUXO_CAIXA_PERIODO_FKIndex1 ON FLUXO_CAIXA_PERIODO (ID_CONTA_CAIXA);




-- ------------------------------------------------------------
-- Armazena os dados de um fechamento mensal.
-- ------------------------------------------------------------

CREATE TABLE FECHAMENTO_CAIXA_BANCO (
  ID INTEGER  NOT NULL  ,
  ID_CONTA_CAIXA INTEGER  NOT NULL  ,
  DATA_FECHAMENTO DATE    ,
  MES CHAR(2)    ,
  ANO CHAR(4)    ,
  SALDO_ANTERIOR DECIMAL(18,6)    ,
  RECEBIMENTOS DECIMAL(18,6)    ,
  PAGAMENTOS DECIMAL(18,6)    ,
  SALDO_CONTA DECIMAL(18,6)    ,
  CHEQUE_NAO_COMPENSADO DECIMAL(18,6)    ,
  SALDO_DISPONIVEL DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_CONTA_CAIXA)
    REFERENCES CONTA_CAIXA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FECHAMENTO_CAIXA_BANCO ON FECHAMENTO_CAIXA_BANCO (ID_CONTA_CAIXA);



-- ------------------------------------------------------------
-- Tabela de ficha técnica para produtos produzidos pelo proprio estabelecimento.
-- ------------------------------------------------------------

CREATE TABLE FICHA_TECNICA (
  ID INTEGER  NOT NULL  ,
  ID_PRODUTO INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(50)    ,
  ID_PRODUTO_FILHO INTEGER    ,
  QUANTIDADE DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_PRODUTO)
    REFERENCES PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_PRODUTO_FICHA_TECNICA ON FICHA_TECNICA (ID_PRODUTO);



-- ------------------------------------------------------------
-- Tabela que armazena os diversos fluxos de caixa da empresa.
-- 
-- Se o usuario informar um período mensal e preencher "10" no campo NUMERO_PERIODOS, o sistema automaticamente gerará os dados para o orçamento para os 10 meses a partir da DATA_INICIAL. 
-- 
-- O mesmo ocorre com os outros períodos: diário, semanal, anual, etc.
-- ------------------------------------------------------------

CREATE TABLE FLUXO_CAIXA (
  ID INTEGER  NOT NULL  ,
  ID_FLUXO_CAIXA_PERIODO INTEGER  NOT NULL  ,
  NOME VARCHAR(30)    ,
  DESCRICAO TEXT    ,
  DATA_INICIAL DATE    ,
  NUMERO_PERIODOS INTEGER    ,
  DATA_BASE DATE      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_FLUXO_CAIXA_PERIODO)
    REFERENCES FLUXO_CAIXA_PERIODO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FLUXO_CAIXA_FKIndex1 ON FLUXO_CAIXA (ID_FLUXO_CAIXA_PERIODO);








-- ------------------------------------------------------------
-- Tabela que garda as parcelas para pagamento. Caso o pagamento seja efetuado de uma vez, a tabela LANCAMENTO_PAGAR gerará uma parcela para ser paga e a mesma será armazenada 
-- nesta tabela.
-- ------------------------------------------------------------

CREATE TABLE PARCELA_PAGAR (
  ID INTEGER  NOT NULL  ,
  ID_STATUS_PARCELA_PAGAR INTEGER  NOT NULL  ,
  ID_LANCAMENTO_PAGAR INTEGER  NOT NULL  ,
  NUMERO_PARCELA INTEGER    ,
  DATA_EMISSAO DATE    ,
  DATA_VENCIMENTO DATE    ,
  DESCONTO_ATE DATE    ,
  SOFRE_RETENCAO CHAR(1)    ,
  VALOR DECIMAL(18,6)    ,
  TAXA_JURO DECIMAL(18,6)    ,
  TAXA_MULTA DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  VALOR_JURO DECIMAL(18,6)    ,
  VALOR_MULTA DECIMAL(18,6)    ,
  VALOR_DESCONTO DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_STATUS_PARCELA_PAGAR)
    REFERENCES STATUS_PARCELA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_LANCAMENTO_PAGAR)
    REFERENCES LANCAMENTO_PAGAR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_STATUS_PARCELA_PAGAR ON PARCELA_PAGAR (ID_STATUS_PARCELA_PAGAR);
CREATE INDEX FK_LANCAMENTO_PARCELA ON PARCELA_PAGAR (ID_LANCAMENTO_PAGAR);








-- ------------------------------------------------------------
-- Armazena as requisições de compra.
-- ------------------------------------------------------------

CREATE TABLE REQUISICAO_COMPRA (
  ID INTEGER  NOT NULL  ,
  ID_COLABORADOR INTEGER  NOT NULL  ,
  ID_TIPO_REQUISICAO INTEGER  NOT NULL  ,
  DATA_REQUISICAO DATE      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_TIPO_REQUISICAO)
    REFERENCES TIPO_REQUISICAO_COMPRA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_COLABORADOR)
    REFERENCES COLABORADOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_TIPO_REQ_COMPRA ON REQUISICAO_COMPRA (ID_TIPO_REQUISICAO);
CREATE INDEX REQUISICAO_COMPRA_FK ON REQUISICAO_COMPRA (ID_COLABORADOR);



-- ------------------------------------------------------------
-- Tabela com os detalhes da requisição de compra
-- ------------------------------------------------------------

CREATE TABLE REQUISICAO_COMPRA_DETALHE (
  ID INTEGER  NOT NULL  ,
  ID_PRODUTO INTEGER  NOT NULL  ,
  ID_REQUISICAO_COMPRA INTEGER  NOT NULL  ,
  QUANTIDADE DECIMAL(18,6)    ,
  ITEM_COTADO CHAR(1)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_REQUISICAO_COMPRA)
    REFERENCES REQUISICAO_COMPRA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PRODUTO)
    REFERENCES PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_REQUISICAO_COMPRA_DETALHE ON REQUISICAO_COMPRA_DETALHE (ID_REQUISICAO_COMPRA);
CREATE INDEX REQUISICAO_COMPRA_DETALHE_FK ON REQUISICAO_COMPRA_DETALHE (ID_PRODUTO);




CREATE TABLE TABELA_PRECO_PRODUTO (
  ID INTEGER  NOT NULL  ,
  ID_TABELA_PRECO INTEGER  NOT NULL  ,
  ID_PRODUTO INTEGER  NOT NULL  ,
  PRECO INTEGER      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_TABELA_PRECO)
    REFERENCES TABELA_PRECO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PRODUTO)
    REFERENCES PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX TABELA_PRECO_PRODUTO_FKIndex1 ON TABELA_PRECO_PRODUTO (ID_TABELA_PRECO);
CREATE INDEX TABELA_PRECO_PRODUTO_FKIndex2 ON TABELA_PRECO_PRODUTO (ID_PRODUTO);



-- ------------------------------------------------------------
-- Tabela que armazena os talonario de cheque de determinada empresa.
-- ------------------------------------------------------------

CREATE TABLE TALONARIO_CHEQUE (
  ID INTEGER  NOT NULL  ,
  ID_CONTA_CAIXA INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  TALAO VARCHAR(10)    ,
  NUMERO INTEGER    ,
  STATUS_TALAO CHAR(1)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTA_CAIXA)
    REFERENCES CONTA_CAIXA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_EMPRESA_TALONARIO_CHEQUE ON TALONARIO_CHEQUE (ID_EMPRESA);
CREATE INDEX FK_CONTA_TALONARIO ON TALONARIO_CHEQUE (ID_CONTA_CAIXA);




-- ------------------------------------------------------------
-- Contas vinculadas aos detalhes da DRE.
-- ------------------------------------------------------------

CREATE TABLE CONTABIL_DRE_VINCULO (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_CONTA INTEGER  NOT NULL  ,
  ID_CONTABIL_DRE_DETALHE INTEGER  NOT NULL    ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_CONTABIL_DRE_DETALHE)
    REFERENCES CONTABIL_DRE_DETALHE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_CONTA)
    REFERENCES CONTABIL_CONTA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_DRE_VINCULO ON CONTABIL_DRE_VINCULO (ID_CONTABIL_DRE_DETALHE);
CREATE INDEX FK_CONTA_DRE_VINCULO ON CONTABIL_DRE_VINCULO (ID_CONTABIL_CONTA);



-- ------------------------------------------------------------
-- Tabela que armazena os itens da cotação. Uma cotação pode ser gerada a partir de várias requisições e uma requisição pode gerar várias cotações.
-- ------------------------------------------------------------

CREATE TABLE COTACAO_COMPRA_DETALHE (
  ID INTEGER  NOT NULL  ,
  ID_PRODUTO INTEGER  NOT NULL  ,
  ID_FORNECEDOR_COTACAO_COMPRA INTEGER  NOT NULL  ,
  QUANTIDADE DECIMAL(18,6)    ,
  VALOR_UNITARIO DECIMAL(18,6)    ,
  VALOR_SUBTOTAL DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  VALOR_DESCONTO DECIMAL(18,6)    ,
  VALOR_TOTAL DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_FORNECEDOR_COTACAO_COMPRA)
    REFERENCES FORNECEDOR_COTACAO_COMPRA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PRODUTO)
    REFERENCES PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_FORNECEDOR_COTACAO_DETALHE ON COTACAO_COMPRA_DETALHE (ID_FORNECEDOR_COTACAO_COMPRA);
CREATE INDEX COTACAO_COMPRA_DETALHE_F3 ON COTACAO_COMPRA_DETALHE (ID_PRODUTO);



-- ------------------------------------------------------------
-- Tabela que armazena as unidades secundárias vinculadas a uma unidade principal e a tabela de produtos ja com o fator de conversão.
-- ------------------------------------------------------------

CREATE TABLE UNIDADE_CONVERSAO (
  ID INTEGER  NOT NULL  ,
  ID_PRODUTO INTEGER  NOT NULL  ,
  ID_UNIDADE_PRODUTO INTEGER  NOT NULL  ,
  SIGLA VARCHAR(10)    ,
  DESCRICAO TEXT    ,
  FATOR_CONVERSAO DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_UNIDADE_PRODUTO)
    REFERENCES UNIDADE_PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PRODUTO)
    REFERENCES PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_UNIDADE_CONVERSAO ON UNIDADE_CONVERSAO (ID_UNIDADE_PRODUTO);
CREATE INDEX FK_PRODUTO_CONVERSAO_UND ON UNIDADE_CONVERSAO (ID_PRODUTO);



-- ------------------------------------------------------------
-- Tabela que armazena  os dados dos colaboradores que são vendedores.
-- ------------------------------------------------------------

CREATE TABLE VENDEDOR (
  ID INTEGER  NOT NULL  ,
  ID_COLABORADOR INTEGER    ,
  ID_REPRESENTANTES INTEGER    ,
  COMISSAO DECIMAL(18,6)    ,
  META_VENDAS DECIMAL(18,6)    ,
  TIPO_COMISSAO CHAR(1)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_REPRESENTANTES)
    REFERENCES REPRESENTANTES(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_COLABORADOR)
    REFERENCES COLABORADOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX VENDEDOR_FK2 ON VENDEDOR (ID_REPRESENTANTES);
CREATE INDEX VENDEDOR_FKIndex2 ON VENDEDOR (ID_COLABORADOR);




-- ------------------------------------------------------------
-- Esta tabela irá armazenar os BORDEROS de titulos para desconto
-- ------------------------------------------------------------

CREATE TABLE BORDERO (
  ID INTEGER  NOT NULL  ,
  ID_TIPO_RECEBIMENTO INTEGER  NOT NULL  ,
  ID_CONTA_CAIXA INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)    ,
  VALOR_TOTAL DECIMAL(18,6)    ,
  VALOR_JUROS DECIMAL(18,6)    ,
  TAXA_JUROS DECIMAL(18,6)    ,
  VALOR_TAC DECIMAL(18,6)    ,
  DATA_INC DATE    ,
  DATA_LIBERACAO DATE    ,
  TARIFA_POR_TITULO DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_CONTA_CAIXA)
    REFERENCES CONTA_CAIXA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TIPO_RECEBIMENTO)
    REFERENCES TIPO_RECEBIMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX BORDERO_FKIndex1 ON BORDERO (ID_CONTA_CAIXA);
CREATE INDEX BORDERO_FKIndex2 ON BORDERO (ID_TIPO_RECEBIMENTO);



-- ------------------------------------------------------------
-- Tabela com os usuarios do sistema
-- ------------------------------------------------------------

CREATE TABLE USUARIO (
  ID INTEGER  NOT NULL  ,
  ID_COLABORADOR INTEGER  NOT NULL  ,
  ID_PAPEL INTEGER  NOT NULL  ,
  LOGIN VARCHAR(20)    ,
  SENHA VARCHAR(40)    ,
  DATA_CADASTRO DATE    ,
  ADMINISTRADOR CHAR(1)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_COLABORADOR)
    REFERENCES COLABORADOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PAPEL)
    REFERENCES PAPEL(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_COLABORADOR_USUARIO ON USUARIO (ID_COLABORADOR);
CREATE INDEX FK_PAPEL_USUARIO ON USUARIO (ID_PAPEL);



-- ------------------------------------------------------------
-- Tabela com os relacionamentos dos colaboradores.
-- ------------------------------------------------------------

CREATE TABLE COLABORADOR_RELACIONAMENTO (
  ID INTEGER  NOT NULL  ,
  ID_COLABORADOR INTEGER  NOT NULL  ,
  ID_TIPO_RELACIONAMENTO INTEGER  NOT NULL  ,
  NOME VARCHAR(100)    ,
  DATA_NASCIMENTO DATE    ,
  CPF VARCHAR(11)    ,
  REGISTRO_MATRICULA VARCHAR(50)    ,
  REGISTRO_CARTORIO VARCHAR(50)    ,
  REGISTRO_CARTORIO_NUMERO VARCHAR(50)    ,
  REGISTRO_NUMERO_LIVRO VARCHAR(10)    ,
  REGISTRO_NUMERO_FOLHA VARCHAR(10)    ,
  DATA_ENTREGA_DOCUMENTO DATE    ,
  SALARIO_FAMILIA CHAR(1)    ,
  SALARIO_FAMILIA_IDADE_LIMITE INTEGER    ,
  SALARIO_FAMILIA_DATA_FIM DATE    ,
  IMPOSTO_RENDA_IDADE_LIMITE INTEGER    ,
  IMPOSTO_RENDA_DATA_FIM INTEGER      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_COLABORADOR)
    REFERENCES COLABORADOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TIPO_RELACIONAMENTO)
    REFERENCES TIPO_RELACIONAMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_COLABORADOR_RELACIONAMENTO ON COLABORADOR_RELACIONAMENTO (ID_COLABORADOR);
CREATE INDEX FK_TIPO_REL_COLABORADOR ON COLABORADOR_RELACIONAMENTO (ID_TIPO_RELACIONAMENTO);














CREATE TABLE EMPRESA_PRODUTO (
  ID INTEGER  NOT NULL  ,
  ID_PRODUTO INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL    ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_PRODUTO)
    REFERENCES PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX EMPRESA_PRODUTO_FKIndex1 ON EMPRESA_PRODUTO (ID_PRODUTO);
CREATE INDEX EMPRESA_PRODUTO_FKIndex2 ON EMPRESA_PRODUTO (ID_EMPRESA);



-- ------------------------------------------------------------
-- Vinculo entre fornecedor e produto
-- ------------------------------------------------------------

CREATE TABLE FORNECEDOR_PRODUTO (
  ID INTEGER  NOT NULL  ,
  ID_FORNECEDOR INTEGER  NOT NULL  ,
  ID_PRODUTO INTEGER  NOT NULL  ,
  CODIGO_FORNECEDOR_PRODUTO VARCHAR(20)    ,
  DATA_ULTIMA_COMPRA DATE    ,
  PRECO_ULTIMA_COMPRA DECIMAL(18,6)    ,
  LOTE_MINIMO_COMPRA DECIMAL(18,6)    ,
  MENOR_EMBALGEM_COMPRA DECIMAL(18,6)    ,
  CUSTO_ULTIMA_COMPRA DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_PRODUTO)
    REFERENCES PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_FORNECEDOR)
    REFERENCES FORNECEDOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_PRODUTO_FORNECEDOR ON FORNECEDOR_PRODUTO (ID_PRODUTO);
CREATE INDEX FK_FORNECEDOR_PRODUTO ON FORNECEDOR_PRODUTO (ID_FORNECEDOR);







-- ------------------------------------------------------------
-- Esta tabela terá registro inserido quando no executivel for disparada a rotina de CALCULAR COMISSAO (OU LANCAR COMISSAO) o sistema irá nas tabelas VENDA_COMISSAO e RECEBIMENTO_COMISSAO. Na tabela venda comissao irá selecionar aquelas cujo o tipo seja FATURAMENTO e na tabela RECEBIMENTO_COMISSAO os lançamentos cujo tipo seja LIQUIDEZ. Se numa venda a comissao será no FATURAMENTO não deve haver lançamento de comissao na tabela VENDA_RECEBIMENTO que aramazena apenas aquelas cujo tipo de comissao seja LIQUIDEZ. 
-- Se a comissao for tipo LIQUIDEZ esse calculo deve ser baseado nos registros das tabelas RECEBIMENTO_COMISSAO.
-- ------------------------------------------------------------

CREATE TABLE LANCAMENTO_COMISSAO (
  ID INTEGER  NOT NULL  ,
  ID_VENDEDOR INTEGER  NOT NULL  ,
  ID_LANCAMENTO_PAGAR INTEGER  NOT NULL  ,
  COMPETENCIA VARCHAR(10)    ,
  VENCIMENTO DATE    ,
  BASE_CALCULO DECIMAL(18,6)    ,
  VALOR_COMISSAO DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_LANCAMENTO_PAGAR)
    REFERENCES LANCAMENTO_PAGAR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_VENDEDOR)
    REFERENCES VENDEDOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX LANCAMENTO_COMISSAO_FKIndex1 ON LANCAMENTO_COMISSAO (ID_LANCAMENTO_PAGAR);
CREATE INDEX LANCAMENTO_COMISSAO_FKIndex2 ON LANCAMENTO_COMISSAO (ID_VENDEDOR);





-- ------------------------------------------------------------
-- Esta tabela é para permitir que um lançamento a pagar possa ter varias naturezas financeiras e varias lançamentos contábeis a elas vinculadas.
-- ------------------------------------------------------------

CREATE TABLE LANC_PAGAR_NAT_FINAN (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_LANCAMENTO_DET INTEGER  NOT NULL  ,
  ID_NATUREZA_FINANCEIRA INTEGER  NOT NULL  ,
  ID_LANCAMENTO_PAGAR INTEGER  NOT NULL  ,
  DATA_INC DATE    ,
  VALOR DECIMAL(18,6)      ,
PRIMARY KEY(ID)      ,
  FOREIGN KEY(ID_LANCAMENTO_PAGAR)
    REFERENCES LANCAMENTO_PAGAR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_NATUREZA_FINANCEIRA)
    REFERENCES NATUREZA_FINANCEIRA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_LANCAMENTO_DET)
    REFERENCES CONTABIL_LANCAMENTO_DET(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX LANC_PAGAR_NAT_FINAN_F1 ON LANC_PAGAR_NAT_FINAN (ID_LANCAMENTO_PAGAR);
CREATE INDEX LANC_PAGAR_NAT_FINAN ON LANC_PAGAR_NAT_FINAN (ID_NATUREZA_FINANCEIRA);
CREATE INDEX LANC_PAGAR_NAT_FINAN_FK3 ON LANC_PAGAR_NAT_FINAN (ID_CONTABIL_LANCAMENTO_DET);



-- ------------------------------------------------------------
-- Tabela que armazena os itens do pedido. Uma cotação poderá gerar vários pedidos e um pedido pode ser gerado a partir de várias cotações.
-- ------------------------------------------------------------

CREATE TABLE PEDIDO_COMPRA_DETALHE (
  ID INTEGER  NOT NULL  ,
  ID_PRODUTO INTEGER  NOT NULL  ,
  ID_PEDIDO_COMPRA INTEGER  NOT NULL  ,
  QUANTIDADE DECIMAL(18,6)    ,
  VALOR_UNITARIO DECIMAL(18,6)    ,
  VALOR_SUBTOTAL DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  VALOR_DESCONTO DECIMAL(18,6)    ,
  VALOR_TOTAL DECIMAL(18,6)    ,
  CST_CSOSN CHAR(4)    ,
  CFOP INTEGER    ,
  BASE_CALCULO_ICMS DECIMAL(18,6)    ,
  VALOR_ICMS DECIMAL(18,6)    ,
  VALOR_IPI DECIMAL(18,6)    ,
  ALIQUOTA_ICMS DECIMAL(18,6)    ,
  ALIQUOTA_IPI DECIMAL(18,6)      ,
PRIMARY KEY(ID)      ,
  FOREIGN KEY(ID_PEDIDO_COMPRA)
    REFERENCES PEDIDO_COMPRA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PRODUTO)
    REFERENCES PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PRODUTO)
    REFERENCES PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX PEDIDO_COMPRA_DETALHE ON PEDIDO_COMPRA_DETALHE (ID_PEDIDO_COMPRA);
CREATE INDEX PEDIDO_COMPRA_DETALHE_FK3 ON PEDIDO_COMPRA_DETALHE (ID_PRODUTO);
CREATE INDEX PEDIDO_COMPRA_DETALHE_FK4 ON PEDIDO_COMPRA_DETALHE (ID_PRODUTO);



-- ------------------------------------------------------------
-- Armazena o cabeçalho do orçamento/pedido de venda.
-- 
-- O usuário informa aqui as condições de pagamentos, mas não gera neste momento as parcelas. As mesmas só serão geradas no momento da confirmação da venda.
-- ------------------------------------------------------------

CREATE TABLE ORCAMENTO_PEDIDO_VENDA_CAB (
  ID INTEGER  NOT NULL  ,
  ID_VENDEDOR INTEGER  NOT NULL  ,
  ID_TRANSPORTADORA INTEGER  NOT NULL  ,
  ID_CLIENTE INTEGER  NOT NULL  ,
  ID_CONDICOES_PAGAMENTO INTEGER  NOT NULL  ,
  TIPO CHAR(1)    ,
  CODIGO VARCHAR(20)    ,
  DATA_CADASTRO DATE    ,
  DATA_ENTREGA DATE    ,
  VALIDADE DATE    ,
  TIPO_FRETE CHAR(1)    ,
  VALOR_SUBTOTAL DECIMAL(18,6)    ,
  VALOR_FRETE DECIMAL(18,6)    ,
  TAXA_COMISSAO DECIMAL(18,6)    ,
  VALOR_COMISSAO DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  VALOR_DESCONTO DECIMAL(18,6)    ,
  VALOR_TOTAL DECIMAL(18,6)    ,
  OBSERVACOES TEXT      ,
PRIMARY KEY(ID)        ,
  FOREIGN KEY(ID_CONDICOES_PAGAMENTO)
    REFERENCES CONDICOES_PAGAMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TRANSPORTADORA)
    REFERENCES TRANSPORTADORA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CLIENTE)
    REFERENCES CLIENTE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_VENDEDOR)
    REFERENCES VENDEDOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_COND_PGTO_ORC_PED_VENDA ON ORCAMENTO_PEDIDO_VENDA_CAB (ID_CONDICOES_PAGAMENTO);
CREATE INDEX ORCAMENTO_PEDIDO_VENDA_CAB_FK5 ON ORCAMENTO_PEDIDO_VENDA_CAB (ID_TRANSPORTADORA);
CREATE INDEX ORCA_PED_VENDA_CAB_FK5 ON ORCAMENTO_PEDIDO_VENDA_CAB (ID_CLIENTE);
CREATE INDEX ORCA_PEDIDO_VENDA_CAB_FK4 ON ORCAMENTO_PEDIDO_VENDA_CAB (ID_VENDEDOR);






-- ------------------------------------------------------------
-- Tabela que armazena o cabeçalho das vendas do sistema.
-- ------------------------------------------------------------

CREATE TABLE VENDA_CABECALHO (
  ID INTEGER  NOT NULL  ,
  ID_CLIENTE INTEGER  NOT NULL  ,
  ID_VENDEDOR INTEGER  NOT NULL  ,
  ID_CONDICOES_PAGAMENTO INTEGER  NOT NULL  ,
  ID_ORCAMENTO_VENDA_CABECALHO INTEGER    ,
  DATA_VENDA DATE    ,
  DATA_SAIDA DATE    ,
  HORA_SAIDA VARCHAR(8)    ,
  NUMERO_FATURA INTEGER    ,
  LOCAL_ENTREGA VARCHAR(100)    ,
  LOCAL_COBRANCA VARCHAR(100)    ,
  VALOR_SUB_TOTAL DECIMAL(18,6)    ,
  TAXA_COMISSAO DECIMAL(18,6)    ,
  VALOR_COMISSAO DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  VALOR_DESCONTO DECIMAL(18,6)    ,
  VALOR_TOTAL DECIMAL(18,6)    ,
  TIPO_FRETE CHAR(1)    ,
  FORMA_PAGAMENTO CHAR(1)    ,
  BASE_CALCULO_ICMS_ST DECIMAL(18,6)    ,
  VALOR_ICMS_ST DECIMAL(18,6)    ,
  VALOR_FRETE DECIMAL(18,6)    ,
  VALOR_SEGURO DECIMAL(18,6)    ,
  VALOR_IPI DECIMAL(18,6)    ,
  OBSERVACOES TEXT    ,
  NUM_DIAS_PRIM_VENC DECIMAL(4,0)    ,
  INTERVALO_DIAS_PARCELAS DECIMAL(4,0)    ,
  QTD_PARCELAS DECIMAL(4,0)      ,
PRIMARY KEY(ID)        ,
  FOREIGN KEY(ID_ORCAMENTO_VENDA_CABECALHO)
    REFERENCES ORCAMENTO_PEDIDO_VENDA_CAB(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONDICOES_PAGAMENTO)
    REFERENCES CONDICOES_PAGAMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CLIENTE)
    REFERENCES CLIENTE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_VENDEDOR)
    REFERENCES VENDEDOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_ORCAMENTO_VENDA ON VENDA_CABECALHO (ID_ORCAMENTO_VENDA_CABECALHO);
CREATE INDEX FK_VENDA_CAB_CONDICOES ON VENDA_CABECALHO (ID_CONDICOES_PAGAMENTO);
CREATE INDEX VENDA_CABECALHO_FKIndex6 ON VENDA_CABECALHO (ID_CLIENTE);
CREATE INDEX VENDA_CABECALHO_FKIndex7 ON VENDA_CABECALHO (ID_VENDEDOR);






-- ------------------------------------------------------------
-- Tabela com a relação dos cheques vinculados a determinado talão.
-- ------------------------------------------------------------

CREATE TABLE CHEQUE (
  ID INTEGER  NOT NULL  ,
  ID_TALONARIO_CHEQUE INTEGER  NOT NULL  ,
  NUMERO INTEGER    ,
  STATUS_CHEQUE CHAR(1)    ,
  DATA_STATUS DATE      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_TALONARIO_CHEQUE)
    REFERENCES TALONARIO_CHEQUE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_TALONARIO_CHEQUE ON CHEQUE (ID_TALONARIO_CHEQUE);




-- ------------------------------------------------------------
-- Tabela que faz o controle dos cheque emitidos.
-- ------------------------------------------------------------

CREATE TABLE CHEQUE_EMITIDO (
  ID INTEGER  NOT NULL  ,
  ID_CHEQUE INTEGER  NOT NULL  ,
  DATA_EMISSAO DATE    ,
  DATA_COMPENSACAO DATE    ,
  VALOR DECIMAL(18,6)    ,
  NOMINAL_A VARCHAR(100)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_CHEQUE)
    REFERENCES CHEQUE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CHEQUE_EMITIDO_FKIndex1 ON CHEQUE_EMITIDO (ID_CHEQUE);



-- ------------------------------------------------------------
-- Armazena os itens de determinado fluxo de caixa.
-- 
-- =============
-- Exemplo para o campo PERIODO:
-- Se o usuário escolheu um periodo mensal, com DATA_INICIAL (tabela FLUXO_CAIXA) em 15/01/2011 e preencheu o campo NUMERO_PERIODOS (tabela FLUXO_CAIXA)  com o valor "5", para cada NATUREZA_FINANCEIRA serão gerados 5 registros na tabela FLUXO_CAIXA_DETALHE. O campo período seria preenchido da seguinte forma:
-- 
-- 01/2011
-- 02/2011
-- 03/2011
-- 04/2011
-- 05/2011
-- =============
-- ------------------------------------------------------------

CREATE TABLE FLUXO_CAIXA_DETALHE (
  ID INTEGER  NOT NULL  ,
  ID_FLUXO_CAIXA INTEGER  NOT NULL  ,
  PERIODO VARCHAR(10)    ,
  VALOR_ORCADO DECIMAL(18,6)    ,
  VALOR_REALIZADO DECIMAL(18,6)    ,
  TAXA_VARIACAO DECIMAL(18,6)    ,
  VALOR_VARIACAO DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_FLUXO_CAIXA)
    REFERENCES FLUXO_CAIXA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_FLUXO_CAIXA_DETALHE ON FLUXO_CAIXA_DETALHE (ID_FLUXO_CAIXA);






CREATE TABLE ROMANEIO_ENTREGA (
  ID INTEGER  NOT NULL  ,
  ID_COLABORADOR INTEGER  NOT NULL  ,
  ID_VENDA_CABECALHO INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)    ,
  DATA_PREVISTA DATE    ,
  DATA_SAIDA DATE    ,
  STATUS_ROMANEIO CHAR(1)    ,
  DATA_ENCERRAMENTO DATE      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_VENDA_CABECALHO)
    REFERENCES VENDA_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_COLABORADOR)
    REFERENCES COLABORADOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ROMANEIO_ENTREGA_FKIndex1 ON ROMANEIO_ENTREGA (ID_VENDA_CABECALHO);
CREATE INDEX ROMANEIO_ENTREGA_FKIndex2 ON ROMANEIO_ENTREGA (ID_COLABORADOR);




-- ------------------------------------------------------------
-- Faz o controle de quantidade de itens que saem da requisição e entram na cotação
-- ------------------------------------------------------------

CREATE TABLE REQUISICAO_COTACAO_DETALHE (
  ID INTEGER  NOT NULL  ,
  ID_COTACAO_COMPRA_DETALHE INTEGER  NOT NULL  ,
  ID_REQUISICAO_COMPRA_DETALHE INTEGER  NOT NULL  ,
  QUANTIDADE_COTADA DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_REQUISICAO_COMPRA_DETALHE)
    REFERENCES REQUISICAO_COMPRA_DETALHE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_COTACAO_COMPRA_DETALHE)
    REFERENCES COTACAO_COMPRA_DETALHE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_REQUISICAO_COTACAO_DETALHE ON REQUISICAO_COTACAO_DETALHE (ID_REQUISICAO_COMPRA_DETALHE);
CREATE INDEX FK_COTACAO_REQUISICAO_DETALHE ON REQUISICAO_COTACAO_DETALHE (ID_COTACAO_COMPRA_DETALHE);



-- ------------------------------------------------------------
-- Faz o controle de quantidade de itens que saem da cotação e entram no pedido
-- ------------------------------------------------------------

CREATE TABLE COTACAO_PEDIDO_DETALHE (
  ID INTEGER  NOT NULL  ,
  ID_COTACAO_COMPRA_DETALHE INTEGER  NOT NULL  ,
  ID_PEDIDO_COMPRA_DETALHE INTEGER  NOT NULL  ,
  QUANTIDADE_PEDIDA DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_PEDIDO_COMPRA_DETALHE)
    REFERENCES PEDIDO_COMPRA_DETALHE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_COTACAO_COMPRA_DETALHE)
    REFERENCES COTACAO_COMPRA_DETALHE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_PEDIDO_COT_DET ON COTACAO_PEDIDO_DETALHE (ID_PEDIDO_COMPRA_DETALHE);
CREATE INDEX FK_COT_PEDIDO_DET ON COTACAO_PEDIDO_DETALHE (ID_COTACAO_COMPRA_DETALHE);



-- ------------------------------------------------------------
-- Armazena os itens da venda.
-- ------------------------------------------------------------

CREATE TABLE VENDA_DETALHE (
  ID INTEGER  NOT NULL  ,
  ID_PRODUTO INTEGER  NOT NULL  ,
  ID_VENDA_CABECALHO INTEGER  NOT NULL  ,
  QUANTIDADE DECIMAL(18,6)    ,
  VALOR_UNITARIO DECIMAL(18,6)    ,
  VALOR_SUBTOTAL DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  VALOR_DESCONTO DECIMAL(18,6)    ,
  VALOR_TOTAL DECIMAL(18,6)    ,
  TAXA_COMISSAO DECIMAL(18,6)    ,
  VALOR_COMISSAO DECIMAL(18,6)    ,
  BASE_CALCULO_ICMS_ST DECIMAL(18,6)    ,
  VALOR_ICMS_ST DECIMAL(18,6)    ,
  ALIQUOTA_IPI DECIMAL(18,6)    ,
  VALOR_IPI DECIMAL(18,6)    ,
  CMV_APURADO DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_VENDA_CABECALHO)
    REFERENCES VENDA_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PRODUTO)
    REFERENCES PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_VENDA_CAB_DET ON VENDA_DETALHE (ID_VENDA_CABECALHO);
CREATE INDEX VENDA_DETALHE_FKIndex3 ON VENDA_DETALHE (ID_PRODUTO);




-- ------------------------------------------------------------
-- Esta tabela deve armazenar as comissões calculadas em cada venda. Desta forma toda vez que houver uma venda com indicaçao de comissao este valor será lançado nesta tabela, com indicaçao do VALOR_VENDA, VALOR_COMISSAO, TIPO (liquidez ou faturamento), e indicador se o lançamento é a debito ou a credito, pois se houver uma devoluaçao desta venda deve haver o debito (estorno da comissao) mediante um lançamento de saldo DEVEDOR para aquele vendedor.
-- ------------------------------------------------------------

CREATE TABLE VENDA_COMISSAO (
  ID INTEGER  NOT NULL  ,
  VENDEDOR_ID INTEGER  NOT NULL  ,
  ID_VENDA_CABECALHO INTEGER  NOT NULL  ,
  VALOR_VENDA DECIMAL(18,6)    ,
  TIPO_COMISSAO INTEGER    ,
  TIPO_CONTABIL CHAR(1)    ,
  VALOR_COMISSAO DECIMAL(18,6)    ,
  LANCADO CHAR(1)    ,
  DATA_LANCAMENTO DATE      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_VENDA_CABECALHO)
    REFERENCES VENDA_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(VENDEDOR_ID)
    REFERENCES VENDEDOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX VENDA_COMISSAO_FKIndex1 ON VENDA_COMISSAO (ID_VENDA_CABECALHO);
CREATE INDEX VENDA_COMISSAO_FKIndex2 ON VENDA_COMISSAO (VENDEDOR_ID);






-- ------------------------------------------------------------
-- Armazena os itens do orçamento de venda
-- ------------------------------------------------------------

CREATE TABLE ORCAMENTO_PEDIDO_VENDA_DET (
  ID INTEGER  NOT NULL  ,
  ID_PRODUTO INTEGER  NOT NULL  ,
  ID_ORCAMENTO_VENDA_CABECALHO INTEGER  NOT NULL  ,
  QUANTIDADE DECIMAL(18,6)    ,
  VALOR_UNITARIO DECIMAL(18,6)    ,
  VALOR_SUBTOTAL DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  VALOR_DESCONTO DECIMAL(18,6)    ,
  VALOR_TOTAL DECIMAL(18,6)    ,
  VALOR_IPI DECIMAL(18,6)    ,
  VALOR_ICMS_ST DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_ORCAMENTO_VENDA_CABECALHO)
    REFERENCES ORCAMENTO_PEDIDO_VENDA_CAB(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PRODUTO)
    REFERENCES PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_ORCAM_VENDA_CAB_DET ON ORCAMENTO_PEDIDO_VENDA_DET (ID_ORCAMENTO_VENDA_CABECALHO);
CREATE INDEX ORCA_PEDIDO_VENDA_DET_FK3 ON ORCAMENTO_PEDIDO_VENDA_DET (ID_PRODUTO);



-- ------------------------------------------------------------
-- Armazena os dados de frete da venda
-- ------------------------------------------------------------

CREATE TABLE FRETE_VENDA (
  ID INTEGER  NOT NULL  ,
  ID_TRANSPORTADORA INTEGER  NOT NULL  ,
  ID_VENDA_CABECALHO INTEGER  NOT NULL  ,
  CONHECIMENTO INTEGER    ,
  RESPONSAVEL CHAR(1)    ,
  PLACA VARCHAR(7)    ,
  UF_PLACA CHAR(2)    ,
  SELO_FISCAL INTEGER    ,
  QUANTIDADE_VOLUME DECIMAL(18,6)    ,
  MARCA_VOLUME VARCHAR(50)    ,
  ESPECIE_VOLUME VARCHAR(20)    ,
  PESO_BRUTO DECIMAL(18,6)    ,
  PESO_LIQUIDO DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_VENDA_CABECALHO)
    REFERENCES VENDA_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TRANSPORTADORA)
    REFERENCES TRANSPORTADORA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_VENDA_CABECALHO_FRETE ON FRETE_VENDA (ID_VENDA_CABECALHO);
CREATE INDEX FRETE_VENDA_FKIndex3 ON FRETE_VENDA (ID_TRANSPORTADORA);







-- ------------------------------------------------------------
-- Tabela de lançamentos das contas a receber.
-- ------------------------------------------------------------

CREATE TABLE LANCAMENTO_RECEBER (
  ID INTEGER  NOT NULL  ,
  ID_VENDEDOR INTEGER  NOT NULL  ,
  PESSOA_ID INTEGER  NOT NULL  ,
  ID_VENDA_CABECALHO INTEGER  NOT NULL  ,
  QUANTIDADE_PARCELA INTEGER    ,
  DATA_LANCAMENTO DATE    ,
  VALOR_TOTAL DECIMAL(18,6)    ,
  VALOR_A_RECEBER DECIMAL(18,6)    ,
  PRIMEIRO_VENCIMENTO DATE    ,
  VALOR_COMISSAO DECIMAL(18,6)    ,
  PORCENTO_COMISSAO DECIMAL(18,6)      ,
PRIMARY KEY(ID)      ,
  FOREIGN KEY(ID_VENDA_CABECALHO)
    REFERENCES VENDA_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(PESSOA_ID)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_VENDEDOR)
    REFERENCES VENDEDOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX LANCAMENTO_RECEBER_FK ON LANCAMENTO_RECEBER (ID_VENDA_CABECALHO);
CREATE INDEX LANCAMENTO_RECEBER_F ON LANCAMENTO_RECEBER (PESSOA_ID);
CREATE INDEX LANCAMENTO_RECEBER_F3 ON LANCAMENTO_RECEBER (ID_VENDEDOR);





-- ------------------------------------------------------------
-- Tabela que garda as parcelas para recebimento. Caso o recebimento seja efetuado de uma vez, a tabela LANCAMENTO_RECEBER gerará uma parcela para ser recebida e a mesma será armazenada nesta tabela.
-- ------------------------------------------------------------

CREATE TABLE PARCELA_RECEBER (
  ID INTEGER  NOT NULL  ,
  ID_AGENCIA_BANCO INTEGER  NOT NULL  ,
  ID_STATUS_PARCELA INTEGER  NOT NULL  ,
  ID_LANCAMENTO_RECEBER INTEGER  NOT NULL  ,
  NUMERO_PARCELA INTEGER    ,
  DATA_EMISSAO DATE    ,
  DATA_VENCIMENTO DATE    ,
  DESCONTO_ATE DATE    ,
  VALOR DECIMAL(18,6)    ,
  TAXA_JURO DECIMAL(18,6)    ,
  TAXA_MULTA DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  VALOR_JURO DECIMAL(18,6)    ,
  VALOR_MULTA DECIMAL(18,6)    ,
  VALOR_DESCONTO DECIMAL(18,6)    ,
  NR_CHEQUE VARCHAR(20)    ,
  NR_CONTA VARCHAR(20)    ,
  CM7 VARCHAR(50)      ,
PRIMARY KEY(ID)      ,
  FOREIGN KEY(ID_LANCAMENTO_RECEBER)
    REFERENCES LANCAMENTO_RECEBER(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_STATUS_PARCELA)
    REFERENCES STATUS_PARCELA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_AGENCIA_BANCO)
    REFERENCES AGENCIA_BANCO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_LANCAMENTO_PARCELA_FK1 ON PARCELA_RECEBER (ID_LANCAMENTO_RECEBER);
CREATE INDEX PARCELA_RECEBER_FKIndex2 ON PARCELA_RECEBER (ID_STATUS_PARCELA);
CREATE INDEX PARCELA_RECEBER_FKIndex3 ON PARCELA_RECEBER (ID_AGENCIA_BANCO);







-- ------------------------------------------------------------
-- Tabela que controla o recebimento de pagamentos das parcelas. Não se aproveita a tabela PARCELA_PAGAR porque podem existir pagamentos parciais de parcela, neste caso o controle deve 
-- ser feito em tabelas separadas. No caso de uma parcela que é paga de forma integral, a mesma será replicada da tabela PARCELA_PAGAR para a tabela PARCELA_PAGAMENTO e os dados 
-- dos campos adicionais serão informados.
-- ------------------------------------------------------------

CREATE TABLE PARCELA_PAGAMENTO (
  ID INTEGER  NOT NULL  ,
  ID_CONTA_CAIXA INTEGER  NOT NULL  ,
  ID_TIPO_PAGAMENTO INTEGER  NOT NULL  ,
  ID_CHEQUE_EMITIDO INTEGER    ,
  ID_PARCELA INTEGER  NOT NULL  ,
  DATA_PAGAMENTO DATE    ,
  TAXA_JURO DECIMAL(18,6)    ,
  TAXA_MULTA DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  VALOR_JURO DECIMAL(18,6)    ,
  VALOR_MULTA DECIMAL(18,6)    ,
  VALOR_DESCONTO DECIMAL(18,6)    ,
  VALOR_PAGO DECIMAL(18,6)    ,
  HISTORICO TEXT      ,
PRIMARY KEY(ID)        ,
  FOREIGN KEY(ID_PARCELA)
    REFERENCES PARCELA_PAGAR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CHEQUE_EMITIDO)
    REFERENCES CHEQUE_EMITIDO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TIPO_PAGAMENTO)
    REFERENCES TIPO_PAGAMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTA_CAIXA)
    REFERENCES CONTA_CAIXA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_PARCELA_PAGAMENTO ON PARCELA_PAGAMENTO (ID_PARCELA);
CREATE INDEX FK_CHEQUE_PARCELA ON PARCELA_PAGAMENTO (ID_CHEQUE_EMITIDO);
CREATE INDEX FK_TIPO_PAGAMENTO_PARCELA ON PARCELA_PAGAMENTO (ID_TIPO_PAGAMENTO);
CREATE INDEX PARCELA_PAGAMENTO_FKIndex4 ON PARCELA_PAGAMENTO (ID_CONTA_CAIXA);




-- ------------------------------------------------------------
-- Tabela que armazena o cabeçalho das vendas do sistema.
-- ------------------------------------------------------------

CREATE TABLE NFE_CABECALHO (
  ID INTEGER  NOT NULL  ,
  VENDA_CABECALHO_ID INTEGER    ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  ID_FORNECEDOR INTEGER  NOT NULL  ,
  ID_CLIENTE INTEGER  NOT NULL  ,
  CODIGO_NUMERICO VARCHAR(8)    ,
  NATUREZA_OPERACAO VARCHAR(60)    ,
  INDICADOR_FORMA_PAGAMENTO CHAR(1)    ,
  CODIGO_MODELO CHAR(2)    ,
  SERIE CHAR(3)    ,
  NUMERO VARCHAR(9)    ,
  DATA_EMISSAO DATE    ,
  DATA_ENTRADA_SAIDA DATE    ,
  HORA_ENTRADA_SAIDA VARCHAR(8)    ,
  TIPO_OPERACAO CHAR(1)    ,
  CODIGO_MUNICIPIO INTEGER    ,
  FORMATO_IMPRESSAO_DANFE CHAR(1)    ,
  TIPO_EMISSAO CHAR(1)    ,
  CHAVE_ACESSO VARCHAR(44)    ,
  DIGITO_CHAVE_ACESSO CHAR(1)    ,
  AMBIENTE CHAR(1)    ,
  FINALIDADE_EMISSAO CHAR(1)    ,
  PROCESSO_EMISSAO CHAR(1)    ,
  VERSAO_PROCESSO_EMISSAO INTEGER    ,
  BASE_CALCULO_ICMS DECIMAL(18,6)    ,
  VALOR_ICMS DECIMAL(18,6)    ,
  BASE_CALCULO_ICMS_ST DECIMAL(18,6)    ,
  VALOR_ICMS_ST DECIMAL(18,6)    ,
  VALOR_TOTAL_PRODUTOS DECIMAL(18,6)    ,
  VALOR_FRETE DECIMAL(18,6)    ,
  VALOR_SEGURO DECIMAL(18,6)    ,
  VALOR_DESCONTO DECIMAL(18,6)    ,
  VALOR_IMPOSTO_IMPORTACAO DECIMAL(18,6)    ,
  VALOR_IPI DECIMAL(18,6)    ,
  VALOR_PIS DECIMAL(18,6)    ,
  VALOR_COFINS DECIMAL(18,6)    ,
  VALOR_DESPESAS_ACESSORIAS DECIMAL(18,6)    ,
  VALOR_TOTAL DECIMAL(18,6)    ,
  VALOR_SERVICOS DECIMAL(18,6)    ,
  BASE_CALCULO_ISSQN DECIMAL(18,6)    ,
  VALOR_ISSQN DECIMAL(18,6)    ,
  VALOR_PIS_ISSQN DECIMAL(18,6)    ,
  VALOR_COFINS_ISSQN DECIMAL(18,6)    ,
  VALOR_RETIDO_PIS DECIMAL(18,6)    ,
  VALOR_RETIDO_COFINS DECIMAL(18,6)    ,
  VALOR_RETIDO_CSLL DECIMAL(18,6)    ,
  BASE_CALCULO_IRRF DECIMAL(18,6)    ,
  VALOR_RETIDO_IRRF DECIMAL(18,6)    ,
  BASE_CALCULO_PREVIDENCIA DECIMAL(18,6)    ,
  VALOR_RETIDO_PREVIDENCIA DECIMAL(18,6)    ,
  UF_EMBARQUE CHAR(2)    ,
  LOCAL_EMBARQUE VARCHAR(60)    ,
  NOTA_EMPENHO VARCHAR(17)    ,
  PEDIDO VARCHAR(60)    ,
  ISS_RETIDO CHAR(1)    ,
  INFORMACOES_ADD_FISCO TEXT    ,
  INFORMACOES_ADD_CONTRIBUINTE TEXT    ,
  INFORMACOES_COMPLEMENTARES TEXT    ,
  STATUS_NOTA CHAR(1)      ,
PRIMARY KEY(ID)        ,
  FOREIGN KEY(ID_CLIENTE)
    REFERENCES CLIENTE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_FORNECEDOR)
    REFERENCES FORNECEDOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(VENDA_CABECALHO_ID)
    REFERENCES VENDA_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX NFE_CABECALHO_FK1 ON NFE_CABECALHO (ID_CLIENTE);
CREATE INDEX NFE_CABECALHO_FK2 ON NFE_CABECALHO (ID_FORNECEDOR);
CREATE INDEX NFE_CABECALHO_FK3 ON NFE_CABECALHO (ID_EMPRESA);
CREATE INDEX NFE_CABECALHO_FK4 ON NFE_CABECALHO (VENDA_CABECALHO_ID);






















































-- ------------------------------------------------------------
-- Esta tabela ira armazenar o historico das compensacoes de titulos. Esta compensao ocorrerá quando houver titulos A PAGAR E RECEBER DA MESMA PESSOA. Ou houver devoluçao com lancamento de creditos.
-- ------------------------------------------------------------

CREATE TABLE COMPENSACAO_TITULO (
  ID INTEGER  NOT NULL  ,
  ID_LANCAMENTO_PAGAR INTEGER  NOT NULL  ,
  ID_NATUREZA_FINANCEIRA INTEGER  NOT NULL  ,
  ID_PESSOA INTEGER  NOT NULL  ,
  ID_LANCAMENTO_RECEBER INTEGER  NOT NULL  ,
  DESCRICAO VARCHAR(100)    ,
  DATA_INC DATE    ,
  TOTAL_CREDOR DECIMAL(18,6)    ,
  TOTAL_DEVEDOR DECIMAL(18,6)    ,
  SALDO DECIMAL(18,6)    ,
  TIPO_CONTABIL_SALDO CHAR(1)      ,
PRIMARY KEY(ID)        ,
  FOREIGN KEY(ID_LANCAMENTO_RECEBER)
    REFERENCES LANCAMENTO_RECEBER(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PESSOA)
    REFERENCES PESSOA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_NATUREZA_FINANCEIRA)
    REFERENCES NATUREZA_FINANCEIRA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_LANCAMENTO_PAGAR)
    REFERENCES LANCAMENTO_PAGAR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX COMPENSACAO_TITULO_F1 ON COMPENSACAO_TITULO (ID_LANCAMENTO_RECEBER);
CREATE INDEX COMPENSACAO_TITULO_FK2 ON COMPENSACAO_TITULO (ID_PESSOA);
CREATE INDEX COMPENSACAO_TITULO_FK3 ON COMPENSACAO_TITULO (ID_NATUREZA_FINANCEIRA);
CREATE INDEX COMPENSACAO_TITULO_F4 ON COMPENSACAO_TITULO (ID_LANCAMENTO_PAGAR);




CREATE TABLE COMPENSA_TITULO_DET (
  ID INTEGER  NOT NULL  ,
  ID_COMPENSACAO_TITULO INTEGER  NOT NULL  ,
  ID_TIPO_PAGAMENTO INTEGER  NOT NULL  ,
  ID_TIPO_RECEBIMENTO INTEGER  NOT NULL  ,
  ID_LANCAMENTO_PAGAR INTEGER  NOT NULL  ,
  ID_PARCELA_RECEBER INTEGER  NOT NULL  ,
  VALOR_DEBITO DECIMAL(18,6)    ,
  VALOR_CREDITO DECIMAL(18,6)      ,
PRIMARY KEY(ID)          ,
  FOREIGN KEY(ID_PARCELA_RECEBER)
    REFERENCES PARCELA_RECEBER(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_LANCAMENTO_PAGAR)
    REFERENCES LANCAMENTO_PAGAR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TIPO_RECEBIMENTO)
    REFERENCES TIPO_RECEBIMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TIPO_PAGAMENTO)
    REFERENCES TIPO_PAGAMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_COMPENSACAO_TITULO)
    REFERENCES COMPENSACAO_TITULO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX COMPENSA_TITULO_DET_Fx1 ON COMPENSA_TITULO_DET (ID_PARCELA_RECEBER);
CREATE INDEX COMPENSA_TITULO_DET_FKI ON COMPENSA_TITULO_DET (ID_LANCAMENTO_PAGAR);
CREATE INDEX COMPENSA_TITULO_DET_FK3 ON COMPENSA_TITULO_DET (ID_TIPO_RECEBIMENTO);
CREATE INDEX COMPENSA_TITULO_DET_FK4 ON COMPENSA_TITULO_DET (ID_TIPO_PAGAMENTO);
CREATE INDEX COMPENSA_TITULO_DET_FK5 ON COMPENSA_TITULO_DET (ID_COMPENSACAO_TITULO);



CREATE TABLE NFE_EMITENTE (
  ID INTEGER  NOT NULL  ,
  ID_NFE_CABECALHO INTEGER  NOT NULL  ,
  CPF_CNPJ VARCHAR(14)    ,
  RAZAO_SOCIAL VARCHAR(60)    ,
  FANTASIA VARCHAR(60)    ,
  LOGRADOURO VARCHAR(60)    ,
  NUMERO VARCHAR(60)    ,
  COMPLEMENTO VARCHAR(60)    ,
  BAIRRO VARCHAR(60)    ,
  CODIGO_MUNICIPIO INTEGER    ,
  NOME_MUNICIPIO VARCHAR(60)    ,
  UF CHAR(2)    ,
  CEP VARCHAR(8)    ,
  CODIGO_PAIS INTEGER    ,
  NOME_PAIS VARCHAR(60)    ,
  TELEFONE VARCHAR(14)    ,
  IE VARCHAR(14)    ,
  IEST VARCHAR(14)    ,
  IM VARCHAR(15)    ,
  CNAE VARCHAR(7)    ,
  CRT INTEGER      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_CABECALHO)
    REFERENCES NFE_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX NFE_EMITENTE_FKIndex1 ON NFE_EMITENTE (ID_NFE_CABECALHO);



















CREATE TABLE NFE_FATURA (
  ID INTEGER  NOT NULL  ,
  ID_NFE_CABECALHO INTEGER  NOT NULL  ,
  NUMERO VARCHAR(60)    ,
  VALOR_ORIGINAL DECIMAL(18,6)    ,
  VALOR_DESCONTO DECIMAL(18,6)    ,
  VALOR_LIQUIDO DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_CABECALHO)
    REFERENCES NFE_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX NFE_FATURA_FKIndex1 ON NFE_FATURA (ID_NFE_CABECALHO);







CREATE TABLE NFE_DUPLICATA (
  ID INTEGER  NOT NULL  ,
  ID_NFE_FATURA INTEGER  NOT NULL  ,
  NUMERO VARCHAR(60)    ,
  DATA_VENCIMENTO DATE    ,
  VALOR DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_FATURA)
    REFERENCES NFE_FATURA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_NFE_FATURA_DUPLICATA ON NFE_DUPLICATA (ID_NFE_FATURA);




CREATE TABLE NFE_REFERENCIADA (
  ID INTEGER  NOT NULL  ,
  ID_NFE_CABECALHO INTEGER  NOT NULL  ,
  CHAVE_ACESSO VARCHAR(44)    ,
  CODIGO_UF INTEGER    ,
  ANO_MES VARCHAR(4)    ,
  CNPJ VARCHAR(14)    ,
  MODELO INTEGER    ,
  SERIE INTEGER    ,
  NUMERO_NF INTEGER      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_CABECALHO)
    REFERENCES NFE_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_NFE_REFERENCIADA ON NFE_REFERENCIADA (ID_NFE_CABECALHO);



CREATE TABLE NFE_LOCAL_ENTREGA (
  ID INTEGER  NOT NULL  ,
  ID_NFE_CABECALHO INTEGER  NOT NULL  ,
  CPF_CNPJ VARCHAR(14)    ,
  LOGRADOURO VARCHAR(60)    ,
  NUMERO VARCHAR(60)    ,
  COMPLEMENTO VARCHAR(60)    ,
  BAIRRO VARCHAR(60)    ,
  CODIGO_MUNICIPIO INTEGER    ,
  NOME_MUNICIPIO VARCHAR(60)    ,
  UF CHAR(2)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_CABECALHO)
    REFERENCES NFE_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX NFE_LOCAL_ENTREGA_FKIndex1 ON NFE_LOCAL_ENTREGA (ID_NFE_CABECALHO);









CREATE TABLE NFE_LOCAL_RETIRADA (
  ID INTEGER  NOT NULL  ,
  ID_NFE_CABECALHO INTEGER  NOT NULL  ,
  CPF_CNPJ VARCHAR(14)    ,
  LOGRADOURO VARCHAR(60)    ,
  NUMERO VARCHAR(60)    ,
  COMPLEMENTO VARCHAR(60)    ,
  BAIRRO VARCHAR(60)    ,
  CODIGO_MUNICIPIO INTEGER    ,
  NOME_MUNICIPIO VARCHAR(60)    ,
  UF CHAR(2)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_CABECALHO)
    REFERENCES NFE_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX NFE_LOCAL_RETIRADA_FK1 ON NFE_LOCAL_RETIRADA (ID_NFE_CABECALHO);









CREATE TABLE NFE_CANA (
  ID INTEGER  NOT NULL  ,
  ID_NFE_CABECALHO INTEGER  NOT NULL  ,
  SAFRA VARCHAR(9)    ,
  MES_ANO_REFERENCIA VARCHAR(9)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_CABECALHO)
    REFERENCES NFE_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX NFE_CANA_FKIndex1 ON NFE_CANA (ID_NFE_CABECALHO);




CREATE TABLE NFE_CANA_FORNECIMENTO_DIARIO (
  ID INTEGER  NOT NULL  ,
  ID_NFE_CANA INTEGER  NOT NULL  ,
  DIA CHAR(2)    ,
  QUANTIDADE DECIMAL(18,6)    ,
  QUANTIDADE_TOTAL_MES DECIMAL(18,6)    ,
  QUANTIDADE_TOTAL_ANTERIOR DECIMAL(18,6)    ,
  QUANTIDADE_TOTAL_GERAL DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_CANA)
    REFERENCES NFE_CANA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_NFE_CANA_FORNECIMENTO ON NFE_CANA_FORNECIMENTO_DIARIO (ID_NFE_CANA);



CREATE TABLE NFE_DESTINATARIO (
  ID INTEGER  NOT NULL  ,
  ID_NFE_CABECALHO INTEGER  NOT NULL  ,
  CPF_CNPJ VARCHAR(14)    ,
  RAZAO_SOCIAL VARCHAR(60)    ,
  FANTASIA VARCHAR(60)    ,
  LOGRADOURO VARCHAR(60)    ,
  NUMERO VARCHAR(60)    ,
  COMPLEMENTO VARCHAR(60)    ,
  BAIRRO VARCHAR(60)    ,
  CODIGO_MUNICIPIO INTEGER    ,
  NOME_MUNICIPIO VARCHAR(60)    ,
  UF CHAR(2)    ,
  CEP VARCHAR(8)    ,
  CODIGO_PAIS INTEGER    ,
  NOME_PAIS VARCHAR(60)    ,
  TELEFONE VARCHAR(14)    ,
  IE VARCHAR(14)    ,
  IEST VARCHAR(14)    ,
  IM VARCHAR(15)    ,
  CNAE VARCHAR(7)    ,
  CRT INTEGER    ,
  SUFRAMA VARCHAR(9)    ,
  EMAIL VARCHAR(60)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_CABECALHO)
    REFERENCES NFE_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX NFE_DESTINATARIO_FKIndex1 ON NFE_DESTINATARIO (ID_NFE_CABECALHO);





















CREATE TABLE NFE_DEDUCOES_SAFRA (
  ID INTEGER  NOT NULL  ,
  ID_NFE_CANA INTEGER  NOT NULL  ,
  DECRICAO VARCHAR(60)    ,
  VALOR_DEDUCAO DECIMAL(18,6)    ,
  VALOR_FORNECIMENTO DECIMAL(18,6)    ,
  VALOR_TOTAL_DEDUCAO DECIMAL(18,6)    ,
  VALOR_LIQUIDO_FORNECIMENTO DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_CANA)
    REFERENCES NFE_CANA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_NFE_CANA_DEDUCOES ON NFE_DEDUCOES_SAFRA (ID_NFE_CANA);



CREATE TABLE NFE_CUPOM_FISCAL (
  ID INTEGER  NOT NULL  ,
  ID_NFE_CABECALHO INTEGER  NOT NULL  ,
  MODELO_DOCUMENTO_FISCAL CHAR(2)    ,
  DATA_EMISSAO_CUPOM DATE    ,
  NUMERO_ORDEM_ECF INTEGER    ,
  COO INTEGER    ,
  NUMERO_CAIXA INTEGER    ,
  NUMERO_SERIE_ECF VARCHAR(20)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_CABECALHO)
    REFERENCES NFE_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_NFE_CUPOM_FISCAL ON NFE_CUPOM_FISCAL (ID_NFE_CABECALHO);







-- ------------------------------------------------------------
-- Tabela que controla o recebimento de pagamentos das parcelas.
-- ------------------------------------------------------------

CREATE TABLE PARCELA_RECEBIMENTO (
  ID INTEGER  NOT NULL  ,
  ID_TIPO_RECEBIMENTO INTEGER  NOT NULL  ,
  ID_PARCELA INTEGER  NOT NULL  ,
  DATA_RECEBIMENTO DATE    ,
  TAXA_JURO DECIMAL(18,6)    ,
  TAXA_MULTA DECIMAL(18,6)    ,
  TAXA_DESCONTO DECIMAL(18,6)    ,
  VALOR_JURO DECIMAL(18,6)    ,
  VALOR_MULTA DECIMAL(18,6)    ,
  VALOR_DESCONTO DECIMAL(18,6)    ,
  VALOR_PAGO DECIMAL(18,6)    ,
  HISTORICO TEXT      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_PARCELA)
    REFERENCES PARCELA_RECEBER(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TIPO_RECEBIMENTO)
    REFERENCES TIPO_RECEBIMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_PARCELA_RECEB ON PARCELA_RECEBIMENTO (ID_PARCELA);
CREATE INDEX PARCELA_RECEBIMENTO_F ON PARCELA_RECEBIMENTO (ID_TIPO_RECEBIMENTO);




CREATE TABLE RECEBIMENTO_LANCA_CONTABIL (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_LANCAMENTO_DET INTEGER  NOT NULL  ,
  ID_PARCELA_RECEBIMENTO INTEGER  NOT NULL  ,
  DATA_INC DATE      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_PARCELA_RECEBIMENTO)
    REFERENCES PARCELA_RECEBIMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_LANCAMENTO_DET)
    REFERENCES CONTABIL_LANCAMENTO_DET(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX RECEBIMENTO_LANCA_CONTABIL ON RECEBIMENTO_LANCA_CONTABIL (ID_PARCELA_RECEBIMENTO);
CREATE INDEX RECEBIMENTO_LANCA_CONTABIL_F ON RECEBIMENTO_LANCA_CONTABIL (ID_CONTABIL_LANCAMENTO_DET);



CREATE TABLE BORDERO_DETALHE (
  ID INTEGER  NOT NULL  ,
  ID_PARCELA_RECEBER INTEGER  NOT NULL  ,
  ID_BORDERO INTEGER  NOT NULL  ,
  PRAZO INTEGER    ,
  TAXA_JUROS DECIMAL(18,6)    ,
  VALOR_JUROS DECIMAL(18,6)    ,
  VALOR_LIQUIDO DECIMAL(18,6)    ,
  VENCIMENTO DATE      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_BORDERO)
    REFERENCES BORDERO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PARCELA_RECEBER)
    REFERENCES PARCELA_RECEBER(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX BORDERO_DETALHE_F ON BORDERO_DETALHE (ID_BORDERO);
CREATE INDEX BORDERO_DETALHE ON BORDERO_DETALHE (ID_PARCELA_RECEBER);



CREATE TABLE COMISSAO_RECEBIMENTO (
  ID INTEGER  NOT NULL  ,
  ID_VENDEDOR INTEGER  NOT NULL  ,
  ID_PARCELA_RECEBIMENTO INTEGER  NOT NULL  ,
  VALOR_RECEBIDO DECIMAL(18,6)    ,
  PORCENTO_COMISSAO DECIMAL(18,6)    ,
  TIPO_CONTABIL CHAR(1)    ,
  VALOR_COMISSAO DECIMAL(18,6)    ,
  LANCADO CHAR(1)    ,
  DATA_LANCAMENTO DATE      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_PARCELA_RECEBIMENTO)
    REFERENCES PARCELA_RECEBIMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_VENDEDOR)
    REFERENCES VENDEDOR(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX COMISSAO_RECEBIMENTO_FK1 ON COMISSAO_RECEBIMENTO (ID_PARCELA_RECEBIMENTO);
CREATE INDEX COMISSAO_RECEBIMENTO_FKI2 ON COMISSAO_RECEBIMENTO (ID_VENDEDOR);





CREATE TABLE TRANSF_TITULO_DET (
  ID INTEGER  NOT NULL  ,
  ID_TRANSFERENCIA_TITULO INTEGER  NOT NULL  ,
  ID_PARCELA_RECEBER INTEGER  NOT NULL  ,
  VALOR DECIMAL(18,6)    ,
  VALOR_JUROS DECIMAL(18,6)    ,
  TAXA_JUROS DECIMAL(18,6)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_PARCELA_RECEBER)
    REFERENCES PARCELA_RECEBER(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TRANSFERENCIA_TITULO)
    REFERENCES TRANSFERENCIA_TITULO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX TRANSF_TITULO_DET_FKIndex1 ON TRANSF_TITULO_DET (ID_PARCELA_RECEBER);
CREATE INDEX TRANSF_TITULO_DET_FKIndex2 ON TRANSF_TITULO_DET (ID_TRANSFERENCIA_TITULO);



CREATE TABLE PAGAMENTO_LANC_CONTABIL (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_LANCAMENTO_DET INTEGER  NOT NULL  ,
  ID_PARCELA_PAGAMENTO INTEGER  NOT NULL  ,
  DATA_INC DATE      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_PARCELA_PAGAMENTO)
    REFERENCES PARCELA_PAGAMENTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_LANCAMENTO_DET)
    REFERENCES CONTABIL_LANCAMENTO_DET(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX PAGAMENTO_LANC_CONTABIL ON PAGAMENTO_LANC_CONTABIL (ID_PARCELA_PAGAMENTO);
CREATE INDEX PAGAMENTO_LANC_CONTABIL_F ON PAGAMENTO_LANC_CONTABIL (ID_CONTABIL_LANCAMENTO_DET);



CREATE TABLE NFE_TRANSPORTE (
  ID INTEGER  NOT NULL  ,
  ID_TRANSPORTADORA INTEGER  NOT NULL  ,
  ID_NFE_CABECALHO INTEGER  NOT NULL  ,
  MODALIDADE_FRETE CHAR(1)    ,
  CPF_CNPJ VARCHAR(14)    ,
  NOME VARCHAR(60)    ,
  INSCRICAO_ESTADUAL VARCHAR(14)    ,
  ENDERECO VARCHAR(60)    ,
  NOME_MUNICIPIO VARCHAR(60)    ,
  UF CHAR(2)    ,
  VALOR_SERVICO DECIMAL(18,6)    ,
  BASE_CALCULO_RETENCAO_ICMS DECIMAL(18,6)    ,
  ALIQUOTA_RETENCAO_ICMS DECIMAL(18,6)    ,
  VALOR_ICMS_RETIDO DECIMAL(18,6)    ,
  CFOP INTEGER    ,
  MUNICIPIO INTEGER    ,
  PLACA_VEICULO VARCHAR(8)    ,
  UF_VEICULO CHAR(2)    ,
  RNTC_VEICULO VARCHAR(20)    ,
  PLACA_REBOQUE VARCHAR(8)    ,
  UF_REBOQUE CHAR(2)    ,
  RNTC_REBOQUE VARCHAR(20)    ,
  VAGAO_REBOQUE VARCHAR(20)    ,
  BALSA_REBOQUE VARCHAR(20)    ,
  QTDE_VOL_TRANSPORTADOS DECIMAL(18,6)    ,
  ESPECIE_VOL_TRANSPORTADOS VARCHAR(60)    ,
  MARCA_VOL_TRANSPORTADOS VARCHAR(60)    ,
  NUMERACAO_VOL_TRANSPORTADOS VARCHAR(60)    ,
  PESO_LIQUIDO DECIMAL(18,6)    ,
  PESO_BRUTO DECIMAL(18,6)    ,
  NUMERO_LACRES VARCHAR(60)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_NFE_CABECALHO)
    REFERENCES NFE_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_TRANSPORTADORA)
    REFERENCES TRANSPORTADORA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX NFE_TRANSPORTE_FKIndex1 ON NFE_TRANSPORTE (ID_NFE_CABECALHO);
CREATE INDEX NFE_TRANSPORTE_FKIndex2 ON NFE_TRANSPORTE (ID_TRANSPORTADORA);







-- ------------------------------------------------------------
-- Armazena os tipos de NF. Define alguns parâmetros para emissão de notas fiscais.
-- 
-- Modelos padrões já cadastrados pelo sistema:
-- 
-- Nota Fiscal, modelos 1 e 1A;
-- Nota Fiscal de Venda a Consumidor, Modelo 2;
-- NF-e (Nota Fiscal Eletrônica), modelo 55
-- ------------------------------------------------------------

CREATE TABLE VENDA_NFE (
  ID INTEGER  NOT NULL  ,
  ID_EMPRESA INTEGER  NOT NULL  ,
  ID_VENDA_CABECALHO INTEGER  NOT NULL  ,
  NFE_CABECALHO_ID INTEGER  NOT NULL  ,
  MODELO CHAR(2)    ,
  SERIE CHAR(2)    ,
  DATA_FATURAMENTO DATE    ,
  NUMERO_NFE INTEGER    ,
  TEMPLATE TEXT    ,
  NUMERO_ITENS INTEGER    ,
  ULTIMO_IMPRESSO INTEGER      ,
PRIMARY KEY(ID)      ,
  FOREIGN KEY(ID_EMPRESA)
    REFERENCES EMPRESA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(NFE_CABECALHO_ID)
    REFERENCES NFE_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_VENDA_CABECALHO)
    REFERENCES VENDA_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX TIPO_NOTA_FISCAL_FKIndex2 ON VENDA_NFE (ID_EMPRESA);
CREATE INDEX VENDA_NFE_FKIndex2 ON VENDA_NFE (NFE_CABECALHO_ID);
CREATE INDEX VENDA_NFE_FKIndex3 ON VENDA_NFE (ID_VENDA_CABECALHO);










CREATE TABLE LANC_RECEBER_NAT_FIN (
  ID INTEGER  NOT NULL  ,
  ID_CONTABIL_LANCAMENTO_DET INTEGER  NOT NULL  ,
  ID_NATUREZA_FINANCEIRA INTEGER  NOT NULL  ,
  ID_LANCAMENTO_RECEBER INTEGER  NOT NULL  ,
  DATA_INC DATE      ,
PRIMARY KEY(ID)      ,
  FOREIGN KEY(ID_LANCAMENTO_RECEBER)
    REFERENCES LANCAMENTO_RECEBER(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_NATUREZA_FINANCEIRA)
    REFERENCES NATUREZA_FINANCEIRA(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_CONTABIL_LANCAMENTO_DET)
    REFERENCES CONTABIL_LANCAMENTO_DET(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX LANC_RECEBER_NAT_FIN ON LANC_RECEBER_NAT_FIN (ID_LANCAMENTO_RECEBER);
CREATE INDEX LANC_RECEBER_NAT_FIN_F2 ON LANC_RECEBER_NAT_FIN (ID_NATUREZA_FINANCEIRA);
CREATE INDEX LANC_RECEBER_NAT_FIN_FK3 ON LANC_RECEBER_NAT_FIN (ID_CONTABIL_LANCAMENTO_DET);



-- ------------------------------------------------------------
-- Armazena os itens da venda.
-- ------------------------------------------------------------

CREATE TABLE NFE_DETALHE (
  ID INTEGER  NOT NULL  ,
  ID_PRODUTO INTEGER  NOT NULL  ,
  ID_LOTE_PRODUTO INTEGER    ,
  ID_NFE_CABECALHO INTEGER  NOT NULL  ,
  NUMERO_ITEM INTEGER    ,
  CODIGO_PRODUTO VARCHAR(60)    ,
  GTIN VARCHAR(14)    ,
  NOME_PRODUTO VARCHAR(100)    ,
  NCM VARCHAR(8)    ,
  EX_TIPI INTEGER    ,
  CFOP INTEGER    ,
  UNIDADE_COMERCIAL VARCHAR(6)    ,
  QUANTIDADE_COMERCIAL DECIMAL(18,6)    ,
  VALOR_UNITARIO_COMERCIAL DECIMAL(18,6)    ,
  VALOR_BRUTO_PRODUTOS DECIMAL(18,6)    ,
  GTIN_UNIDADE_TRIBUTAVEL VARCHAR(14)    ,
  UNIDADE_TRIBUTAVEL VARCHAR(6)    ,
  QUANTIDADE_TRIBUTAVEL DECIMAL(18,6)    ,
  VALOR_UNITARIO_TRIBUTACAO DECIMAL(18,6)    ,
  VALOR_FRETE DECIMAL(18,6)    ,
  VALOR_SEGURO DECIMAL(18,6)    ,
  VALOR_DESCONTO DECIMAL(18,6)    ,
  VALOR_OUTRAS_DESPESAS DECIMAL(18,6)    ,
  ENTRA_TOTAL CHAR(1)    ,
  ORIGEM_MERCADORIA CHAR(1)    ,
  CST_ICMS CHAR(3)    ,
  CSOSN CHAR(4)    ,
  MODALIDADE_BC_ICMS CHAR(1)    ,
  TAXA_REDUCAO_BC_ICMS DECIMAL(18,6)    ,
  BASE_CALCULO_ICMS DECIMAL(18,6)    ,
  ALIQUOTA_ICMS DECIMAL(18,6)    ,
  VALOR_ICMS DECIMAL(18,6)    ,
  MOTIVO_DESONERACAO_ICMS CHAR(1)    ,
  MODALIDADE_BC_ICMS_ST CHAR(1)    ,
  PERCENTUAL_MVA_ICMS_ST DECIMAL(18,6)    ,
  REDUCAO_BC_ICMS_ST DECIMAL(18,6)    ,
  BASE_CALCULO_ICMS_ST DECIMAL(18,6)    ,
  ALIQUOTA_ICMS_ST DECIMAL(18,6)    ,
  VALOR_ICMS_ST DECIMAL(18,6)    ,
  VALOR_BC_ICMS_ST_RETIDO DECIMAL(18,6)    ,
  VALOR_ICMS_ST_RETIDO DECIMAL(18,6)    ,
  ALIQUOTA_CREDITO_ICMS_SN DECIMAL(18,6)    ,
  VALOR_CREDITO_ICMS_SN DECIMAL(18,6)    ,
  ENQUADRAMENTO_IPI VARCHAR(5)    ,
  CNPJ_PRODUTOR VARCHAR(14)    ,
  CODIGO_SELO_IPI VARCHAR(60)    ,
  QUANTIDADE_SELO_IPI INTEGER    ,
  ENQUADRAMENTO_LEGAL_IPI CHAR(3)    ,
  CST_IPI CHAR(2)    ,
  BASE_CALCULO_IPI DECIMAL(18,6)    ,
  ALIQUOTA_IPI DECIMAL(18,6)    ,
  VALOR_IPI DECIMAL(18,6)    ,
  VALOR_BC_II DECIMAL(18,6)    ,
  VALOR_DESPESAS_ADUANEIRAS DECIMAL(18,6)    ,
  VALOR_IMPOSTO_IMPORTACAO DECIMAL(18,6)    ,
  VALOR_IOF DECIMAL(18,6)    ,
  CST_PIS CHAR(2)    ,
  VALOR_BASE_CALCULO_PIS DECIMAL(18,6)    ,
  ALIQUOTA_PIS_PERCENTUAL DECIMAL(18,6)    ,
  ALIQUOTA_PIS_REAIS DECIMAL(18,6)    ,
  VALOR_PIS DECIMAL(18,6)    ,
  CST_COFINS CHAR(2)    ,
  BASE_CALCULO_COFINS DECIMAL(18,6)    ,
  ALIQUOTA_COFINS_PERCENTUAL DECIMAL(18,6)    ,
  ALIQUOTA_COFINS_REAIS DECIMAL(18,6)    ,
  VALOR_COFINS DECIMAL(18,6)    ,
  BASE_CALCULO_ISSQN DECIMAL(18,6)    ,
  ALIQUOTA_ISSQN DECIMAL(18,6)    ,
  VALOR_ISSQN DECIMAL(18,6)    ,
  MUNICIPIO_ISSQN INTEGER    ,
  ITEM_LISTA_SERVICOS INTEGER    ,
  TRIBUTACAO_ISSQN CHAR(1)    ,
  VALOR_SUBTOTAL DECIMAL(18,6)    ,
  VALOR_TOTAL DECIMAL(18,6)    ,
  INFORMACOES_ADICIONAIS TEXT      ,
PRIMARY KEY(ID)      ,
  FOREIGN KEY(ID_NFE_CABECALHO)
    REFERENCES NFE_CABECALHO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_LOTE_PRODUTO)
    REFERENCES LOTE_PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_PRODUTO)
    REFERENCES PRODUTO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_NFE_CAB_DET ON NFE_DETALHE (ID_NFE_CABECALHO);
CREATE INDEX FK_LOTE_PRODUTO_NFE_DET ON NFE_DETALHE (ID_LOTE_PRODUTO);
CREATE INDEX NFE_DETALHE_FKIndex4 ON NFE_DETALHE (ID_PRODUTO);




































































CREATE TABLE NFE_DET_ESPECIFICO_MEDICAMENTO (
  ID INTEGER  NOT NULL  ,
  ID_NFE_DETALHE INTEGER  NOT NULL  ,
  NUMERO_LOTE VARCHAR(20)    ,
  QUANTIDADE_LOTE DECIMAL(18,6)    ,
  DATA_FABRICACAO DATE    ,
  DATA_VALIDADE DATE    ,
  PRECO_MAX_CONSUMIDOR DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_DETALHE)
    REFERENCES NFE_DETALHE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX NFE_DET_ESPECIFICO_MEDICAMENTO ON NFE_DET_ESPECIFICO_MEDICAMENTO (ID_NFE_DETALHE);





CREATE TABLE NFE_DET_ESPECIFICO_VEICULO (
  ID INTEGER  NOT NULL  ,
  ID_NFE_DETALHE INTEGER  NOT NULL  ,
  TIPO_OPERACAO CHAR(1)    ,
  CHASSI VARCHAR(17)    ,
  COR VARCHAR(4)    ,
  DESCRICAO_COR VARCHAR(40)    ,
  POTENCIA_MOTOR VARCHAR(4)    ,
  CILINDRADAS VARCHAR(4)    ,
  PESO_LIQUIDO DECIMAL(18,6)    ,
  PESO_BRUTO DECIMAL(18,6)    ,
  SERIAL VARCHAR(9)    ,
  TIPO_COMBUSTIVEL CHAR(2)    ,
  NUMERO_MOTOR VARCHAR(21)    ,
  DISTANCIA_EIXOS DECIMAL(18,6)    ,
  ANO_MODELO CHAR(4)    ,
  ANO_FABRICACAO CHAR(4)    ,
  TIPO_PINTURA CHAR(1)    ,
  TIPO_VEICULO CHAR(2)    ,
  ESPECIE_VEICULO CHAR(1)    ,
  CONDICAO_VIN CHAR(1)    ,
  CONDICAO_VEICULO CHAR(1)    ,
  CODIGO_MARCA_MODELO VARCHAR(6)    ,
  CODIGO_COR CHAR(2)    ,
  LOTACAO INTEGER    ,
  RESTRICAO CHAR(1)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_DETALHE)
    REFERENCES NFE_DETALHE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX NFE_DET_ESPECIFICO_VEICULO_FK1 ON NFE_DET_ESPECIFICO_VEICULO (ID_NFE_DETALHE);



















CREATE TABLE NFE_DET_ESPECIFICO_COMBUSTIVEL (
  ID INTEGER  NOT NULL  ,
  ID_NFE_DETALHE INTEGER  NOT NULL  ,
  CODIGO_ANP INTEGER    ,
  CODIF VARCHAR(21)    ,
  QUANTIDADE_TEMP_AMBIENTE DECIMAL(18,6)    ,
  UF_CONSUMO CHAR(2)    ,
  BASE_CALCULO_CIDE DECIMAL(18,6)    ,
  ALIQUOTA_CIDE DECIMAL(18,6)    ,
  VALOR_CIDE DECIMAL(18,6)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_DETALHE)
    REFERENCES NFE_DETALHE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX NFE_DET_ESPECIF_COMBUSTIVEL ON NFE_DET_ESPECIFICO_COMBUSTIVEL (ID_NFE_DETALHE);










CREATE TABLE NFE_DET_ESPECIFICO_ARMAMENTO (
  ID INTEGER  NOT NULL  ,
  ID_NFE_DETALHE INTEGER  NOT NULL  ,
  TIPO_ARMA CHAR(1)    ,
  NUMERO_SERIE_ARMA INTEGER    ,
  NUMERO_SERIE_CANO INTEGER    ,
  DESCRICAO VARCHAR(255)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_DETALHE)
    REFERENCES NFE_DETALHE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX NFE_DET_ESPECIFICO_ARMAMENTO ON NFE_DET_ESPECIFICO_ARMAMENTO (ID_NFE_DETALHE);







CREATE TABLE NFE_DECLARACAO_IMPORTACAO (
  ID INTEGER  NOT NULL  ,
  ID_NFE_DETALHE INTEGER  NOT NULL  ,
  NUMERO_DI_DSI_DA VARCHAR(10)    ,
  DATA_REGISTRO DATE    ,
  LOCAL_DESEMBARACO VARCHAR(60)    ,
  UF_DESEMBARACO CHAR(2)    ,
  DATA_DESEMBARACO DATE    ,
  CODIGO_EXPORTADOR VARCHAR(60)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_DETALHE)
    REFERENCES NFE_DETALHE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX NFE_DETALHE_DEC_IMPORTACAO ON NFE_DECLARACAO_IMPORTACAO (ID_NFE_DETALHE);



CREATE TABLE NFE_IMPORTACAO_DETALHE (
  ID INTEGER  NOT NULL  ,
  ID_NFE_DECLARACAO_IMPORTACAO INTEGER  NOT NULL  ,
  NUMERO_ADICAO INTEGER    ,
  NUMERO_SEQUENCIAL INTEGER    ,
  CODIGO_FABRICANTE_ESTRANGEIRO VARCHAR(60)    ,
  VALOR_DESCONTO DECIMAL(18,6)    ,
  NUMERO_PEDIDO_COMPRA VARCHAR(15)    ,
  ITEM_PEDIDO_COMPRA INTEGER      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ID_NFE_DECLARACAO_IMPORTACAO)
    REFERENCES NFE_DECLARACAO_IMPORTACAO(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX FK_NFE_IMPORTACAO_DETALHE ON NFE_IMPORTACAO_DETALHE (ID_NFE_DECLARACAO_IMPORTACAO);




