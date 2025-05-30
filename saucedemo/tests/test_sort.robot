*** Settings ***
Library    SeleniumLibrary
Library    ../custom_browser.py
Library    ../screenshot_listener.py


*** Variables ***
${url}    https://www.saucedemo.com


*** Test Cases ***
Sort Z-A 
    ${options}=    custom_browser.Get Chrome Options
    Create Webdriver    Chrome    options=${options}
    Go To    ${url}

    

    
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button

    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span/select
    Wait Until Element Is Visible    xpath=//*[@id="header_container"]/div[2]/div/span/span    timeout=5s
    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span/select/option[2]

    Close Browser

Sort Price L-H
    ${options}=    custom_browser.Get Chrome Options
    Create Webdriver    Chrome    options=${options}
    Go To    https://saucedemo.com

    
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button

    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span/select
    Wait Until Element Is Visible    xpath=//*[@id="header_container"]/div[2]/div/span/span    timeout=5s
    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span/select/option[3]

    Close Browser

Sort Price H-L
    ${options}=    custom_browser.Get Chrome Options
    Create Webdriver    Chrome    options=${options}
    Go To    https://saucedemo.com


    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button

    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span/select
    Wait Until Element Is Visible    xpath=//*[@id="header_container"]/div[2]/div/span/span    timeout=5s
    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span/select/option[4]

    Close Browser

