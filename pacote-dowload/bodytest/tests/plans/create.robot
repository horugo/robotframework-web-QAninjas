***Settings***
Documentation       Cadastro de plano

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
Cenario: Calcular preço total do pano

    ${plan}     Create Dictionary    title=Papito Teste     duration=12     price=19,99     total=R$ 239,88

    Go To Plans
    Go To Form Plan
    Fill Plan Form              ${plan}
    Total Plan Should Be        ${plan.total}

## FAZER OS EXERCICIOS DA AULA 27