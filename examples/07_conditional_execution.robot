*** Settings ***
Documentation    Example using conditional execution
Library          SeleniumLibrary
Test Setup       Open And Maximize  ${BASE_URL}  ${BROWSER}
Test Teardown    Close Browser
Resource         common_keywords.robot

*** Variables ***
${BASE_URL}  http://automationpractice.com
${BROWSER}   Chrome

*** Test Cases ***
Check if there is more than one dress in the catalog
    ${number_of_dresses}=  Get Number Of Articles For  dress
    Run Keyword If  ${number_of_dresses} > 1  Log  Multiple dresses were found
    ...  ELSE  Log  Only a single dress was found

Check if there is more than one t-shirt in the catalog
    ${number_of_tshirts}=  Get Number Of Articles For  t-shirt
    Run Keyword If  ${number_of_tshirts} > 1  Log  Multiple t-shirts were found
    ...  ELSE  Log  Only a single t-shirt was found

*** Keywords ***
Get Number Of Articles For
    [Arguments]  ${article_name}
    Wait And Type  id:search_query_top  ${article_name}
    Wait And Click  name:submit_search
    ${number_of_images}=  Wait And Get Element Count  //img[@itemprop='image']
    [Return]  ${number_of_images}
