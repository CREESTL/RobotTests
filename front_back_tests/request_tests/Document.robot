
*** Settings ***
Library         Collections
Library         RequestsLibrary


*** Variables ***
${main_url}     http://194.87.101.220:8888/
# TODO add {ids}
${get_urls}     files/term_of_use       files/documents/sbis_types      files/documents     files/documents/attachment      files/documents/history     files/documents/gGetDocInForm
${post_urls}    files/term_of_user/confirm      files/term_of_user      files/documents/installing      files/documents     files/documents/sign        files/documents/send_to_saved_sign  files/signed_documents      files/documents/{id}/attachment
${put_urls}     files/documents/put_off     files/documents/cancellation        files/documents/prepare_deviation       files/documents/deviation       files/documents/marker      files/documents/approving/prepare       files/documents/approving
${delete_urls}  files/documents/        files/documents/remove

*** Test Cases ***
Test All Get Requests
    FOR     ${url}  IN  ${get_urls}
        ${resp}     GET     ${main_url}/${url}
        Status Should Be     200
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