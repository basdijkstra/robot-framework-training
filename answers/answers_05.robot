*** Settings ***
Documentation    Exercises 05
Library          RequestsLibrary
Library          Collections
Resource         resources/common_keywords.resource
Test Setup       Create Session  zip  ${BASE_URL}  verify=True
Test Teardown    Delete All Sessions

*** Variables ***
${BASE_URL}  https://jsonplaceholder.typicode.com

*** Test Cases ***
Retrieve data for user 1 and check the response status code
    ${response}  GET On Session  zip  /users/1
    Verify Response Status And Name    ${response}  200  Leanne Graham

Retrieve data for user 2 and check the response status code
    ${response}  GET On Session  zip  /users/2
    Verify Response Status And Name    ${response}  200  Ervin Howell
