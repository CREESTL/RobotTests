*** Settings ***
Library         OperatingSystem
Library         RequestsLibrary


*** Variables ***
${main_url}     http://127.0.0.1:3000/


# TODO do I need list of URLS here? They all start with server address and then just json data
# TODO Add a test which reads each json file and adds it to request

*** Test Cases ***
Test All Get Requests
    ${get_urls}     Get File      ./back_ssd_tests/requests_tests/request_urls.txt      encoding=UTF-8
    FOR     ${url}  IN  ${get_urls}
        ${resp}     GET     ${main_url}/${url}      {test: "test"}
        Status Should Be     200
        Log To Console       ${resp.json()}
    END
