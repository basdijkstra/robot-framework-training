*** Settings ***
Documentation    Exercises 02
Library          RequestsLibrary

*** Test Cases ***
Retrieve data for user 1 and check the response status code
    ${session}  Create Session  zip  https://jsonplaceholder.typicode.com  verify=True
    ${response}  GET On Session  zip  /users/1
    Status Should Be    200  ${response}
