*** Settings ***
Documentation    Answer for exercise 02 - Using variables
Library          SeleniumLibrary

### Exercise 1
# Add a *** Variables *** section and define two variables in there:
# - One that stores the home page URL
# - One that stores the browser to be used
*** Variables ***
${HOMEPAGE}  http://parabank.parasoft.com
${BROWSER}   Chrome

*** Test Cases ***
Log in to ParaBank as John and check number of log out links
    ### Exercise 2
    # Replace the actual values for the homepage URL and the browser
    # with the variable values you defined in Exercise 1
    Open Browser    ${HOMEPAGE}  ${BROWSER}
    Maximize Browser Window
    Input Text  name:username  john
    Input Text  name:password  demo
    Click Button  xpath://input[@value='Log In']
    ### Exercise 3
    # Add two keywords here:
    # - One that get the number of 'Log Out' links on the current page
    #   (hint: use the link: locator with the visible text of the link as a value)
    #   Store the return value of this keyword in a variable, we need that in the next step
    # - Another that checks that the variable value stored in the previous step is equal to 1
    ${number_of_log_out_links}=  Get Element Count  link:Log Out
    Should Be Equal As Integers  ${number_of_log_out_links}  1
    Close Browser
