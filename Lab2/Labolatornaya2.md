МИНИСТЕРСТВО НАУКИ  И ВЫСШЕГО ОБРАЗОВАНИЯ РОССИЙСКОЙ ФЕДЕРАЦИИ  
Федеральное государственное автономное образовательное учреждение высшего образования  
"КРЫМСКИЙ ФЕДЕРАЛЬНЫЙ УНИВЕРСИТЕТ им. В. И. ВЕРНАДСКОГО"  
ФИЗИКО-ТЕХНИЧЕСКИЙ ИНСТИТУТ  
Кафедра компьютерной инженерии и моделирования
### Отчёт по лабораторной работе № 2 по дисциплине "Программирование"

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
Симферополь, 2019

**Тема**:Табулирование кусочно-заданной функцииж

**Цель**:

1.Овладеть практическими навыками разработки и программирования вычислительного процесса циклической структуры;

2.Сформировать навыков программирования алгоритмов разветвляющейся структуры;

3.Изучить операторы ветвления. Особенности использования полной и сокращенной формы оператора if и тернарного оператора.

**Постановка задачи**:

Напишите на языке С++ программу которая для функции f(x) на интервале x ∈ [Xнач; Xкон]:

Выводит в консоль значения функции f(x) с шагом dx;
Определяет максимальное и минимальное значение функции.

Значения параметров a, b, начала и конца интервала Xнач, Xкон и шага dx вводятся пользователем.

Для соответствующей функции выполните следующие действия:

1.Протабулируйте функцию и запишите получившиеся реультаты в отчёт в виде таблицы. При этом a = 0.7, b = 1.2, начала и конца интервала Xнач = 0.5, Xкон = 1.5 и шага dx = 0.05;

2.Определите минимальное и максимальное значение функции на указанном интервале.

-постройте график функции;

-добавьте на график точки, которые у вас получились в процессе табуляции;

-добавьте на график точки минимума и максимума с метками значений;

![лб2 2](https://user-images.githubusercontent.com/55508481/73286332-73e85900-4208-11ea-946f-357dc33b26ea.PNG)

*Рисунок 1. Функция*

При ручном вводе данных код лдя данной функции будет выглядеть таки образом:

```C++
#include <iostream>
#include <math.h>
#include <stdio.h>
using namespace std;
int main() {
	double x1, x2, dx, a, b, z;
	cout << "enter the data: xmin = ";
	cin >> x1;
	cout << "\nxmax = ";
	cin >> x2;
	cout << "\ndx = ";
	cin >> dx;
	cout << "\na = ";
	cin >> a;
	cout << "\nb = ";
	cin >> b;
	for (double x1 = x1; x1 <= x2; x1 += dx) {

		if (x1 < a && abs(x1 - a) < 1e-9) { z = log(x1); }

		else if (a < x1 && x1 < b) { z = 1; }

		else if (x1 >= b) { z = exp(x1); }

		cout << "\nx = " << x1;
		cout << "\nz = " << z;
	}
}
```
Код с данными параметрами в задичи будет выглядеть таки обрзом:

```C++
#include <iostream>
#include <math.h>
#include <stdio.h>
using namespace std;
int main()
{
	double x, a, b, z;
	a = 0.7;
	b = 1.2;
	for (double x = 0.5; x <= 1.5; x += 0.05)
	{
		x = round(x * 100) / 100;
		if (x <= a)
		{
			z = log(x);
		}
		else if (x > a && x < b)
		{
			z = 1;
		}
		else if (x >= b)
		{
			z = exp(x);
		}
		cout << "\nx = " << x;
		cout << "\nz = " << z;
	}
}
```
|x|0.5|0.55|0.6|0.65|0.7|0.75|0.8|0.85|0.9|0.95|1|1.05|1.1|1.15|1.2|1.25|1.3|1.35|1.4|1.45|1.5
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
|z|-0.693|-0.5978|-0.511| -0.431|-0.356|1|1|1|1|1|1|1|1|1|3.320|3.490|3.669|3.857|4.055|4.263|4.482


![лб2](https://user-images.githubusercontent.com/55508481/73286385-88c4ec80-4208-11ea-82da-f87f03f5a225.PNG)

*Рисунок 2. График функции*

**Вывод**:В ходе выполнения данной лабораторной работы я смог овладеть практическими навыками разработки и программирования вычислительного процесса циклической структуры; также сформировал некоторые навыки программирования алгоритмов разветвляющейся структуры; изучил операторы ветвления.
