*** Settings ***
Documentation    Answers 02
Library          RequestsLibrary

*** Variables ***
${BASE_URL}  https://jsonplaceholder.typicode.com

*** Test Cases ***
Retrieve data for user 1 and check the response status code
    ${session}  Create Session  zip  ${BASE_URL}  verify=True
    ${response}  GET On Session  zip  /users/1
    Status Should Be    200  ${response}
