from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.common.exceptions import ElementNotInteractableException
from selenium.webdriver.common.alert import Alert
from selenium.webdriver.common.keys import Keys
from selenium.webdriver import ActionChains


import time
import pandas as pd

clickPath = ""
btnClick = 0

driver = webdriver.Chrome()
driver.implicitly_wait(3)

login_URL = "https://www.starbucks.co.kr/login/login.do"
menu_URL = "https://www.starbucks.co.kr/menu/drink_view.do"

driver.get(login_URL)
html = driver.page_source

# 로그인 진행
driver.find_element_by_name("user_id").send_keys("아이디")
driver.find_element_by_name("user_pwd").send_keys("비밀번호")
driver.find_element_by_xpath('/html/body/div[7]/div[7]/div/div/div/form/fieldset/section[1]/div[1]/p[3]/a').click()

# alert창 예외처리
da = Alert(driver)
da.accept()

personalOptionData = []
indexRange = 9

# 여기서부터 반복문으로 option 데이터 가져와야할 것으로 보임
# 특정 메뉴 페이지로 이동
# 전체 데이터 개수 175개

for i in range(1, 41):

    menu_id_URL = "https://www.starbucks.co.kr/menu/drink_view.do?product_cd=9200000002487"
    driver.get(menu_id_URL)

    time.sleep(2)

    # 나만의 메뉴 등록하기로 접근
    myMenuBtn = driver.find_element_by_xpath('/html/body/div[3]/div[7]/div[2]/div[1]/div[2]/div[1]/div/a')
    myMenuBtn.click()

    time.sleep(1)

    # 전체보기 클릭
    driver.find_element_by_id("my_kind_ALL").click()

    html = driver.page_source
    bs = BeautifulSoup(html,"html.parser")

    # ul drink area class의 자식 li의 자식의 자식 dl의 자식 dt의 자식인 a.btn_go_my_drink_step2를 긁어옴
    menu_options = bs.select("ul.drink_area >  li > dl > dt > a.btn_go_my_drink_step2")

    print("Number: ", i ,"data loading start ----------------------------------------------------------- ")

    # 선택 요소 접근 후 클릭
    xpath = '/html/body/div[5]/div[2]/div[2]/div/div[1]/ul/li['+str(i)+']/dl/dt/a'

    menu_access = driver.find_element_by_xpath(xpath)

    if i > 4:
        j = 0
        move = driver.find_element_by_id("mCSB_1")
        if int((i-1)%4) == 0:
            indexRange = indexRange + 1
        print(indexRange)
        for j in range(indexRange):
            move.send_keys(Keys.PAGE_DOWN)
            time.sleep(1)

    # Interactable exception 처리 --------------------------------
    try:

        driver.find_element_by_xpath(xpath).click()

    except ElementNotInteractableException as e:

        move = driver.find_element_by_id("mCSB_1")
        #for a in range(0,2):
        move.send_keys(Keys.PAGE_DOWN)
        time.sleep(1)
        driver.find_element_by_xpath(xpath).click()

    # ------------------------------------------------------------

    html = driver.page_source
    bs = BeautifulSoup(html,"html.parser")

    # 제품명
    productName = driver.find_element_by_xpath('/html/body/div[5]/div[3]/dl/dd/p').text
    index = -1

    # 국문, 영문 구분
    for char in productName:
        index = index + 1
        if char == "\n":
            break
    korName = productName[:index].strip()
    engName = productName[index+1:].strip()
    #print(productName, "/", korName, "/", engName)

    # 제품 옵션 선택 1 : hot, ice
    hotYN = bs.find("select",{"id":"delegateHotYn"}).text
    #print(hotYN)

    # 제품 옵션 선택 2 : 사이즈
    delegateSize = driver.find_element_by_xpath('/html/body/div[5]/div[3]/div/div[1]/select').text
    # 각 값을 @로 구분함
    delegateSizeOption = delegateSize.replace("\n","@")
    #print(delegateSizeOption)

    # 제품 옵션 선택 3 : 컵 선택
    cupSize = driver.find_element_by_xpath('/html/body/div[5]/div[3]/div/div[2]/select').text
    # 각 값을 @로 구분함
    cupSizeOption = cupSize.replace("\n","@")
    #print(cupSizeOption)

    # 이미지 파일 링크
    imgSrc = driver.find_element_by_css_selector('dl.my_sel_drink > dt > img')
    image = imgSrc.get_attribute('src')
    #print(image)

    driver.find_element_by_class_name("btn_ps_opt").click()

    # option count
    index = driver.find_elements_by_xpath('//*[@id="mCSB_2_container"]/ul/li')
    index = int(len(index))

    options = []
    count = 0

    # get drink option -------------------------------------------------------------------------
    for btnClick in range(1, index + 1):
        # 접근불가 예외처리
        try:
            count = count + 1
            getDataXpath = '//*[@id="mCSB_2_container"]/ul/li['+str(btnClick)+']/div/ul/li/p[1]'

            # 접근 불가 해결을 위한 스크롤
            if btnClick >= 4:
                move = driver.find_element_by_id("mCSB_2")
                for k in range(2):
                    move.send_keys(Keys.PAGE_DOWN)
                    time.sleep(1)

            if i == 3 & btnClick == 3:
                move = driver.find_element_by_id("mCSB_2")
                for k in range(2):
                    move.send_keys(Keys.PAGE_DOWN)
                    time.sleep(1)

            print(btnClick)

            # option 미클릭 exception 처리
            time.sleep(1)

            #driver.find_element_by_xpath('/html/body/div[5]/div[5]/div/div/div[1]/ul/li['+str(btnClick)+']/p[2]').click()
            clickPath = '/html/body/div[5]/div[5]/div/div/div[1]/ul/li['+str(btnClick)+']/p[2]/a'
            driver.find_element_by_xpath(clickPath).click()

            time.sleep(2)

            coffeeOption = driver.find_element_by_xpath(getDataXpath)
            #print(coffeeOption.text)

            options.append(coffeeOption.text)
            time.sleep(1)

        except ElementNotInteractableException as e:

            print(e, "에러 발생으로 스크롤 다운 예외처리 진행")
            move = driver.find_element_by_id("mCSB_2")
            j = 0
            for j in range(1):
                move.send_keys(Keys.PAGE_DOWN)
                time.sleep(1)

            clickPath = '/html/body/div[5]/div[5]/div/div/div[1]/ul/li[' + str(btnClick) + ']/p[2]/a'
            driver.find_element_by_xpath(clickPath).click()

            time.sleep(2)

            coffeeOption = driver.find_element_by_xpath(getDataXpath)
            #print(coffeeOption.text)

            options.append(coffeeOption.text)
            time.sleep(1)

            continue
            # -------------------------------------------------------------------------------------

    indexNum = 'OPT'+str(i)
    oneProductOptionData = [indexNum,korName,engName,hotYN,delegateSizeOption,cupSizeOption,image]

    for option in options:
        oneProductOptionData.append(option)

    print(count)
    if count < 11:
        for count in range(count,11):
            oneProductOptionData.append('none')

    print(oneProductOptionData)
    print(len(oneProductOptionData))

    personalOptionData.append(oneProductOptionData)
    time.sleep(2)
    # ---------------------------------------------------------------------------------------

column = ["index","korName","engName","hotYN","delegateSize","cupSizeOption","image","opt1","opt2","opt3","opt4","opt5","opt6","opt7","opt8","opt9","opt10", "opt11"]

print(personalOptionData)

dataFrame = pd.DataFrame(personalOptionData, columns=column)
print(dataFrame)
dataFrame.to_excel("./drinkOption_20201109 2215_v1.1.xlsx",index=False)

print("finish line -----------------------------")
