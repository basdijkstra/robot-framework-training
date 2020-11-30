*** Settings ***
Documentation    Example using test templates
Library          SeleniumLibrary
Test Setup       Open And Maximize  ${BASE_URL}  ${BROWSER}
Test Teardown    Close Browser
Test Template    Check Number Of Articles
Resource         common_keywords.robot

*** Variables ***
${BASE_URL}  http://automationpractice.com
${BROWSER}   Chrome

*** Test Cases ***
Check If Multiple Articles Are In Stock For
    dress
    t-shirt

*** Keywords ***
Check Number Of Articles
    [Arguments]  ${article}
    ${number_of_dresses}=  Get Number Of Articles For  ${article}
    Run Keyword If  ${number_of_dresses} > 1  Log  Multiple articles were found
    ...  ELSE  Log  Only a single article was found

Get Number Of Articles For
    [Arguments]  ${article_name}
    Wait And Type  id:search_query_top  ${article_name}
    Wait And Click  name:submit_search
    ${number_of_images}=  Wait And Get Element Count  //img[@itemprop='image']
    [Return]  ${number_of_images}
