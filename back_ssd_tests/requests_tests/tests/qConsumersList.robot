*** Settings ***
Library         OperatingSystem
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections


*** Variables ***
${main_url}     http://127.0.0.1:3000/api


*** Test Cases ***
Test qConsumersList
    ${json_data}            Get File                back_ssd_tests/requests_tests/_json/requests_examples/qConsumersList.json
    ${expected_response}    Get File                back_ssd_tests/requests_tests/_json/replies_examples/qConsumersList.json
    ${expected_response}        Convert String to Json              ${expected_response}

    ${resp}     POST     ${main_url}/qConsumersList.json        ${json_data}
    Dictionaries Should Be Equal   ${resp.json()}       ${expected_response}
