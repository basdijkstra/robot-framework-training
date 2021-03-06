*** Settings ***
Documentation    Answer for exercise 05 - Using explicit wait
Library          SeleniumLibrary
Test Setup       Open And Maximize  ${HOMEPAGE}  ${BROWSER}
Test Teardown    Close Browser

*** Variables ***
${HOMEPAGE}  http://parabank.parasoft.com
${BROWSER}   Chrome
${TIMEOUT}   10

*** Test Cases ***
Log in to ParaBank as John and check number of menu options
    ${number_of_menu_options}=  Log In As And Get Number Of Menu Options With Custom Keywords  john  demo
    Should Be Equal As Integers  ${number_of_menu_options}  8

*** Keywords ***
Open And Maximize
    [Arguments]  ${url}  ${browser_name}
    Open Browser  ${url}  ${browser_name}
    Maximize Browser Window

Log In As And Get Number Of Menu Options
    [Arguments]  ${username}  ${password}
    ### Exercise 1
    # Add an explicit wait that waits for the username field
    # to become enabled for max. 10 seconds before proceeding
    Wait Until Element Is Enabled  name:username  10
    Input Text  name:username  ${username}
    ### Exercise 2
    # The same as Exercise 1, but now for the password field
    Wait Until Element Is Enabled  name:password  10
    Input Text  name:password  ${password}
    ### Exercise 3
    # The same as Exercise 2, but now for the login button
    Wait Until Element Is Enabled  xpath://input[@value='Log In']  10
    Click Button  xpath://input[@value='Log In']
    ### Exercise 4
    # Add an explicit wait that waits for a menu item
    # to become visible for max. 10 seconds before proceeding
    Wait Until Element Is Visible  xpath://div[@id='leftPanel']//a  10
    ${number_of_options}=  Get Element Count  xpath://div[@id='leftPanel']//a
    [Return]  ${number_of_options}

### Exercise 5
# In Exercises 1 and 2, you did the same thing twice.
# This means there is probably a better way to do this...
# Can you create a custom keyword that:
# 1. Waits for an element with a specified locator to become enabled
#    (hint: specify the timeout in the *** Variables *** section
# 2. Types the specified value into the element after it has been successfully located?
# Replace the keywords in 'Log In As And Get Number Of Menu Options With Custom Keywords' with this custom keyword
# Use 'Log In As And Get Number Of Menu Options With Custom Keywords' in the test
# Run the test and see what happens..
Log In As And Get Number Of Menu Options With Custom Keywords
    [Arguments]  ${username}  ${password}
    Wait And Type  name:username  ${username}
    Wait And Type  name:password  ${password}
    Wait And Click  xpath://input[@value='Log In']
    ${number_of_options}=  Wait And Get Element Count  xpath://div[@id='leftPanel']//a
    [Return]  ${number_of_options}

Wait And Type
    [Arguments]  ${locator}  ${text_to_type}
    Wait Until Element Is Enabled  ${locator}  ${TIMEOUT}
    Input Text  ${locator}  ${text_to_type}

### Exercise 6
# Do the same as in Exercise 5, but now for clicking (first wait until the element is enabled, then click)
Wait And Click
    [Arguments]  ${locator}
    Wait Until Element Is Enabled  ${locator}  ${TIMEOUT}
    Click Button  ${locator}

## Exercise 7
# Do the same as in Exercise 5, but now for getting the number of elements
# (first wait until an occurrence of the element is visible, then return the number of elements found)
Wait And Get Element Count
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}  ${TIMEOUT}
    ${number_of_elements}=  Get Element Count  ${locator}
    [Return]  ${number_of_elements}
