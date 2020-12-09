*** Settings ***
Documentation    An example of using Robot Framework - Requests
Library          RequestsLibrary
Library          Collections

*** Test Cases ***
Check that a valid HTTP call yields status 200 and the expected todo title
    Create Session  todos  http://jsonplaceholder.typicode.com/todos
    ${response}=    Get Request  todos  /1
    Status Should Be  200  ${response}
    ${title}=  Get From Dictionary  ${response.json()}  title
    Should Be Equal  ${title}  delectus aut autem
