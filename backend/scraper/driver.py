from httpx import options
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium_stealth import stealth

def inicializar_driver():
    options = Options()
    options.add_argument("--headless") 
    options.add_argument("--disable-gpu")
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument("--window-size=1920,1080")
    
    options.add_argument('--user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36')

    driver = webdriver.Chrome(options=options)
    
    stealth(driver,
        languages=["es-ES", "es"],
        vendor="Google Inc.",
        platform="Win32",
        webgl_vendor="Intel Inc.",
        renderer="Intel Iris OpenGL Engine",
        fix_hairline=True,
    )
    
    driver.set_script_timeout(10)
    return driver