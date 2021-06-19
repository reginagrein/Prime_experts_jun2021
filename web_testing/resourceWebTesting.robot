*** Settings ***
Documentation        Resource com as implementações das KW da suitWebTesting
Library              SeleniumLibrary

*** Variables ***
${URL}      http://automationpractice.com/index.php


*** Keywords ***
## ---- SETUP
Abrir o navegador
    Open Browser  browser=chrome

## ---- TEARDOWN
Fechar o navegador
#    Close Browser

## ---- STEPS
Acessar a página home do site Automation Practice
    Go To    ${URL}
    Wait Until Element Is Visible    xpath=//img[contains(@class,'logo img-responsive')]

Digitar o nome do produto "${PRODUTO}" no campo pesquisar
    Input Text     xpath=//input[@class='search_query form-control ac_input'][contains(@id,'top')]    ${PRODUTO}

Clicar no botão pesquisar
    Click Button    name=submit_search
    
Conferir se o produto "${PRODUTO}" foi listado no site
    # Wait Until Element Is Visible    xpath=(//a[@class='product-name'][contains(.,'${PRODUTO}')])[2]
    Wait Until Element Is Visible    xpath=//img[contains(@alt,'${PRODUTO}')]

Adicionar o produto "${PRODUTO}" no carrinho
    Mouse Over       xpath=(//a[@class='product-name'][contains(.,'${PRODUTO}')])[2]
    Click Element    xpath=//span[contains(.,'Add to cart')]
    Wait Until Element Is Visible    xpath=//span[contains(.,'Proceed to checkout')]
    Click Element    xpath=//span[contains(.,'Proceed to checkout')]

Conferir se o produto "${PRODUTO}" foi adicionado no carrinho
    Wait Until Element Is Visible    xpath=(//a[contains(.,'${PRODUTO}')])[4]

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text     xpath=//input[@class='search_query form-control ac_input'][contains(@id,'top')]    ${PRODUTO}

Conferir mensagem "${MENSAGEM}"
    Wait Until Element Is Visible    //p[@class='alert alert-warning']
    Element Should Contain    xpath=//p[@class='alert alert-warning']    ${MENSAGEM}

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Mouse Over    xpath=//a[contains(@title,'Women')]

Clicar na sub categoria "${SUBCATEGORIA}"
    Click Element   xpath=(//a[contains(@title,'Summer Dresses')])[1]

Conferir se os produtos da sub-categoria "${SUBCATEGORIA}" foram mostrados na página
    Wait Until Element Is Visible   xpath=//span[@class='cat-name']
    Element Should Contain          xpath=//span[@class='category-name']    ${SUBCATEGORIA}

Clicar em "${CATEGORIA}"
    IF  '${CATEGORIA}' == 'Sign in'
        Click Element    xpath=//a[@class='login'][contains(.,'${CATEGORIA}')]
    ELSE
        Click Element    xpath=//span[contains(.,'${CATEGORIA}')]
    END

Informar um e-mail válido
    Input Text    id=email_create    greinregina@gmail.com

Preencher os dados obrigatórios
    Sleep    10s
    Mouse Over       id=id_gender1
    Click Element    id=id_gender1
    Input Text       id=customer_firstname    Regina
    Input Text       id=customer_lastname     Grein
    Input Text       id=email                 greinregina@gmail.com
    Input Text       id=passwd                147258
    Input Text       id=passwd                147258 
    Select From List By Index         id=days    11
    Select From List By Index         id=months    6
    Select From List By Value         id=years    ${1981}
    Input Text    id=firstname             Regina
    Input Text    id=lastname              Grein
    Input Text    id=address1              Rua Rafael Percicotti
    Input Text    id=city                  Pinhais
    Select From List By Value       name=id_state            2
    Input Text    id=postcode       text=99999
    Select From List By Value       name=id_country    21
    Input Text    id=phone                 41 33333333
    Input Text    id=phone_mobile          41 99998888
    Input Text    id=alias                Regina Grein

Submeter cadastro
    Mouse Over       xpath=//span[contains(.,'Register')]
    Click Element    xpath=//span[contains(.,'Register')]

Conferir se o cadastro foi efetuado com sucesso
    Sleep    5s
    Wait Until Element Is Visible    xpath=//p[@class='info-account'][contains(.,'Welcome to your account. Here you can manage all of your personal information and orders.')]
