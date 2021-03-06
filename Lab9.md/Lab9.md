**МИНИСТЕРСТВО НАУКИ  И ВЫСШЕГО ОБРАЗОВАНИЯ РОССИЙСКОЙ ФЕДЕРАЦИИ  
Федеральное государственное автономное образовательное учреждение высшего образования  
"КРЫМСКИЙ ФЕДЕРАЛЬНЫЙ УНИВЕРСИТЕТ им. В. И. ВЕРНАДСКОГО"  
ФИЗИКО-ТЕХНИЧЕСКИЙ ИНСТИТУТ  
Кафедра компьютерной инженерии и моделирования
### Отчёт по лабораторной работе № 9 по дисциплине "Программирование"

студента 1 курса группы ПИ-б-о 192(2)  
Сухоплес Михаила Владимировича  
направления подготовки 09.03.04 "Програмная инжинерия"  

<table>
<tr><td>Научный руководитель<br/> старший преподаватель кафедры<br/> компьютерной инженерии и моделирования</td>
<td>(оценка)</td>
<td>Чабанов В.В.</td>
</tr>
</table>
<br/><br/>

Симферополь, 2020

**Тема:** Тестирование при помощи Google Test Framework

**Цель:** 
1)Познакомиться с Google Test и Google Mock Framework;
2) Изучить базовые понятия относящийся к тестированию кода;
3) Научиться тестировать классы в среде разработки Qt Creator.

**Подготовка «боевого» проекта:**

Скачал архив с проектом(ProjectT) . Сам проект ничего не делает, так что его можно даже не запускать.

1.Создал проект

![9 1](https://user-images.githubusercontent.com/55508481/84678369-9a4d2d80-af38-11ea-80fb-ee9613f940c6.PNG)

*Рисунок 1. создание проекта*

2.Проверил работоспособность пустого проекта двумя способами и толучил:

![9 2](https://user-images.githubusercontent.com/55508481/84678541-d08aad00-af38-11ea-985a-64c639db02df.PNG)

*Рисунок 2. Результат тестирования пустого проекта в консоли*

![9 3](https://user-images.githubusercontent.com/55508481/84678617-e9935e00-af38-11ea-8bfb-67eb7137b8e2.PNG)

*Рисунок 3. Результат тестирования пустого проекта в панели тестирования*

3.Произвел настройку и подключение проекта 

```C++

include(gtest_dependency.pri)

TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG += thread
CONFIG -= qt

HEADERS += \
        ../ProjectT/IKeypad.h \
        ../ProjectT/ILatch.h \
        ../ProjectT/lockcontroller.h \
        tst_testdivisionbyzero.h

SOURCES += \
        ../ProjectT/lockcontroller.cpp \
        main.cpp

INCLUDEPATH += E:\LabQT\ProjectT

```

4.После настройки запустил код и получил результаты:

![9 5](https://user-images.githubusercontent.com/55508481/84679455-fd8b8f80-af39-11ea-9135-8cf10eeb95c3.PNG)

*Рисунок 4. Результаты тестирования в консоли*

![9 4](https://user-images.githubusercontent.com/55508481/84679674-43e0ee80-af3a-11ea-9a60-3e6b8a64c53e.PNG)

*Рисунок 5. Результаты тестирования в панели тестирования*

Возникшая ошибка могла появится из-за наследования предыдущего метода.

Для решения ошибки можно использовать код:

```C++

DoorStatus LockController::lockDoor()
{
    return latch->close();
}

```

**Вывод:** В ходе данной лабораторной работы я ознакомился с Google Test и Google Mock Framework, научилась тестировать классы в среде разработки Qt Creator.
