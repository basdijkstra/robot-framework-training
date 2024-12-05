*** Settings ***
Documentation    Answers 07
Library          RequestsLibrary
Test Template    Get User Data And Check Status Code
Test Setup       Create Session  zip  ${BASE_URL}  verify=True
Test Teardown    Delete All Sessions

*** Variables ***
${BASE_URL}  https://jsonplaceholder.typicode.com

*** Test Cases ***
User 1 exists  1  200
User 2 exists  2  200
User 99 does not exist  99  404

*** Keywords ***
Get User Data And Check Status Code
    [Arguments]    ${userId}  ${statusCode}
    ${response}  GET On Session  zip  /users/${userId}  expected_status=any
    Status Should Be    ${statusCode}  ${response}
