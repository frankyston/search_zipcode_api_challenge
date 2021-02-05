# Search Zipcode API

Este projeto é uma teste para a vaga da Latam Payments.

# Versions
Ruby 2.7.2
Rails 6.1.1
Postgresql 10 ou superior

# Setup

1. Clone essse projeto.
2. Tenha certeza que esteja usando o `ruby 2.7.2` e o `rails 6.1.1`, caso contrario instale na sua máquina.
3. Em `config/database.yml` você deve configurar seu usuário e senha do banco de dados.
4. Execute `rails db:setup` e assim será criado o banco de dados e suas migrações.
5. Execute `rails s` ou `rails server` para iniciar a API.

# Tests

Neste projeto existe os testes implementados para as necessidades dos requisitos. Para executar os teste digite `rspec` ou `rspec spec`.

# Endpoints da API

### Criar usuário
Para realizar as requisições do sistema é preciso ter um usuário.
Para criar basta faça como o exemplo abaixo:

```
Método HTTP: POST
Endpoint => localhost:3000/users
parametros => {"user"=> {"email"=>"email", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"} }
```

Ao criar um usuário a resposta será com `{'user' => 'email do usuário', 'token' => 'token do usuário'}`.

### Logar com seu usuário
Para logar no sistema faça como o exemplo abaixo:

```
Método HTTP: POST
Endpoint => localhost:3000/users/sign_in
parametros => {"user"=> {"email"=>"email", "password"=>"[FILTERED]"} }
```

Ao logar a resposta será com `{'user' => 'email do usuário', 'token' => 'token do usuário'}`.

### Endpoint de teste Fake
Para testar o endpoint de teste (fake) faça como o exemplo abaixo:

```
Método HTTP: GET
Endpoint => localhost:3000/api/test
parametros => nenhuma
Cabeçalho => { Authorization: token }
```

Ao realizar a requisição, poderá receber duas respostas:

1. Se não passar o token no cabeçalho receberá um 401 (não autorizado)
2. Se passar o cabeçalho, a resposta será um json `{'sample' => 'data'}`

### Consultar um CEP
Para testar o endpoint de consulta de cep você deve informar o token de autorização e um cep.

```
Método HTTP: GET
Endpoint => localhost:3000/api/cep
parametros => { "zipcode"=>"CEP" }
Cabeçalho => { Authorization: token }
```

Ao realizar a requisição, poderá recebe duas respostas:

1. Se não passar o token no cabeçalho receberá um 401 (não autorizado)
2. Se passar o cabeçalho, a resposta será um json:
```
{
  "cep": "CEE",
  "uf": "ESTADO",
  "cidade": "CIDADE",
  "bairro": "BAIRRO",
  "logradouro": "RUA"
}
```

Para testar de forma mais simples, segue dois arquivos para importar no Insominia ou no Postman. Basta importar e realizar os testes.

[Insominia](sample_requests_api/insomnia_search_zipcode.json)

[Postman](sample_requests_api/postman_search_zipcode.json)
