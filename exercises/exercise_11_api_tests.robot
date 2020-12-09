*** Settings ***
Documentation    An example of using Robot Framework - Requests
### Exercise 1
# Import the RequestsLibrary library

### Exercise 3
# Import the Collections library

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