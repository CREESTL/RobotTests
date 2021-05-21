
*** Settings ***
Library         Collections
Library         RequestsLibrary


*** Variables ***
${main_url}     http://45.141.102.7:8888/api/
# TODO add {ids}
${get_urls}     admins/consumers/notifications      admins/consumers/notifications_by_user/all/viewing      admins/consumers/notifications_by_user
${post_urls}    admins/consumers/notifications
${put_urls}
${delete_urls}  admins/consumers/notifications/{id}

*** Test Cases ***
Test All Get Requests
    FOR     ${url}  IN  ${get_urls}
        ${resp}     GET     ${main_url}/${url}
        Status Should Be     200
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
