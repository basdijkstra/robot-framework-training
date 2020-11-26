*** Settings ***
Documentation    Answer for exercise 03 - Using setup and teardown
Library          SeleniumLibrary
### Exercise 1
# Add Test Setup (Open Browser) and Test Teardown (Close Browser) keywords here
Test Setup       Open Browser  ${HOMEPAGE}  ${BROWSER}
Test Teardown    Close Browser

*** Variables ***
${HOMEPAGE}  http://parabank.parasoft.com
${BROWSER}   Chrome

### Exercise 2
# Remove the Open Browser and Close Browser keywords from the tests below
# Run the tests and see what happens
*** Test Cases ***
Log in to ParaBank as John and check number of log out links
    Maximize Browser Window
    Input Text  name:username  john
    Input Text  name:password  demo
    Click Button  xpath://input[@value='Log In']
    ${number_of_log_out_links}=  Get Element Count  link:Log Out
    Should Be Equal As Integers  ${number_of_log_out_links}  1

Log in to ParaBank as John and check page title
    Maximize Browser Window
    Input Text  name:username  john
    Input Text  name:password  demo
    Click Button  xpath://input[@value='Log In']
    Title Should Be  ParaBank | Accounts Overview
