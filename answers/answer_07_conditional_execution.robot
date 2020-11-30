*** Settings ***
Documentation    Answers for exercise 07 - Conditional execution
Library          SeleniumLibrary
Test Setup       Open And Maximize  ${HOMEPAGE}  ${BROWSER}
Test Teardown    Close Browser
Resource         common_keywords.robot

*** Variables ***
${HOMEPAGE}  http://parabank.parasoft.com
${BROWSER}   Chrome

*** Test Cases ***
### Exercise 1
# Add a test case that:
# 1. Logs in (using the 'Log In As' keyword) as user 'john' with password 'demo'
# 2. Retrieves the number of accounts for John (using the 'Get Number Of Accounts' keyword)
#    and stores this in a variable
# 3. Writes 'John has multiple accounts' to the log if the number of accounts is higher than 1,
#    or writes 'John has only a single account' to the log, otherwise (use the 'Log' keyword).
Log in to ParaBank as John and check if user has multiple accounts
    Log In As  john  demo
    ${accounts}=  Get Number Of Accounts
    Run Keyword If  ${accounts} > 1  Log  John has multiple accounts
    ...  ELSE  Log  John has only a single account

### Exercise 2
# Add another test case that does the same as Exercise 1, but now for user 'parasoft' with password 'demo'
Log in to ParaBank as Bob and check if user has multiple accounts
    Log In As  parasoft  demo
    ${accounts}=  Get Number Of Accounts
    Run Keyword If  ${accounts} > 1  Log  Bob has multiple accounts
    ...  ELSE  Log  Bob has only a single account

*** Keywords ***
Log In As
    [Arguments]  ${username}  ${password}
    Wait And Type  name:username  ${username}
    Wait And Type  name:password  ${password}
    Wait And Click  xpath://input[@value='Log In']

Get Number Of Accounts
    ${number_of_accounts}=  Wait And Get Element Count  xpath://table[@id='accountTable']//a
    [Return]  ${number_of_accounts}
