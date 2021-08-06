***Settings***
Documentation       Cadastro de alunos

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
Cenario: Novo Aluno
    &{student}   Create Dictionary      name=victor hugo    email=victorhugo3@gmail.com     age=30   weight=75     feet_tall=1.69

    Remove Student                  ${student.email}
    Go To Students
    Go To Form Student
    New Student                     ${student}
    Toaster Text Should Be          Aluno cadastrado com sucesso.

    [Teardown]      Thinking And Take Screenshot   2

Cenario: Não deve permitir email duplicado
    [tags]      dup
    &{student}   Create Dictionary      name=João da Silva    email=joao@gmail.com     age=20   weight=72     feet_tall=1.75

    Insert Student              ${student}
    Go To Students
    Go To Form Student
    New Student                 ${student}
    Toaster Text Should Be      Email já existe no sistema.

    [Teardown]      Thinking And Take Screenshot   2

Cenario: Todos os campos devem ser obrigatorios
    @{expected_alerts}      Set Variable    Nome é obrigatório      O e-mail é obrigatório      idade é obrigatória     o peso é obrigatório    a Altura é obrigatória
    @{got_alerts}           Create List

    Go To Students
    Go To Form Student
    Submit Student Form

    # FOR     ${alert}    IN     @{expected_alerts}
    #     Alert Text Should Be    ${alert}
    # END 

    FOR     ${index}        IN RANGE    1   6
        ${span}             Get Required Alerts     ${index}
        Append To List      ${got_alerts}           ${span}
    END

    Log     ${expected_alerts}
    Log     ${got_alerts}
    
    Lists Should Be Equal       ${expected_alerts}      ${got_alerts}

Cenario: Validação dos campos numéricos
    [tags]          temp
    [Template]      Check Type Field On Student Form
    ${AGE_FIELD}                 number
    ${WEIGHT_FIELD}              number
    ${FEET_TALL_FIELD}           number

Cenario: Validar compo do tipo email
    [tags]          temp
    [Template]            Check Type Field On Student Form
    ${EMAIL_FIELD}        email

Cenario: Menor de 14 anos não pode fazer cadastro
    &{student}   Create Dictionary      name=Livia da Silva    email=livia@yahoo.com     age=13   weight=50     feet_tall=1.65

    Go To Students
    Go To Form Student
    New Student             ${student}
    Alert Text Should Be    A idade deve ser maior ou igual 14 anos

***Keywords***
Check Type Field On Student Form
    [Arguments]         ${element}      ${type}

    Go To Students
    Go To Form Student
    Field Should Be Type      ${element}        ${type}