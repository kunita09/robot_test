*** Settings ***
Library    SeleniumLibrary
Library    ../custom_browser.py
Library    ../screenshot_listener.py


*** Variables ***
${url}    https://www.saucedemo.com/


*** Test Cases ***
Shopping One Product
    ${options}=    custom_browser.Get Chrome Options
    Create Webdriver    Chrome    options=${options}
    Go To    ${url}

    
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Link    //*[@id="shopping_cart_container"]/a

    Wait Until Element Is Visible    id=checkout
    Click Button    id=checkout 

    Input Text    id=first-name    owl
    Input Text    id=last-name    ton
    Input Text    id=postal-code    45149

    Wait Until Element Is Visible    id=continue    timeout=10s
    Click Button    id=continue
    Click Button    id=finish
    Click Button    id=back-to-products
    Close Browser

Shopping Many Product
    ${options}=    custom_browser.Get Chrome Options
    Create Webdriver    Chrome    options=${options}
    Go To    https://saucedemo.com

    
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button

    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Click Button    id=add-to-cart-sauce-labs-fleece-jacket
    
    Click Link    //*[@id="shopping_cart_container"]/a

    Click Button    id=continue-shopping

    # Wait Until Element Is Visible    id=checkout
    # Click Button    id=checkout 
    
    Click Button    id=add-to-cart-test.allthethings()-t-shirt-(red)
    
    Click Link    //*[@id="shopping_cart_container"]/a

    Click Button    id=remove-sauce-labs-backpack

    Click Button    id=checkout

    Input Text    id=first-name    owl
    Input Text    id=last-name    ton
    Input Text    id=postal-code    45149

    # Wait Until Element Is Visible    id=continue    timeout=10s
    Click Button    id=continue
    Click Button    id=finish
    Click Button    id=back-to-products
    Close Browser