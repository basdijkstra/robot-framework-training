*** Settings ***
Documentation    Common keywords
Library          SeleniumLibrary

*** Variables ***
${TIMEOUT}   10

*** Keywords ***
Open And Maximize
    [Arguments]  ${url}  ${browser_name}
    Open Browser  ${url}  ${browser_name}
    Maximize Browser Window

Wait And Type
    [Arguments]  ${locator}  ${text_to_type}
    Wait Until Element Is Enabled  ${locator}  ${TIMEOUT}
    Input Text  ${locator}  ${text_to_type}

Wait And Click
    [Arguments]  ${locator}
    Wait Until Element Is Enabled  ${locator}  ${TIMEOUT}
    Click Element  ${locator}

Wait And Get Element Count
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}  ${TIMEOUT}
    ${number_of_elements}=  Get Element Count  ${locator}
    [Return]  ${number_of_elements}