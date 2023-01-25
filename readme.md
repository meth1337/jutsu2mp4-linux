<div align="center">
<img src="/img/rengoku.png"></img>
<h1>jutsu2mp4 (linux)</h1>
скрипт для скачивания эпизодов с <a href="https://jut.su">jutsu</a>. написан на <a href="https://www.gnu.org/software/bash/">bash</a>'е (предустановлен в линуксе.)
</div>

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

## установка
перед клонированиtм репозитория следует установить все необходимые зависимости:
```
sudo apt install -y coreutils git 
```
после этого, выполните следующие комманды:
```
git clone https://github.com/meth1337/jutsu2mp4-linux
cd jutsu2mp4-linux
chmod +x jutsu2mp4
./jutsu2mp4 -опция
```
поздравляю! вы установили jutsu2mp4, приятного использования<3

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

    driver = webdriver.Firefox()  # вместо firefox'а можно использовать другие браузеры. список: Chrome, Edge, Firefox, 
                                  # IE, Safari
    driver.get(url)

    file = open("tmp.html", "w")
    file.write(driver.page_source)
    file.close()

    driver.quit()
    display.stop()
except:
    print(exc_info())
```
