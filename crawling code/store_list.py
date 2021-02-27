import requests as rq
import pandas as pd

#-------------------------------------------------------------------
# get si_do list
# url = "https://www.starbucks.co.kr/store/getSidoList.do"
#
# res = rq.post(url, data={
#     'rndCod':'N3R2E5Z406'
# })
#
# dosi_list = res.json()
# data = []
# for dosi in dosi_list['list']:
#     print("도시 이름: %s, 코드: %s"%(dosi['sido_nm'], dosi['sido_cd']))
#     city = dosi['sido_nm']
#     cityCode = dosi['sido_cd']
#
#     data.append([cityCode,city])
#
# print(data)
# column = ["도시코드","도시이름"]
# df = pd.DataFrame(data, columns=column)
# print(df)
# df.to_excel("./스타벅스 도시코드.xlsx", index=False)
# print("저장 완료")
gugunCount = []
#-------------------------------------------------------------------
# get gu_gun list
def get_gugun(dosi_code):

    url = "https://www.starbucks.co.kr/store/getGugunList.do"

    # post로 받아온 [sido_cd:dosi_code] res에 담음
    res = rq.post(url, data={
        'sido_cd':dosi_code
    })

    data = []

    # 받아온 res를 gugun_list에 할당
    gugun_list = res.json()
    # print(gugun_list)
    #count = 0
    gugun_tmp = []
    for gugun in gugun_list['list']:
        #print(gugun)
        gugun_cd = gugun['gugun_cd']
        gugun_nm = gugun['gugun_nm']
        data.append([gugun_cd, gugun_nm])
        #count = count + 1
        gugun_tmp.append(gugun_cd)

    column = ["구군코드", "구군이름"]
    gugunCount.append(gugun_tmp)
    df = pd.DataFrame(data, columns=column)
#     fileName = "./starbucks_gugun code" + dosi_code + ".xlsx"
#     print(fileName)
#     df.to_excel(fileName, index=False)

if __name__ == '__main__':
    for i in range(1,18):
        if (i < 10):
            code = '0'+str(i)
        else:
            code = str(i)
        #print(code)
        get_gugun(code)


starbucks_store = []
starbucks_store_add_info = []
global df
#-------------------------------------------------------------------
def get_stores(dosi_code, gugun_code):
    #KSFOLGK7F5
    # 원래 내가 했던 것 : KL3MD7OHTC
    url = "https://www.starbucks.co.kr/store/getStore.do?r=KL3MD7OHTC"

    res = rq.post(url, data= {
        'ins_lat':'37.5816192',
        'ins_lng':'126.92684799999999',
        'p_sido_cd':dosi_code,
        'p_gugun_cd':gugun_code,
        'in_biz_cd':'',
        'set_date':'',
    })

    store_list = res.json()

    count = 0
    for store in store_list['list']:
        storeCode = store['s_code']
        storeName = store['s_name']
        address = store['addr']
        tel = store['tel']
        newIcon = store['new_icon']
        defaultImage = store['defaultimage']
        openDate = store['open_dt']
        doroAddress = store['doro_address']
        sirenOrder = store['my_siren_order_store_yn']
        whcRoad = store['whcroad_yn']
        s_biz_code = store['s_biz_code']

        time_url = "https://www.starbucks.co.kr/store/getStoreView.do"
        time_res = rq.post(time_url,data={
            'in_biz_cd': s_biz_code,
            'rndCod': '8RU7MO81Y4',
        })
        print(time_res)
        info_list = time_res.json()
        info = info_list['view']
        park_info = info[0]['park_info']
        print(park_info)
        map_desc = info[0]['map_desc']
        notice = info[0]['notice']

        time_url = "https://www.starbucks.co.kr/store/getStoreTime.do"
        time_res = rq.post(time_url, data={
            'in_biz_cd': s_biz_code,
            'in_store_type':'C',
            'rndCod': 'C370LX2Q6U',
        })
        print(time_res)
        info_list = time_res.json()

        global store_opentime
        global store_time_week_str
        for info in info_list['list']:
            store_opentime = info['store_opentime']
            store_time_week_str = info['store_time_week_str']
            store_time_week = info['store_time_week']
            starbucks_store_add_info.append([storeCode,store_time_week,store_time_week_str, store_opentime])
        print(starbucks_store_add_info)

        themeState = store['theme_state']
        lat = store['lat']
        lot = store['lot']
        t20 = store['t20']
        t04 = store['t04']
        t03 = store['t03']
        t01 = store['t01']
        t12 = store['t12']
        t09 = store['t09']
        t06 = store['t06']
        t10 = store['t10']
        p10 = store['p10']
        p50 = store['p50']
        p20 = store['p20']
        p60 = store['p60']
        p30 = store['p30']
        p70 = store['p70']
        p40 = store['p40']
        p80 = store['p80']
        t22 = store['t22']
        t21 = store['t21']
        p90 = store['p90']
        t05 = store['t05']
        t30 = store['t30']
        t36 = store['t36']
        #print(store)
        starbucks_store.append([storeCode, storeName, address, doroAddress, tel,park_info, map_desc, notice, newIcon, defaultImage,
                                openDate, sirenOrder, whcRoad, s_biz_code, lat, lot, themeState, t20, t04, t03, t01, t12, t09, t06, t10,
                                p10, p50, p20, p60, p30,p70, p40, p80, t22, t21, p90, t05, t30, t36])

if __name__ == '__main__':
    for i in range(1,18):
        if (i < 10):
            code = '0'+str(i)
        else:
            code = str(i)
        for gugunCode in gugunCount[i-1]:
            #print(code, " ", k)
            get_stores(code, gugunCode)

print("---------------------------")
column = ["storeCode", "storeName", "address", "doroAddress", "tel","parkInfo","map_desc","notice", "newIcon", "defaultImage",
          "openDate", "sirenOrder", "whcRoad", "s_biz_code","lat", "lot", "themeState", "t20", "t04", "t03", "t01", "t12", "t09", "t06",
          "t10", "p10", "p50", "p20", "p60", "p30", "p70", "p40", "p80", "t22", "t21", "p90", "t05", "t30", "t36"]
addInfoColumn = ["storeCode","store_time_week","store_time_week_str","store_openTime"]

df = pd.DataFrame(starbucks_store, columns=column)
print(df)
df.to_excel("./starbucks_storeInfo_20201118 0101_v1.4.xlsx")

addDf = pd.DataFrame(starbucks_store_add_info, columns=addInfoColumn)
addDf.to_excel("./starbucks_storeAddInfo_20201118 0101_v1.4.xlsx")
