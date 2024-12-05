*** Settings ***
Documentation    Answers 06
Library  Browser
Resource    resources/ui_testing_keywords.resource
Test Setup  New Page  ${BASE_URL}

*** Variables ***
${BASE_URL}  https://www.saucedemo.com

*** Test Cases ***
Log in to the Sauce Demo web shop
    Log In To The Sauce Demo Website    standard_user  secret_sauce
    Get Text  css=.app_logo  equals  Swag Labs
