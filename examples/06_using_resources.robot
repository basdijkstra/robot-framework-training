*** Settings ***
Documentation    Example using custom keywords
Library          SeleniumLibrary
Test Setup       Open And Maximize  ${BASE_URL}  ${BROWSER}
Test Teardown    Close Browser
Resource         common_keywords.robot

*** Variables ***
${BASE_URL}  http://automationpractice.com
${BROWSER}   Chrome

*** Test Cases ***
Perform a search for dresses
    ${number_of_dresses}=  Get Number Of Articles For  dress
    Should Be Equal As Integers  ${number_of_dresses}  7

*** Keywords ***
Get Number Of Articles For
    [Arguments]  ${article_name}
    Wait And Type  id:search_query_top  ${article_name}
    Wait And Click  name:submit_search
    ${number_of_images}=  Wait And Get Element Count  //img[@itemprop='image']
    [Return]  ${number_of_images}
