*** Settings ***

Library     SeleniumLibrary



***Variables***

${Browser}      chrome
${URL}          https://beta.stage2.drogaraia.com.br/


&{home}

...    btnAceitaCookies=//*[@id="onetrust-accept-btn-handler"]
...    btnLogin=//*[@id="fixed-container-styles"]/header/div/div[3]/div[2]/button


&{compra}

...    campoBusca=//*[@id="searchHeader"]
...    inserirBusca=49621    
...    btnBuscarProduto=//*[@id="fixed-container-styles"]/header/div/div[1]/form/button[2]
...    btnComprar=//*[@id="__next"]/main/div[3]/div/div[2]/div[3]/div[2]/div[5]/div[2]/button
...    btnCesta=//*[@id="fixed-container-styles"]/header/div/div[4]/div[1]/a
...    btnFinalizar=//*[@id="__next"]/main/div[1]/div[4]/button[2]
...    btnSelecaoEntrega=//*[@id="delivery-22"]
...    btnContinuarPagamento=//*[@id="__next"]/main/div/div[3]/div/div[2]/div[1]/div[3]/button
...    btnConfirmarPedido=//*[@id="__next"]/main/div/div[3]/div/div[2]/div[1]/div[3]/button[1]

&{pagamento}

...    btnPix=//*[@id="__next"]/main/div/div[3]/div/div[1]/div/div/div/div[4]/div[1]/div/div[3]

&{logarSiteRaia}

...     campoCPF=//*[@id="signInName"]
...     campoSenha=//*[@id="password"]
...     btnEntrar=//*[@id="next"]
...     lblLogin=//*[@id="api"]/div[1]/div[1]/h2

&{dadosLogin}
...     campoCPF=113.805.550-60
...     campoSenha=123456


*** Keywords ****


Abrir a home do site Raia

    Go To    ${URL}
    Maximize Browser Window
    Wait Until Element Is Visible    //*[@id="onetrust-accept-btn-handler"]    10
    Click Element    ${home.btnAceitaCookies}
    Sleep    5
    Wait Until Element Is Visible    //*[@id="fixed-container-styles"]/header/div/div[3]/div/div[2]/span
    Mouse Over    //*[@id="fixed-container-styles"]/header/div/div[3]/div/div[2]/span
    Wait Until Element Is Visible    ${home.btnLogin}    10    
    Click Element    ${home.btnLogin}
    Sleep    10


Realizar login com sucesso

    Wait Until Element Is Visible   ${logarSiteRaia.lblLogin}    5
    Input Text  ${logarSiteRaia.campoCPF}     ${dadosLogin.campoCPF}
    Input Text  ${logarSiteRaia.campoSenha}     ${dadosLogin.campoSenha}
    Sleep  4   
    Click Element   ${logarSiteRaia.btnEntrar}    
    Sleep   15

Realizar uma compra

    Input Text    ${compra.campoBusca}    ${compra.inserirBusca}
    Sleep     8
    Click Element    ${compra.btnBuscarProduto}
    Wait Until Element Is Visible    //*[@id="__next"]/main/div[2]/div/div/h1
    Sleep    10
    Mouse Over    //*[@id="__next"]/main/div[3]/div/div[2]/div[3]/div[2]/div[1]/a/div/img
    Wait Until Element Is Visible    ${compra.btnComprar}
    Click Button    ${compra.btnComprar}
    Sleep  10
    Click Element    ${compra.btnCesta}    
    Sleep    10
    Scroll Element Into View    ${compra.btnFinalizar}
    Sleep  10
    Click Button    ${compra.btnFinalizar}
    Sleep  5
    Wait Until Element Is Visible    //*[@id="__next"]/main/div/div[3]/div/div[1]/div/div/div/div[2]/div/div/div/div[2]/div/p    10    
    Sleep    10
    Click Element    ${compra.btnSelecaoEntrega}
    Sleep  7
    Click Button    ${compra.btnContinuarPagamento}
    Sleep  10
    Click Element    ${pagamento.btnPix}
    Sleep    5
    Click Button    ${compra.btnConfirmarPedido}
    Wait Until Element Is Visible    //*[@id="__next"]/main/div/div/div/div[1]/div/div[1]/h2    20
