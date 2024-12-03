*** Settings ***
Documentation    Examples 01
Library          RequestsLibrary

*** Test Cases ***
Make an API call and check the response status code
    ${session}  Create Session  zip  https://api.zippopotam.us  verify=true
    ${response}  GET On Session  zip  /us/90210
    Status Should Be    200  ${response}
