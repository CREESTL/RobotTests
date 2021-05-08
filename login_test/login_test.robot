*** Settings ***
Library         Selenium2Library    run_on_failure=Nothing
Suite Setup     Go to Google
Suite Teardown  Close Browser




*** Variables ***
${chrome_url}     https://www.google.com/?gws_rd=ssl
${test_stand_url}           http://test-stand.ru/login
${valid_username}           phoenix_tstu@inbox.ru
${valid_user_password}      12357895Zz


*** Keywords ***
Go to Google
    Open Browser    http://google.com   chrome
Go to Teststand
    Go To           ${test_stand_url}



*** Test Cases ***
Ensure Home Page is Open
    Location Should Be      ${chrome_url}

Ensure Teststand is Open
    Go to Teststand
    Location Should Be      ${test_stand_url}

Login With Valid Credentials
    Input Text           tag=input      ${valid_username}
    Input Password       tag=input      ${valid_user_password}
    Click Button         tag=button
