*** Settings ***
Documentation    Exercise 03 - Using setup and teardown
Library          SeleniumLibrary
### Exercise 1
# Add Test Setup (Open Browser) and Test Teardown (Close Browser) keywords here

*** Variables ***
${HOMEPAGE}  http://parabank.parasoft.com
${BROWSER}   Chrome

### Exercise 2
# Remove the Open Browser and Close Browser keywords from the tests below
# Run the tests and see what happens
*** Test Cases ***
Log in to ParaBank as John and check number of log out links
    Open Browser  ${HOMEPAGE}  ${BROWSER}
    Maximize Browser Window
    Input Text  name:username  john
    Input Text  name:password  demo
    Click Button  xpath://input[@value='Log In']
    ${number_of_log_out_links}=  Get Element Count  link:Log Out
    Should Be Equal As Integers  ${number_of_log_out_links}  1
    Close Browser

Log in to ParaBank as John and check page title
    Open Browser  ${HOMEPAGE}  ${BROWSER}
    Maximize Browser Window
    Input Text  name:username  john
    Input Text  name:password  demo
    Click Button  xpath://input[@value='Log In']
    Title Should Be  ParaBank | Accounts Overview
    Close Browser
