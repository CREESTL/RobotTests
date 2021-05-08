*** Settings ***
Library         Selenium2Library
Suite Setup     Go to Google
Suite Teardown  Close Browser

*** Keywords ***
Go to Google
    Open Browser    http://google.com   chrome

*** Variables ***
${valid_chrome_url}     https://www.google.com/?gws_rd=ssl

*** Test Cases ***
Ensure Home Page is Open
    Location Should Be      ${valid_chrome_url}
