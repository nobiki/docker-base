*** Settings ***
Documentation  共通定義

*** Keywords ***
ブラウザを開く
    [Documentation]  Start ${BROWSER} browser on ${GRID_URL}
    Open Browser  url=${SERVER}  browser=${BROWSER}  remote_url=${GRID_URL}

ページアクセス
    [Documentation]  Start ${BROWSER} browser on Selenium Grid
    [Arguments]  ${REQUEST-URI}
    Open Browser  url=${SERVER}${REQUEST-URI}  browser=${BROWSER}  remote_url=${GRID_URL}
    Maximize Browser Window

スクリーンショットを保存
    [Arguments]  ${fn}
    Capture Page Screenshot  filename=capture/${fn}

ブラウザを終了
    Close Browser

すべてのブラウザを終了
    Close All Browsers
