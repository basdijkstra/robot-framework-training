*** Settings ***
Documentation    Exercises 07
Library          RequestsLibrary
Test Setup       Create Session  zip  ${BASE_URL}  verify=True
Test Teardown    Delete All Sessions

*** Variables ***
${BASE_URL}  https://jsonplaceholder.typicode.com

*** Test Cases ***
Retrieve data for user 1 and check the response status code
    ${response}  GET On Session  zip  /users/1  expected_status=any
    Status Should Be    200  ${response}

Retrieve data for user 2 and check the response status code
    ${response}  GET On Session  zip  /users/2  expected_status=any
    Status Should Be    200  ${response}

Retrieve data for user 99 and check the response status code
    ${response}  GET On Session  zip  /users/99  expected_status=any
    Status Should Be    404  ${response}
