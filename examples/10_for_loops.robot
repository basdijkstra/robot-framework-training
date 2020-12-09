*** Settings ***
Documentation    Example using for loops
Library          SeleniumLibrary
Test Setup       Open And Maximize  ${BASE_URL}  ${BROWSER}
Test Teardown    Close Browser
Resource         common_keywords.robot

*** Variables ***
${BASE_URL}  http://automationpractice.com
${BROWSER}   Chrome

*** Test Cases ***
#Perform a search for multiple articles and see they're in stock
#    FOR  ${article}  IN  dress  t-shirt  wallet
#        ${number_of_articles}=  Get Number Of Articles For  ${article}
#        Should Be True  ${number_of_articles} > 0
#    END

Perform a search multiple times and see that the results are consistent
    FOR  ${index}  IN RANGE  1  5
        ${number_of_dresses}=  Get Number Of Articles For  dress
        Should Be True  ${number_of_dresses} > 0
        Log  End of iteration ${index}
    END

*** Keywords ***
Get Number Of Articles For
    [Arguments]  ${article_name}
    Wait And Type  id:search_query_top  ${article_name}
    Wait And Click  name:submit_search
    Capture Page Screenshot  screenshot.png
    ${number_of_images}=  Wait And Get Element Count  //img[@itemprop='image']
    [Return]  ${number_of_images}
