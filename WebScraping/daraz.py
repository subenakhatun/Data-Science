# First import all 
from selenium import webdriver
import time
from selenium.webdriver.common.by import By

# chrome browser setup
driver = webdriver.Chrome()
driver.get('https://www.daraz.com.bd/mens-sneakers/?spm=a2a0e.tm80330838.cate_2_2.1.1add44S844S8T7')
driver.maximize_window()
time.sleep(60)
# text = driver.find_elements(By.XPATH,'//*[@id="root"]/div/div[2]/div[1]/div/div[1]/div[2]/div[1]/div/div/div[2]/div[2]/a').text()
text_list = []
for i in range(1,10):
    j = str(i)
    texts = driver.find_elements(By.XPATH,f'//*[@id="root"]/div/div[2]/div[1]/div/div[1]/div[2]/div['+j+']/div/div/div[2]/div[2]/a')
    for text in texts:
        text_list.append(text.text)
    
print(text_list)
time.sleep(60)
driver.quit()
