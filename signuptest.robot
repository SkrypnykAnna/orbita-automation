*** Settings ***
Documentation  Tests for testing create an account form
Library  SeleniumLibrary
Library  ./Resource/extendedkeywords.py

Resource  Resource/Variables.robot
Resource  Resource/Keywords.robot


Test Setup  Open Browser  ${AUTH_PAGE_URL}  chrome
Test Teardown  Close all browsers

*** Test Cases ***

S1 User can use search field with valid data (use enter)
    [Tags]  search1
    click element  ${SEARCH_LOCATOR}
    input text and press enter
    wait until page contains element  ${PRODACT_CARD_LOCATOR}


S2 User can use serch field to find specific product (use enter)
    [Tags]  search1
    click and input text
    press keys  ${None}  \\13
    wait until page contains element  ${SPECICIFIC_PRODUCT_CARD_LOCATOR}


S3 User can use search field with valid data (use search button)
    [Tags]  search1
    click element  ${SEARCH_LOCATOR}
    input text  ${SEARCH_LOCATOR}  ${INPUT_TEXT_VAR_ONE}
    sleep  2
    click button  ${SEARCH_BUTTON_LOCATOR}
    wait until page contains element  ${PRODACT_CARD_LOCATOR}


S4 Search with empty search field (use enter key)
    [Tags]  search1
    click element  ${SEARCH_LOCATOR}
    press key  ${SEARCH_LOCATOR}  \\13
    wait until page contains element  ${SEARCH_RESULT_TEXT_MESSEGE}


S5 Search the product is not in the range
    [Tags]  search1
    sleep  2
    click element  ${SEARCH_LOCATOR}
    input text  ${SEARCH_LOCATOR}  ${PRODUCT_NOT_IN_RANGE}
    click button  ${SEARCH_BUTTON_LOCATOR}
    wait until page contains element  ${PRODUCT_NOT_FOUND_ERROR_MESSEGE}


S6 A tooltip appears when user entering data in the search field
    [Tags]  search1
    click element  ${SEARCH_LOCATOR}
    input text  ${SEARCH_LOCATOR}  ${INPUT_TEXT_VAR_THREE}
    wait until page contains element  ${ADWISE_FIELD}   20


S7 Able to search with special characters in search field
    [Tags]   search1
    click element  ${SEARCH_LOCATOR}
    input text  ${SEARCH_LOCATOR}  ${CHARACTERS_FOR_INVALID_DATA_SEARCH}
    click button  ${SEARCH_BUTTON_LOCATOR}
    wait until page contains element  ${PRODUCT_NOT_FOUND_ERROR_MESSEGE}


S8 Make search for item of prodact
    [Tags]  search
    click element  ${SEARCH_LOCATOR}
    input text  ${SEARCH_LOCATOR}  ${ITEM_OF_PRODUCT}
    click button  ${SEARCH_BUTTON_LOCATOR}
    wait until page contains element  ${PRODUCT_NOT_FOUND_ERROR_MESSEGE}


SM1 Find product and making order (first smoke test)
    [Tags]  smoke
    input text and press enter
    add product to card
    go to card
    choose delivery type
    press order button


Search something
    [Tags]  smoke1
    ${random_email}  generate_random_emails  ${8}
    click element  ${SEARCH_LOCATOR}
    input text  ${SEARCH_LOCATOR}  ${random_email}
    click button  ${SEARCH_BUTTON_LOCATOR}


SU1 Unable to make new user registration with using valid data in all fields
    [Tags]  registration1
    click on log in/sign up tab
    click "make new profile" button
    generate random email and input in "Email" field
    generate random password and input in "Password" field
    simulate event  ${PASSWORD_REGISTRATION_FIELD}  blur
    press registration button
    wait until "my profile" tab should be opened


SU2 Unable to make new user registration with emty "Email" field (without using email)
    [Tags]  registration1
    click on log in/sign up tab
    click "make new profile" button
    generate random password and input in "Password" field
    simulate event  ${PASSWORD_REGISTRATION_FIELD}  blur
    press registration button
    wait for "need to enter email" error message


SU3 Unable to make new user registration with emty "password" field (without using password)
    [Tags]  registration1
    click on log in/sign up tab
    click "make new profile" button
    generate random email and input in "Email" field
    simulate event  ${EMAIL_REGISTRATION_FIELD}  blur
    press registration button
    wait for "need to enter password" error message


SU4 Unable to make new user registration with emty "Password" and "Email" fields (without using emai land password)
    [Tags]  registration1
    click on log in/sign up tab
    click "make new profile" button
    press registration button
    wait for "need to enter email" error message


SU5 Unable to make new user registration with data (email and password) that has already been used to sign up user in the past
    [Tags]  registration1
    click on log in/sign up tab
    click "make new profile" button
    put email which already has been used in email field
    enter password which already has been used in password field
    press registration button
    wait until "my profile" tab should be opened


SU6 Unable to make new user registration with email that has already been used to sign up user in the past
    [Tags]  registration1
    click on log in/sign up tab
    click "make new profile" button
    put email which already has been used in email field
    generate random password and input in "Password" field
    press registration button
    wait for "An account is already registered with your email address" error


SU7 Able to make new user registration with password that has already been used to sign up user in the past
    [Tags]  registration1
    click on log in/sign up tab
    click "make new profile" button
    generate random email and input in "Email" field
    enter password which already has been used in password field
    press registration button
    wait until "my profile" tab should be opened


SU8 Unable to create new user registration with invalid email ( not use @ in email)
    [Tags]  registration2
    click on log in/sign up tab
    click "make new profile" button
    generate random invalid email and input in "Email" field
    generate random password and input in "Password" field
    press registration button
    sleep  5


LI1 Able to log in with valid data (email and password)
    [Tags]  login1
    click on log in/sign up tab
    enter already existing email in "Email" field
    enter already existing password in "Password" field
    press log in button
    wait until "my profile" tab should be opened


LI2 Unable to log in with already existing email and invalid password
    [Tags]  login1
    click on log in/sign up tab
    enter already existing email in "Email" field
    generate random password and input in "Password" field (when logging in)
    press log in button
    wait until "Lost your password?" error message return


LI3 Unable to log in without password
    [Tags]  login1
    click on log in/sign up tab
    enter already existing email in "Email" field
    press log in button
    wait until "password field is empty" error message will be returned


LI4 Able to reset password with using "Forgot your password" button (using the email)
    [Tags]  login1
    click on log in/sign up tab
    click on "Forgot your password?" button
    sleep  2
    enter already existing email in "user name or email" field
    press "reset password" button
    wait until "letter has been sent" message return

LI5 Able to reset password with using "Forgot your password" button (using the user name)
    [Tags]  login
    click on log in/sign up tab
    click on "Forgot your password?" button
    sleep  2
    enter already existing user name in "user name or email" field
    press "reset password" button
    wait until "letter has been sent" message return


































