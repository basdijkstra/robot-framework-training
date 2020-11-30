*** Settings ***
Documentation    Exercise 06 - Using resources
Library          SeleniumLibrary
Test Setup       Open And Maximize  ${HOMEPAGE}  ${BROWSER}
Test Teardown    Close Browser
### Exercise 2
# Use the keywords file from Exercise 1 as a resource
# Run the test to see if it works
# What can you clean up from this .robot file after you're done?

*** Variables ***
${HOMEPAGE}  http://parabank.parasoft.com
${BROWSER}   Chrome
${TIMEOUT}   10

*** Test Cases ***
Log in to ParaBank as John and check number of menu options
    ${number_of_menu_options}=  Log In As And Get Number Of Menu Options  john  demo
    Should Be Equal As Integers  ${number_of_menu_options}  8

*** Keywords ***
Log In As And Get Number Of Menu Options
    [Arguments]  ${username}  ${password}
    Wait And Type  name:username  ${username}
    Wait And Type  name:password  ${password}
    Wait And Click  xpath://input[@value='Log In']
    ${number_of_options}=  Wait And Get Element Count  xpath://div[@id='leftPanel']//a
    [Return]  ${number_of_options}

### Exercise 1
# Move all keywords below to a separate 'common_keywords.robot' file
# Create this file in the 'exercises' folder (where this exercise is located)
Open And Maximize
    [Arguments]  ${url}  ${browser_name}
    Open Browser  ${url}  ${browser_name}
    Maximize Browser Window

Wait And Type
    [Arguments]  ${locator}  ${text_to_type}
    Wait Until Element Is Enabled  ${locator}  ${TIMEOUT}
    Input Text  ${locator}  ${text_to_type}

Wait And Click
    [Arguments]  ${locator}
    Wait Until Element Is Enabled  ${locator}  ${TIMEOUT}
    Click Button  ${locator}

Wait And Get Element Count
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}  ${TIMEOUT}
    ${number_of_elements}=  Get Element Count  ${locator}
    [Return]  ${number_of_elements}
