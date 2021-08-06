***Settings***
Documentation       Deletar plano do aluno

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
Cenario: Remover Plano
    ${fixture}      Get JSON        plan-delete.json

    ${crossfit}         Set Variable        ${fixture['plan']}
    
    Insert Plan                     ${crossfit}
    Go To Plans
    Request Removal By Plan         ${crossfit['title']}
    Confirm Removal
    Toaster Text Should Be          Plano removido com sucesso
    Search Plan By Title            ${crossfit['title']}
    Plan Should Not Visible         ${crossfit['title']}


Cenario: Cancelar remoção do plano
    ${fixture}      Get JSON        plan-delete.json

    ${crossfit}         Set Variable        ${fixture['plan']}
    
    Insert Plan                     ${crossfit}
    Go To Plans
    Request Removal By Plan         ${crossfit['title']}
    Cancel Removal
    Search Plan By Title            ${crossfit['title']}
    Plan Should Be Visible          ${crossfit['title']}






