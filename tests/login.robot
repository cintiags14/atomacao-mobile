*** Settings ***

Documentation    Teste de login

Resource    ../resources/base.resource

Test Setup    Start session
Test Teardown    Close session

*** Test Cases ***

Deve logar com sucesso
    Do Login
    Wait Until Page Contains    Minhas tarefas    5
    
    