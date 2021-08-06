***Settings***
Documentation       Deletar plano do aluno

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
${fixture}      Get JSON        plan-update.json

    ${godzilla}             Set Variable    ${fixture['before']}
    ${kingghidorah}         Set Variable    ${fixture['after']}

    Remove Plan By Title                    ${godzilla['title']}
    Remove Plan By Title                    ${kingghidorah['title']}

    Insert Plan                     ${godzilla}
    Go To Plans
    Search Plan By Title            ${godzilla['title']}
    Go To Plan Update Form          ${godzilla['title']}
    Upate A Plan                    ${kingghidorah}
    Toaster Text Should Be          Plano Atualizado com sucesso

