*** Settings ***
Documentation    Answer for exercise 05 - Using implicit wait
Library          SeleniumLibrary
### Exercise 2
# Add a Test Setup that calls the keyword from Exercise 1 and:
# - Opens Chrome
# - Navigates to http://parabank.parasoft.com
# - Sets the implicit wait timeout to 10 seconds
Test Setup       Open And Maximize With Implicit Wait  ${HOMEPAGE}  ${BROWSER}  10
Test Teardown    Close Browser

*** Variables ***
${HOMEPAGE}  http://parabank.parasoft.com
${BROWSER}   Chrome

*** Test Cases ***
Log in to ParaBank as John and check number of menu options
    ${number_of_menu_options}=  Log In As And Get Number Of Menu Options  john  demo
    Should Be Equal As Integers  ${number_of_menu_options}  8

### Exercise 1
# Add a new keyword 'Open And Maximize With Implicit Wait', that:
# - takes three arguments (URL, browser type and implicit wait timeout)
# - opens the specified browser and navigates to the specified URL
# - sets the implicit timeout to the specified value
# - maximizes the browser window
*** Keywords ***
Open And Maximize With Implicit Wait
    [Arguments]  ${url}  ${browser_name}  ${implicit_wait}
    Open Browser  ${url}  ${browser_name}
    Set Browser Implicit Wait  ${implicit wait}
    Maximize Browser Window

Log In As And Get Number Of Menu Options
    [Arguments]  ${username}  ${password}
    Input Text  name:username  ${username}
    Input Text  name:password  ${password}
    Click Button  xpath://input[@value='Log In']
    ${number_of_options}=  Get Element Count  xpath://div[@id='leftPanel']//a
    [Return]  ${number_of_options}
