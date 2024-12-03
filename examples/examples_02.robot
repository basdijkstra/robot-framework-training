*** Settings ***
Documentation    Example of using variables
Library          SeleniumLibrary

*** Variables ***
${BASE_URL}  http://automationpractice.com
${BROWSER}   Chrome

*** Test Cases ***
Perform a search for dresses
    Open Browser  ${BASE_URL}  ${BROWSER}
    Maximize Browser Window
    Input Text  id:search_query_top  dress
    Click Button    name:submit_search
    ${number_of_images}=  Get Element Count  class:product-image-container
    Should Be Equal As Integers  ${number_of_images}  8
    Close Browser

