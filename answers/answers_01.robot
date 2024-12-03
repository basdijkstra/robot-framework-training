*** Settings ***
Documentation    Answers 01
Library          RequestsLibrary

*** Test Cases ***
Retrieve data for user 1 and check the response status code
    Create Session  zip  https://jsonplaceholder.typicode.com
    ${response}  GET On Session  zip  /users/1
    Status Should Be    200  ${response}
