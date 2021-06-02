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
@{get_urls}=     users/sub_logins        users/notices       users/roles
@{post_urls}=    users/register      users/confirm       users/login     users/sub_logins    users/notices   users/roles     users/register_new      users/register_new_confirm      users/login_sbis    users/sert_list     users/auth_by_sert      users/consumers     users/consumers/confirm
@{put_urls}=     users/link/{str}    users/sub_logins/{id}   users/sub_logins/{id}/role_types    users/roles     users/reset_password    users/reset_password_confirm    users/check_code    users/change_password       users/consumers/{id}
@{delete_urls}=  users/{id}      users/sub_logins/{id}       users/roles/{id}

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
#        ${resp}     POST     ${main_url}/${url}
#        Status Should Be     200
#    END
#
##Test All Put Requests
#    FOR     ${url}  IN  ${put_urls}
#        ${resp}     PUT     ${main_url}/${url}
#        Status Should Be     200
#    END
#
##Test All Delete Requests
#    FOR     ${url}  IN  ${delete_urls}
#        ${resp}     DELETE     ${main_url}/${url}
#        Status Should Be     200
#    END
