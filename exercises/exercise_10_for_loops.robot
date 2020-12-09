*** Settings ***
Documentation    Answers for exercise 08 - Test templates
Library          SeleniumLibrary
Test Setup       Open And Maximize  ${HOMEPAGE}  ${BROWSER}
Test Teardown    Close Browser

*** Variables ***
${HOMEPAGE}  http://parabank.parasoft.com
${BROWSER}   Chrome

*** Test Cases ***
Log In And Check Page Title
    ### Exercise 1
    # Using a FOR loop, go through the Log In - Check Title - Log Out
    # sequence twice, once for user 'john' and once for user 'parasoft'
    Log In As  john  demo
    Title Should Be  ParaBank | Accounts Overview
    Wait And Click  xpath://a[text()='Log Out']

List Account Numbers
    ### Exercise 2
    # Using a FOR loop, log all 11 account numbers for user 'john'
    # The sequence below logs the first one
    Log In As  john  demo
    Wait Until Element Is Visible  xpath:(//table[@id='accountTable']//a)[1]
    ${account_number}=  Get Text  xpath:(//table[@id='accountTable']//a)[1]
    Log  Account 1 for user 'john' has account number ${account_number}

*** Keywords ***
Log In As
    [Arguments]  ${username}  ${password}
    Wait And Type  name:username  ${username}
    Wait And Type  name:password  ${password}
    Wait And Click  xpath://input[@value='Log In']

Open And Maximize
    [Arguments]  ${url}  ${browser_name}
    Open Browser  ${url}  ${browser_name}
    Maximize Browser Window

Wait And Type
    [Arguments]  ${locator}  ${text_to_type}
    Wait Until Element Is Enabled  ${locator}  10
    Input Text  ${locator}  ${text_to_type}

Wait And Click
    [Arguments]  ${locator}
    Wait Until Element Is Enabled  ${locator}  10
    Click Element  ${locator}