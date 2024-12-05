*** Settings ***
Documentation  Library containing API testing keywords used in our tests
Library  Browser

*** Keywords ***
Log in to the Sauce Demo website
    [Arguments]    ${username}  ${password}
    Fill Text  id=user-name  ${username}
    Fill Text  id=password  ${password}
    Click  id=login-button