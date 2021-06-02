*** Settings ***
Library         Collections
Library         RequestsLibrary

*** Variables ***
# First 3 are used to login and get token to create headers
${valid_username}           makss56@gmail.com
${valid_user_password}      Qwerty123
${login_url}                http://194.87.101.220:8888/api/users/login
# This one is used to do requests to back
${back_url}                 http://194.87.101.220:8888/api

# TODO add {ids}
@{get_urls}=     files/term_of_use       files/documents/sbis_types      files/documents     files/documents/attachment      files/documents/history     files/documents/gGetDocInForm
@{post_urls}=    files/term_of_user/confirm      files/term_of_user      files/documents/installing      files/documents     files/documents/sign        files/documents/send_to_saved_sign  files/signed_documents      files/documents/{id}/attachment
@{put_urls}=     files/documents/put_off     files/documents/cancellation        files/documents/prepare_deviation       files/documents/deviation       files/documents/marker      files/documents/approving/prepare       files/documents/approving
@{delete_urls}=  files/documents/        files/documents/remove

*** Keywords ***
# This creates headers that are passed in requests
Create Headers
    [Arguments]     ${token}
    ${headers}      Create Dictionary              x-access-token=${token}
    Set Global Variable                            ${headers}


*** Test Cases ***
# This gets the access-token after logging in
Login Through Post
    ${body}     Create Dictionary       login=makss56@gmail.com     password=Qwerty123
    ${resp}     POST                    ${login_url}                data=${body}
    ${token}    Set Variable            ${resp.json()['token']}
    Set Global Variable                 ${token}
    Create Headers                      ${token}

Test All Get Requests
    FOR     ${url}  IN  @{get_urls}
        ${resp}     GET         ${back_url}/${url}      headers=${headers}
        Status Should Be        200
    END

#Test All Post Requests
#    FOR     ${url}  IN  ${post_urls}
#        ${resp}     GET     ${main_url}/${url}
#        Status Should Be     200
#    END
#
##Test All Put Requests
#    FOR     ${url}  IN  ${put_urls}
#        ${resp}     GET     ${main_url}/${url}
#        Status Should Be     200
#    END
#
##Test All Delete Requests
#    FOR     ${url}  IN  ${delete_urls}
#        ${resp}     GET     ${main_url}/${url}
#        Status Should Be     200
#    END