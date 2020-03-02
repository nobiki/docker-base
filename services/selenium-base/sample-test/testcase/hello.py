import os
import time
import uuid

from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

# this is sample program
grid_host = os.environ.get('GRID_HOST')
buildtag = str(uuid.uuid1())
print("BUILDTAG: "+buildtag)

browser=DesiredCapabilities.CHROME

option = webdriver.ChromeOptions()
option.add_argument("--disable-dev-shm-usage");
option.add_argument("--no-sandbox");
option.add_argument("disable-infobars")

driver = webdriver.Remote(
    options=option,
    command_executor='http://'+grid_host+'/wd/hub',
    desired_capabilities=browser)
driver.get("https://example.com")
driver.save_screenshot("/output/"+buildtag+".png")

driver.close()
driver.quit()
