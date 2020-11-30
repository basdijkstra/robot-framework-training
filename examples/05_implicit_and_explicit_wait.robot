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
    Should Be Equal As Integers  ${number_of_dresses}  7

*** Keywords ***
Open And Maximize With Implicit Wait
    [Arguments]  ${url}  ${browser_name}  ${implicit_wait_in_seconds}
    Open Browser  ${url}  ${browser_name}
    Set Browser Implicit Wait  ${implicit_wait_in_seconds}
    Maximize Browser Window

Open And Maximize
    [Arguments]  ${url}  ${browser_name}
    Open Browser  ${url}  ${browser_name}
    Maximize Browser Window

Get Number Of Articles For
    [Arguments]  ${article_name}
    Wait Until Element Is Enabled  id:search_query_top  10
    Input Text  id:search_query_top  ${article_name}
    Wait Until Element Is Enabled  name:submit_search  10
    Click Button    name:submit_search
    Wait Until Element Is Visible  //img[@itemprop='image']  10
    ${number_of_images}=  Get Element Count  //img[@itemprop='image']
    [Return]  ${number_of_images}
