*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${web_url}   http://127.0.0.1:5000
${email}    pradeepak571@gmail.com
${password}     12345

*** Test Cases ***
User Registeration test
    [Documentation]  Can user able to register?
    [Tags]  user
    open browser    ${web_url}   chrome
    maximize browser window
    input text  name:name   Pradeep Kumar A
    sleep  1s
    input text  name:address    41A Puduvalasu,Erode
    sleep  1s
    input text  name:email      ${email}
    sleep  1s
    input text  name:phone      8270748551
    sleep  1s
    input text  name:password   ${password}
    sleep  1s
    click button  xpath=//html/body/div/div/div/form/table/tbody/tr[6]/td[2]/button
    sleep  1s

User Login test
    [Documentation]  Once Registered,user can able to login?
    [Tags]  user
    input text  name:email  ${email}
    sleep  1s
    input text  name:password   ${password}
    sleep  1s
    click button  xpath=//html/body/div/div/div/form/table/tbody/tr[3]/td[2]/button
    sleep  5s

Report Crime test
    [Documentation]  Can Register able to report crime?
    [Tags]  user
    click link  xpath=//html/body/nav/a[1]
    sleep  1s
    input text  name:date   6/4/22
    sleep  1s
    input text  name:remark  Lost My Pistol
    sleep   1s
    input text  name:description    I have missed My Pistol on 05/04/2022. I request you to find it as soon as possible before some one use that in wrong way.
    sleep  3s
    click button  xpath=//html/body/div/div/div/form/table/tbody/tr[4]/td[2]/center/button
    sleep  1s

Edit User Profile test
    [Documentation]  Register can view and modify account info?
    [Tags]  user
    click link  xpath=//html/body/nav/a[2]
    sleep  1s
    input text  name:email  ${email}
    sleep  1s
    click button  xpath=//html/body/div/div/div/form[1]/table/tbody/tr[2]/td[2]/center/button
    sleep  2s
    input text  name:name   A Pradeep
    sleep  3s
    click button  xpath=//html/body/div/div/div/form[2]/table/tbody/tr[6]/td[2]/button
    sleep  1s

User Logout test
    [Documentation]  Is Register not able to access after logout
    [Tags]  user
    click link  xpath=//html/body/nav/a[3]
    sleep  2s
    close browser


*** Keywords ***
