**МИНИСТЕРСТВО НАУКИ  И ВЫСШЕГО ОБРАЗОВАНИЯ РОССИЙСКОЙ ФЕДЕРАЦИИ  
Федеральное государственное автономное образовательное учреждение высшего образования  
"КРЫМСКИЙ ФЕДЕРАЛЬНЫЙ УНИВЕРСИТЕТ им. В. И. ВЕРНАДСКОГО"  
ФИЗИКО-ТЕХНИЧЕСКИЙ ИНСТИТУТ  
Кафедра компьютерной инженерии и моделирования
### Отчёт по лабораторной работе № 6 по дисциплине "Программирование"

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

**Тема:** Погодный информер

**Цель:** 
1) Закрепить навыки разработки многофайловыx приложений;
2) Изучить способы работы с API web-сервиса;
3) Изучить процесс сериализации/десериализации данных.

**Ход работы:**
1. Создал код сервера, с связью файлов.

```C++
#include <nlohmann/json.hpp>
#include <httplib/httplib.h>
#include "wether.h"

using json = nlohmann::json;

void replace(std::string& str, const std::string& from, const std::string& to)
{
	size_t start_pos = str.find(from);
	if (start_pos == std::string::npos) {
		return;
	}
	str.replace(start_pos, from.length(), to);
}

void gen_response(const httplib::Request& req, httplib::Response& res)
{
	std::string s;
	httplib::Client cli("api.openweathermap.org", 80);
	auto result = cli.Get("/data/2.5/forecast?id=693805&APPID=f667e74ab3ce8dccbb1b8420b2ec6546&units=metric");
	json j = json::parse(result->body);
	std::cout << j.at("city").at("name") << std::endl;
	int start = j.at("list")[0].at("dt");

	std::ifstream ifs("Weather.html");
	getline(ifs, s, '\0');
	ifs.close();
	replace(s, "{city.name}", j.at("city").at("name"));
	for (auto& el : j.at("list").items())
	{
		if (el.value().at("dt") >= start)
		{
			replace(s, "{list.dt}", el.value().at("dt_txt"));
			replace(s, "{list.weather.icon}", el.value().at("weather")[0].at("icon"));
			replace(s, "{list.main.temp}", to_string(el.value().at("main").at("temp")));
			start += 86400;
		}
	}
	res.set_content(s, "text/html");
}

int main()
{
	std::cout << "SERVER RUN!" << std::endl;
	httplib::Server svr; //Создаём сервер
	svr.Get("/", gen_response);
	svr.listen("localhost", 3000); //localhost 
}
```
2. API key f667e74ab3ce8dccbb1b8420b2ec6546  для получения информации.
3. Полученная информация:

![6 1](https://user-images.githubusercontent.com/55508481/84675922-8fdd6480-af35-11ea-8612-fba788583bef.png)

*Рисунок 1. Информация о погоде*

**Вывод:** В ходе выполнения лабораторной работы я закрепил навыки работы с языком програмирования C++ и научился создавать слушающие сервера.
