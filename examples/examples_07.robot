*** Settings ***
Documentation  Examples 06
Library  Browser
Test Template  Log In To ParaBank

*** Variables ***
${BASE_URL}   https://parabank.parasoft.com

*** Test Cases ***
Log In As John  john  demo
Log In As Bob  parasoft  demo

*** Keywords ***
Log In To ParaBank
    [Arguments]  ${username}  ${password}
    New Page  ${BASE_URL}
    Fill Text  css=[name=username]  ${username}
    Fill Text  css=[name=password]  ${password}
    Click  css=[value='Log In']
    Get Text  css=h2  equals  Account Services