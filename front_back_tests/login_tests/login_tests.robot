*** Settings ***
Library         Selenium2Library    run_on_failure=Nothing
Library         RequestsLibrary
Library         String
Library         Collections
Library         OperatingSystem
Suite Setup     Go to Google
Suite Teardown  Close Browser



*** Variables ***
${chrome_url}               https://www.google.com/?gws_rd=ssl
${main_url}                 http://194.87.101.220:8888/
${valid_username}           makss56@gmail.com
${valid_user_password}      Qwerty123
${login_url}                http://194.87.101.220:8888/api/users/login

*** Keywords ***
Go to Google
    Open Browser    http://google.com   chrome

Go to Homepage
    Go To           ${main_url}

Write Token Into File
    [Arguments]     ${token}
    Create File     token.txt    ${token}

*** Test Cases ***
Ensure Google is Open
    Location Should Be      ${chrome_url}

Ensure Homepage is Open
    Go to Homepage
    Location Should Be      ${main_url}

Login With Valid Credentials
    Input Text           id=email      ${valid_username}
    Input Password       id=password      ${valid_user_password}
    Click Button         //button[.//text() = 'Войти']

Ensure Login Successful
    Page Should Contain     Помощь

Login Through Post
    ${body}     Create Dictionary       login=makss56@gmail.com     password=Qwerty123
    ${resp}     POST                    ${login_url}                data=${body}
    ${token}    Set Variable            ${resp.json()['token']}
    Write Token Into File               ${token}
