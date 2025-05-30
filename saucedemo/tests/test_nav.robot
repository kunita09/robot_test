*** Settings ***
Library    SeleniumLibrary
Library    ../custom_browser.py
Library    ../screenshot_listener.py


*** Variables ***
${url}    https://www.saucedemo.com


*** Test Cases ***
Menu About Page 
    ${options}=    custom_browser.Get Chrome Options
    Create Webdriver    Chrome    options=${options}
    Go To    ${url}

    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button

    Click Button                     id=react-burger-menu-btn

    Wait Until Element Is Visible    xpath=//*[@id="menu_button_container"]/div/div[2]/div[1]/nav
    Click Link                       xpath=//*[@id="about_sidebar_link"]

    Close Browser

Menu logout and reset 
    ${options}=    custom_browser.Get Chrome Options
    Create Webdriver    Chrome    options=${options}
    Go To    ${url}

    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button

    Click Button                     id=react-burger-menu-btn

    Wait Until Element Is Visible    xpath=//*[@id="menu_button_container"]/div/div[2]/div[1]/nav
    Click Link                       id=logout_sidebar_link

    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button

    Click Button                     id=react-burger-menu-btn

    Wait Until Element Is Visible    xpath=//*[@id="menu_button_container"]/div/div[2]/div[1]/nav
    Click Link                       id=reset_sidebar_link

    Close Browser
