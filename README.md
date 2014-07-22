Conversor de IDS para o SGC
====
* Pré-requisitos:

1. Banco de dados de destino criado, com todas tabelas, sem dados (usar `rake db:migrate`)
2. Configurar banco de dados em config/database.yml (Apenas para o banco do id_converter)
3. Configurar banco de dados em config/shards.yml (default, source, destiny)

***

Passo a passo:
---------------------
1. `cd pasta/do/id_converter && rake db:create`
2. `rails c`
3. `DatabaseUpdater.start` Vai criar as tabelas no banco do id_converter
4. `DatabaseUpdater.copy('facieg')` Copia os dados do banco source para destiny e salva os ids 
4. `DatabaseUpdater.copy_n_to_n` Copia os dados das tabelas N para N (não tem ID) 
