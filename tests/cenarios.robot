*** Settings ***

Library  SeleniumLibrary
Library     FakerLibrary        locale=pt_BR
Library     String
Resource  ../resources/rd.resource
Suite Setup  Open Browser  about:blank  chrome
Suite Teardown  Close Browser


**Test Cases**

01-Abrir a home e acessar o login
    Abrir a home do site Raia
    Realizar login com sucesso
    Realizar uma compra


02 -Realizar uma compra delivery    
    Realizar uma compra

