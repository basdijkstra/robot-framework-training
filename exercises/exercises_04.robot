*** Settings ***
Documentation    Exercises 04
Library          RequestsLibrary
Library          Collections
Test Setup       Create Session  zip  ${BASE_URL}  verify=True
Test Teardown    Delete All Sessions

*** Variables ***
${BASE_URL}  https://jsonplaceholder.typicode.com

*** Test Cases ***
Retrieve data for user 1 and check the response status code
    ${response}  GET On Session  zip  /users/1
    Status Should Be    200  ${response}
    ${name}=  Get From Dictionary  ${response.json()}  name
    Should Be Equal  ${name}  Leanne Graham

Retrieve data for user 2 and check the response status code
    ${response}  GET On Session  zip  /users/2
    Status Should Be    200  ${response}
    ${name}=  Get From Dictionary  ${response.json()}  name
    Should Be Equal  ${name}  Ervin Howell
