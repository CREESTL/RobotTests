
*** Settings ***
Library         Collections
Library         RequestsLibrary


*** Variables ***
${main_url}     http://45.141.102.7:8888/api/
# TODO add {ids}
${get_urls}     super_admins/ssd_url
${post_urls}    super_admins/ssd_url
${put_urls}     super_admins/ssd_url/{id}
${delete_urls}  super_admins/ssd_url/{id}

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
