
*** Settings ***
Library         Collections
Library         RequestsLibrary


*** Variables ***
${main_url}     http://194.87.101.220:8888/
# TODO add {ids}
${get_urls}     contracts/mets_volumes      contracts/      contracts/fact      contracts/settlement    contracts/payments      contracts/balance
${post_urls}    contracts/mets_volumes
${put_urls}     contracts/mets_volumes/{id}
${delete_urls}  contracts/mets_volumes/{id}

*** Test Cases ***
Test All Get Requests
    FOR     ${url}  IN  ${get_urls}
        ${resp}     GET     ${main_url}/${url}
        Status Should Be     200
    END

##Test All Post Requests
 ##    FOR     ${url}  IN  ${post_urls}
 ##        ${resp}     POST     ${main_url}/${url}
 ##        Status Should Be     200
 ##    END
 ##
 ###Test All Put Requests
 ##    FOR     ${url}  IN  ${put_urls}
 ##        ${resp}     PUT     ${main_url}/${url}
 ##        Status Should Be     200
 ##    END
 ##
 ###Test All Delete Requests
 ##    FOR     ${url}  IN  ${delete_urls}
 ##        ${resp}     DELETE     ${main_url}/${url}
 ##        Status Should Be     200
 ##    END