#language: pt

Funcionalidade: Login

Cenário: Login com sucesso
O aluno informa o RA e a senha e o sistema mostra uma mensagem de sucesso

Dado que eu acesse a página de login
E informe um RA e senha válidos
Quando eu clicar em fazer login
Então eu devo ver uma mensagem de sucesso

Cenário: RA inválido
O aluno informa o RA inválido e é notificado sobre o erro no login

Dado que eu acesse a página de login
E informa um RA inválido
Quando eu tentar fazer o login
Então eu devo ver uma mensagem de erro
