*** Settings ***

Documentation    Suites para cadastro de tarefas

Resource    ../resources/base.resource

Test Setup    Start session
Test Teardown    Close session

*** Test Cases ***

Deve cadastrar nova tarefa

    ${task_name}    Set Variable    Robot é show
    Remove_task_from_database    ${task_name}

    Do login

    Criar nova tarefa    ${task_name}
    Validar tarefa       ${task_name}

Remover tarefas
    [Tags]    remove
    ${task_name}    Set Variable    Java é ruim
    Remove_task_from_database    ${task_name}

    Do login

    Criar nova tarefa    ${task_name}
    Validar tarefa       ${task_name}

    Remove task by    ${task_name}
    Wait Until Page Does Not Contain    ${task_name}

Concluir tarefa
    [Tags]    concluir
    ${task_name}    Set Variable    Java é ruim
    Remove_task_from_database    ${task_name}

    Do login

    Criar nova tarefa    ${task_name}
    Validar tarefa       ${task_name}

    Finalizar tarefa    ${task_name}
    Tarefa concluida    ${task_name}
