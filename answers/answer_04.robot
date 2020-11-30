*** Settings ***
Documentation    Answer for exercise 04 - Using custom keywords
Library          SeleniumLibrary
### Exercise 2
# Replace the existing Test Setup keyword with your custom keyword from Exercise 1
# Remove the call to Maximize Browser window in the test
# Run your test and see what happens
Test Setup       Open And Maximize  ${HOMEPAGE}  ${BROWSER}
Test Teardown    Close Browser

*** Variables ***
${HOMEPAGE}  http://parabank.parasoft.com
${BROWSER}   Chrome

*** Test Cases ***
Log in to ParaBank as John and check number of menu options
    ### Exercise 4
    # Replace the right keywords in this script with your custom keyword from Exercise 3
    # Run your test and see what happens
    ${number_of_menu_options}=  Log In As And Get Number Of Menu Options  john  demo
    Should Be Equal As Integers  ${number_of_menu_options}  8

### Exercise 1
# Define a *** Keywords *** section with a custom keyword
# that opens the specified browser, goes to a specified URL and maximizes the window
# Specify two arguments and use them in your implementation
*** Keywords ***
Open And Maximize
    [Arguments]  ${url}  ${browser_name}
    Open Browser  ${url}  ${browser_name}
    Maximize Browser Window

### Exercise 3
# Define a custom keyword for logging into ParaBank
# and returning the number of menu options displayed in the user menu
# How many arguments should this keyword take? Which ones?
# Add a return value that contains the number of menu options
# (hint: use an XPath locator with value //div[@id='leftPanel']//a
Log In As And Get Number Of Menu Options
    [Arguments]  ${username}  ${password}
    Input Text  name:username  ${username}
    Input Text  name:password  ${password}
    Click Button  xpath://input[@value='Log In']
    ${number_of_options}=  Get Element Count  xpath://div[@id='leftPanel']//a
    [Return]  ${number_of_options}
