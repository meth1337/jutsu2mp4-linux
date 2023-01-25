# jutsu2mp4
скрипт для скачивания эпизодов с [jutsu](https://jut.su). 

## использование
```
-jutsu2mp4- v0.0.0

использование: jutsu2mp4 -опция / --опции
все опции:

-h / --help: показать это сообщение
-d / --download: сгенерировать ссылку на скачивание эпизода
-s / --status: проверить статус jut.su
```
пример: `./jutsu2mp4 -d`

## кастомный вебдрайвер под другой браузер
вебдрайвера написаны на python'е и скомплированны [pyinstaller](https://github.com/pyinstaller/pyinstaller)'ом
```python
try:
    from selenium import webdriver
    from sys import argv
    from sys import exc_info
    from pyvirtualdisplay import Display

    url = argv[1]

    display = Display(visible=0, size=(800, 600))
    display.start()

    driver = webdriver.Firefox()
        
    driver.get(url)

    file = open("tmp.html", "w")
    file.write(driver.page_source)
    file.close()

    driver.quit()
    display.stop()
except:
    print(exc_info())
```
