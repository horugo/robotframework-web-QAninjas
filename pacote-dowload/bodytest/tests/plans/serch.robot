***Settings***
Documentation       Deletar plano do aluno

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
Cenario: Novo plano
    ${fixture}      Get JSON        plan-delete.json

    ${crossfit}         Set Variable        ${fixture['plan']}

    Insert Plan                     ${crossfit}
    Go To Plans
    Search Plan By Title            ${crossfit['title']}
    Total Items Should Be           1

Cenario: Plano não encontrado
    ${fixture}      Get JSON        plan-search.json

    ${jaeger}         Set Variable        ${fixture['plan']}

    Remove Plan                     ${jaeger["title"]}
    Go To Plans
    Search Plan By Title            ${jaeger["title"]}
    Register Should Not Be Found
    




