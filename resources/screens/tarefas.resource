*** Settings ***
Documentation    Elementos e ações de cadastro de tarefas

Library    AppiumLibrary

*** Variables ***
${new_task_input}    xpath=//*[@resource-id="newTask"]
${button_create}    xpath=//*[@resource-id="createTask"]

*** Keywords ***
Criar nova tarefa

    [Arguments]    ${task_name}


    Input Text    ${new_task_input}    ${task_name}
    Click Element    ${button_create}

Validar tarefa
    [Arguments]    ${new_task}

    Element Should Be Visible
    ...    //*[@resource-id="taskText"][@text="${new_task}"]
    ...    5

Remove task by
    [Arguments]    ${task_name}

    Click Element    xpath=//*[@text="${task_name}"]/../..//*[@resource-id="removeTask"]

    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="SIM"]    3

    Page Should Contain Text    Tem certeza que deseja remover a tarefa?

    Click Element    xpath=//android.widget.Button[@text="SIM"]

Finalizar tarefa
    [Arguments]    ${task_name}

    Click Element    xpath=//*[@text="${task_name}"]/..


Tarefa concluida
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    xpath=//*[@text="${task_name}"]/..//android.widget.ImageView
