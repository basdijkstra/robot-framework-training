*** Settings ***
Documentation    A first example using SeleniumLibrary
Library          SeleniumLibrary

*** Test Cases ***
Perform a search for T-shirts
    Open Browser    http://automationpractice.com  Chrome
    Maximize Browser Window
    Input Text  id:search_query_top  t-shirt
    Click Button    name:submit_search
    Title Should Be     Search - My Store
    Close Browser

