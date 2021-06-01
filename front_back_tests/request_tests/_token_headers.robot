*** Settings ***
Library         Selenium2Library    run_on_failure=Nothing
Library         RequestsLibrary
Library         String
Library         Collections
Library         OperatingSystem


*** Variables ***
${main_url}                 http://194.87.101.220:8888/
${valid_username}           makss56@gmail.com
${valid_user_password}      Qwerty123
${login_url}                http://194.87.101.220:8888/api/users/login

*** Keywords ***
Create Headers
    [Arguments]     ${token}
    ${headers}      Create Dictionary              Accept=application/json     Authorization=Bearer ${token}
    Set Global Variable                            ${headers}

*** Test Cases ***
Login Through Post
    ${body}     Create Dictionary       login=makss56@gmail.com     password=Qwerty123
    ${resp}     POST                    ${login_url}                data=${body}
    ${token}    Set Variable            ${resp.json()['token']}
    Set Global Variable                 ${token}
    Create Headers                      ${token}
    Log To Console                      ${headers}
