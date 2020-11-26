*** Settings ***
Documentation     Just a check to see if your system is set up properly.
Library           SeleniumLibrary

*** Test Cases ***
Perform a Google search
    Open Browser    http://www.robotframework.org  Chrome
    Maximize Browser Window
    Title Should Be  Robot Framework
    Close Browser