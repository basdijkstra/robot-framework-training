*** Settings ***
Documentation  Library containing common keywords used in our tests
Library          RequestsLibrary
Library          Collections

*** Keywords ***
Verify response status and name
    [Arguments]    ${response}  ${expected_status_code}  ${expected_name}
    Status Should Be  ${expected_status_code}  ${response}
    ${name}=  Get From Dictionary  ${response.json()}  name
    Should Be Equal  ${name}  ${expected_name}