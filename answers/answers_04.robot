*** Settings ***
Documentation    Answers 04
Library          RequestsLibrary
Library          Collections
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

*** Keywords ***
Verify response status and name
    [Arguments]    ${response}  ${expected_status_code}  ${expected_name}
    Status Should Be  ${expected_status_code}  ${response}
    ${name}=  Get From Dictionary  ${response.json()}  name
    Should Be Equal  ${name}  ${expected_name}