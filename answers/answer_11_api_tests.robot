*** Settings ***
Documentation    An example of using Robot Framework - Requests
### Exercise 1
# Import the RequestsLibrary library
Library          RequestsLibrary
### Exercise 3
# Import the Collections library
Library          Collections

*** Test Cases ***
### Exercise 2
# Add a test case that performs these steps:
# - Create a session for http://api.zippopotam.us
# - Perform a GET request to /us/90210
# - Check that the response HTTP status code equals 200

### Exercise 4
# Building on the result from Exercise 2,
# convert the JSON response body to a dictionary and
# extract the ‘country’ element into a variable
# Check that its value equals ‘United States’
Check that a valid HTTP call yields status 200 and the expected todo title
    Create Session  zip  http://api.zippopotam.us
    ${response}=    Get Request  zip  /us/90210
    Status Should Be  200  ${response}
    ${country}=  Get From Dictionary  ${response.json()}  country
    Should Be Equal  ${country}  United States
