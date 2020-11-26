*** Settings ***
Documentation    Answer for exercise 01 - A first SeleniumLibrary test
Library          SeleniumLibrary

*** Test Cases ***
Log in to ParaBank as John and check browser window title
    Open Browser    http://parabank.parasoft.com  Chrome
    Maximize Browser Window
    Input Text  name:username  john
    Input Text  name:password  demo
    Click Button  xpath://input[@value='Log In']
    Title Should Be     ParaBank | Accounts Overview
    Close Browser
