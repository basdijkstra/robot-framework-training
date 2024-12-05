*** Settings ***
Documentation  Examples 06
Library  Browser

*** Variables ***
${BASE_URL}   https://parabank.parasoft.com

*** Test Cases ***
Log in to the ParaBank application
    New Page  ${BASE_URL}
    Fill Text  css=[name=username]  john
    Fill Text  css=[name=password]  demo
    Click  css=[value='Log In']
    Get Text  css=h2  equals  Account Services
