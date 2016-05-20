.. figure:: https://wiki.postgresql.org/images/a/a4/PostgreSQL_logo.3colors.svg
  :alt: PostgreSQL
  :width: 150px


Minha Caixa - PostgreSQL
========================

Banco de dados Minha Caixa para PostgreSQL.


Links
-----

- `Tarefas <https://tree.taiga.io/project/eduardoklosowski-bdaeng-postgresql-trabalho-1/taskboard/primeiro-2>`_


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
