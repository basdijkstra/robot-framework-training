*** Settings ***
Documentation    Exercises 03
Library          RequestsLibrary

*** Variables ***
${BASE_URL}  https://jsonplaceholder.typicode.com

*** Test Cases ***
Retrieve data for user 1 and check the response status code
    Create Session  zip  ${BASE_URL}  verify=True
    ${response}  GET On Session  zip  /users/1
    Status Should Be    200  ${response}
    Delete All Sessions

Retrieve data for user 2 and check the response status code
    Create Session  zip  ${BASE_URL}  verify=True
    ${response}  GET On Session  zip  /users/2
    Status Should Be    200  ${response}
    Delete All Sessions
