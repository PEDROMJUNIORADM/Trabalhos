.. figure:: https://wiki.postgresql.org/images/a/a4/PostgreSQL_logo.3colors.svg
  :alt: PostgreSQL
  :width: 150px


Minha Caixa - PostgreSQL
========================

.. image:: https://travis-ci.org/BDAENGUniville/Trabalhos.svg?branch=pg
  :alt: Status do Teste
  :target: https://travis-ci.org/BDAENGUniville/Trabalhos

Banco de dados Minha Caixa para PostgreSQL.


Links
-----

- `Tarefas <https://tree.taiga.io/project/eduardoklosowski-bdaeng-postgresql-trabalho-1/taskboard/primeiro-2>`_
- `Testes <https://travis-ci.org/BDAENGUniville/Trabalhos>`_


Como Resolver Tarefas
---------------------

- Atribuir a tarefa para o seu usuário e movê-la para "Em Andamento".
- Atualiza o repositório local::

    git checkout pg
    git pull

- Criar uma branch para a tarefa (``pg-<numero>``, exemplo: ``pg-21``)::

    git checkout -b pg-21

- Fazer as alterações e nomear os commits com o código da tarefa (``PG-<numero> - <Descrição>``, exemplo: ``PG-21 - Criado tabela cliente``).
- Enviar as alterações para o servidor::

    git push origin pg-21

- Criar um pull-request da sua branch para a branch ``pg``, seguindo o mesmo padrão do nome dos commits.
- Mover a tarefa para "Pronto Para Teste".


Estilo de Código
----------------


Arquivo
~~~~~~~

- Utilizar codificação UTF-8 (``charset = utf-8``).
- Utilizar quebra de linha estilo Unix (``end_of_line = lf``).
- O arquivo deve terminar com uma linha em branco (``insert_final_newline``).
- Utilizar espaços para fazer a identação (``indent_style = space``).
- Não colocar espaços no final das linhas e em linhas em branco (``trim_trailing_whitespace``).


SQL
~~~

- Comandos SQL devem estar em maiúsculo.
- Tipo de campo devem estar em minúsculo.
- Nome de tabelas e outros objetos devem estar em minúsculo, utilizando ``_`` quando necessário e sem ``"`` em volta.
- Todo comando deve terminar com ``;`` junto a última linha.

**Exemplo:**

.. code-block:: sql

  CREATE TABLE tabela (
    coluna integer,
    CONSTRAINT pk_coluna PRIMARY KEY (coluna)
  );

  SELECT
    coluna,
    outra_coluna
  FROM tabela
  WHERE
    outra_coluna IS NOT NULL;
