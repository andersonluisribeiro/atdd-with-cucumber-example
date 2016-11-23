Dado(/^que eu acesse a página de login$/) do
  visit "/sessions/new"
end

Dado(/^informe um RA e senha válidos$/) do
  fill_in "ra", with: "1"
  fill_in "password", with: "xx9"
end

Quando(/^eu clicar em fazer login$/) do
  stub_request(:get, "176.16.1.30:8080/academico/access_token").
  with(query: {ra: 1, senha: "xx9"}).
  to_return(body: '{ "ra": 1, "nome": "anderson", "token": "xxxx" }', status: 200)
  click_button "Login"
end

Então(/^eu devo ver uma mensagem de sucesso$/) do
  expect(page).to have_content("Login efetuado com sucesso!")
end

Dado(/^informa um RA inválido$/) do
  fill_in "ra", with: "3"
  fill_in "password", with: "xx9"
end

Quando(/^eu tentar fazer o login$/) do
  stub_request(:get, "176.16.1.30:8080/academico/access_token").
  with(query: {ra: 3, senha: "xx9"}).
  to_return(status: 403)
  click_button "Login"
end

Então(/^eu devo ver uma mensagem de erro$/) do
  expect(page).to have_content("RA ou senha inválidos!")
end
