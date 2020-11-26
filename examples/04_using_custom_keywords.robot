*** Settings ***
Documentation    Example using custom keywords
Library          SeleniumLibrary
Test Setup       Open And Maximize  ${BASE_URL}  ${BROWSER}
Test Teardown    Close Browser

*** Variables ***
${BASE_URL}  http://automationpractice.com
${BROWSER}   Chrome

*** Test Cases ***
Perform a search for dresses
    ${number_of_dresses}=  Get Number Of Articles For  dress
    Should Be Equal As Integers  ${number_of_dresses}  8

*** Keywords ***
Open And Maximize Browser
    Open Browser  ${BASE_URL}  ${BROWSER}
    Maximize Browser Window

Open And Maximize
    [Arguments]  ${url}  ${browser_name}
    Open Browser  ${url}  ${browser_name}
    Maximize Browser Window

Get Number Of Articles For
    [Arguments]  ${article_name}
    Input Text  id:search_query_top  ${article_name}
    Click Button    name:submit_search
    ${number_of_images}=  Get Element Count  class:product-image-container
    [Return]  ${number_of_images}
