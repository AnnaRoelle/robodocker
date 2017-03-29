*** Settings ***
Library  Collections
Library  requests

*** Test Cases ***
200 : Successful Call
    ${result} =  get  http://echo.jsontest.com/framework/robot-framework/api/rest
    log     ${result}
    Should Be Equal  ${result.status_code}  ${200}
    ${json} =  Set Variable  ${result.json()}
    ${framework} =  Get From Dictionary  ${json}  framework
    Should Be Equal  ${framework}  robot-framework
    ${api} =  Get From Dictionary  ${json}  api
    Should Be Equal  ${api}  rest
