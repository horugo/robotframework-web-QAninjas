***Settings***
Documentation       Ações da feature de gestão de planos

***Variables***
${TITLE_FIELD}          id=title
${DURATION_FIELD}       id=duration
${PRICE_FIELD}          css=input[name=price]
${TOTAL_FIELD}          css=input[name=total]


${TITLE_FIELD}              css=input[name=title] 
${DURATION_FIELD}           css=input[name=duration]
${PRICE_FIELD}              css=input[name=price]


***Keywords***
## Forms
Submit Plan Form
    Click                       css=button[type=submit]

Fill Plan Form
    [Arguments]     ${plan}

    Fill Text                   ${TITLE_FIELD}             ${plan.title}
    Fill Text                   ${DURATION_FIELD}          ${plan.duration}
    Fill Text                   ${PRICE_FIELD}             ${plan.price}
    
## Links & Buttons
Go To Form Plan
    Click                       css=a[href$="planos/new"]
    Wait For Elements State     css=h1 >> text=Novo plano     visible    5

## Validations
Total Plan Should Be
    [Arguments]     ${total}

    Get Attribute       ${TOTAL_FIELD}      value       ==      ${total}

## Exercicio aula 27
##Delete
Request Removal By Plan
    [Arguments]     ${plan}
    Click       xpath=//td[contains(text(),"${plan}")]/../td//button[@id="trash"]

Search Plan By Title
    [Arguments]     ${plan}
    Fill Text       css=input[placeholder="Buscar plano"]       ${plan}

Plan Should Not Visible
    [Arguments]     ${plan}
    Wait For Elements State     xpath=//td[contains(text(),"${plan}")]     detached    5
    
Plan Should Be Visible
    [Arguments]     ${plan}
    Wait For Elements State     xpath=//td[contains(text(),"${plan}")]     visible    5

##update
Search Plan By Title
    [Arguments]     ${plan}
    Fill Text       css=input[placeholder="Buscar plano"]       ${plan}

Go To Plan Update Form
    [Arguments]     ${plan}

    Click       xpath=//td[contains(text(),"${plan}")]/..//a[@class="edit"]
    Wait For Elements State     css=h1 >> text=Edição de plano     visible

Upate A Plan
    [Arguments]     ${plan}
    Fill Text                   ${TITLE_FIELD}                 ${kingghidorah['title']}
    Fill Text                   ${DURATION_FIELD}              ${kingghidorah['duration']}
    Fill Text                   ${PRICE_FIELD}                 ${kingghidorah['price']}
    
    Submit Plan Form

Submit Plan Form
    Click                       css=button[type=submit]
