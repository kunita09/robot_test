*** settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://the-internet.herokuapp.com/


*** Keywords ***


*** Test Cases ***
# A/B Testing
#     Open Browser    ${URL}        browser=chrome
#     Click Link    //*[@id="content"]/ul/li[1]/a
#     Sleep    1
#     Close Browser

# Add/Remove Elements
#     Open Browser    ${URL}        browser=chrome
#     Click Link    //*[@id="content"]/ul/li[2]/a
#     Click Button    //div[@class="example"]/button
#     Sleep    5
#     Click Button    //*[@id='elements']/button
#     Sleep    5
#     Close Browser

Basic Auth (user and pass: admin)
    Open Browser    ${URL}        browser=chrome
    Click Link    //*[@id="content"]/ul/li[3]/a
    Alert Should Be Present    admin
    Sleep    5
    
    Close Browser
