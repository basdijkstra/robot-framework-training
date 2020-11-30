*** Settings ***
Documentation    Answers for exercise 08 - Test templates
Library          SeleniumLibrary
Test Setup       Open And Maximize  ${HOMEPAGE}  ${BROWSER}
Test Teardown    Close Browser
Test Template    Log In And Check For Multiple Accounts
Resource         common_keywords.robot

*** Variables ***
${HOMEPAGE}  http://parabank.parasoft.com
${BROWSER}   Chrome

*** Test Cases ***
### Exercise 1
# Convert these two tests into a templated test by:
# 1. Creating a custom keyword that runs the test (think about what you want to parameterize)
# 2. Defining this keyword as a Test Template
#    (can you find out how to use the username in the log statement, too?)
# 3. Specifying the iterations (test cases) in the *** Test Cases *** section
Check if users have more than one account
    john      demo
    parasoft  demo

*** Keywords ***
Log In And Check For Multiple Accounts
    [Arguments]  ${user}  ${pass}
    Log In As  ${user}  ${pass}
    ${accounts}=  Get Number Of Accounts
    Run Keyword If  ${accounts} > 1  Log  User ${user} has multiple accounts
    ...  ELSE  Log  User ${user} has only a single account
    Wait And Click  xpath://a[text()='Log Out']

Log In As
    [Arguments]  ${username}  ${password}
    Wait And Type  name:username  ${username}
    Wait And Type  name:password  ${password}
    Wait And Click  xpath://input[@value='Log In']

Get Number Of Accounts
    ${number_of_accounts}=  Wait And Get Element Count  xpath://table[@id='accountTable']//a
    [Return]  ${number_of_accounts}
