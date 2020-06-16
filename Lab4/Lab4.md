МИНИСТЕРСТВО НАУКИ  И ВЫСШЕГО ОБРАЗОВАНИЯ РОССИЙСКОЙ ФЕДЕРАЦИИ  
Федеральное государственное автономное образовательное учреждение высшего образования  
"КРЫМСКИЙ ФЕДЕРАЛЬНЫЙ УНИВЕРСИТЕТ им. В. И. ВЕРНАДСКОГО"  
ФИЗИКО-ТЕХНИЧЕСКИЙ ИНСТИТУТ  
Кафедра компьютерной инженерии и моделирования
### Отчёт по лабораторной работе № 4 по дисциплине "Программирование"

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

**Тема:** Иксики-нолики

**Цель:** 
1) Закрепить навыки работы с перечислениями;

2) Закрепить навыки работы с структурами;

3) Освоить методы составления многофайловых программ.

## Создал три файла: ##

1.Файл первый [KandNgame.cpp](https://github.com/MitcherSuchoples/LabolatorkiProg/blob/master/Lab4/KandNgame.cpp), реализующий игру «Иксики-нолики» используя функции  в вспомогательном файле:

```C++

#include <iostream>
#include <ctime>
#include "KandNgame.h"


Game initGame(char userChar)
{
	srand(time(NULL));
	Game new_game;
	for (int i = 0; i < 3; i++)
		for (int j = 0; j < 3; j++)
			new_game.board[i][j] = ' ';
	new_game.isUserTurn = bool(rand() % 2);
	new_game.userChar = userChar;
	new_game.status = PLAY;
	switch (new_game.userChar)
	{
	case '0': new_game.botChar = 'X'; break;
	case 'X': new_game.botChar = '0'; break;
	}
	return new_game;
}

void updateDisplay(const Game game)
{
	system("cls");

	std::cout << "\ta\tb\tc\n1\t" << game.board[0][0] << "\t" << game.board[0][1] << "\t" << game.board[0][2] <<
		"\n2\t" << game.board[1][0] << "\t" << game.board[1][1] << "\t" << game.board[1][2] <<
		"\n3\t" << game.board[2][0] << "\t" << game.board[2][1] << "\t" << game.board[2][2] << "\n";

	return;
}

void botTurn(Game* game)
{
	short num_X = 0, num_Y = 0, j2 = 0;

	for (int i = 0; i < 3; i++)
		for (int j = 0; j < 3; j++)
			if (game->board[i][j] != ' ')
				j2++;
	if (j2 == 0)
	{
		game->board[1][1] = game->botChar;
		return;
	}

	j2 = 0;

	for (short i = 0; i < 3; i++)
	{
		if (game->board[i][i] == game->userChar)
			num_X++;
		if (game->board[i][i] == ' ')
		{
			num_Y++;
			j2 = i;
		}
	}
	if ((num_X == 2) && (num_Y == 1))
	{
		game->board[j2][j2] = game->botChar;
		return;
	}

	num_X = 0;
	num_Y = 0;
	for (short i = 0; i < 3; i++)
	{
		if (game->board[i][2 - i] == game->userChar)
			num_X++;
		if (game->board[i][2 - i] == ' ')
		{
			num_Y++;
			j2 = i;
		}
	}
	if ((num_X == 2) && (num_Y == 1))
	{
		game->board[j2][2 - j2] = game->botChar;
		return;
	}


	for (short i = 0; i < 3; i++)
	{
		num_X = 0;
		num_Y = 0;

		for (short j = 0; j < 3; j++)
		{
			j2 = j;

			if (game->board[i][j] == game->userChar)
			{
				num_X++;
				if (num_X == 2)
				{
					j = 2;

					while (j >= 0)
					{
						if (game->board[i][j] == ' ')
						{
							game->board[i][j] = game->botChar;
							return;
						}

						j--;
					}
				}
				j = j2;
			}

			if (game->board[j][i] == game->userChar)
			{
				num_Y++;
				if (num_Y == 2)
				{
					j = 2;

					while (j >= 0)
					{
						if (game->board[j][i] == ' ')
						{
							game->board[j][i] = game->botChar;
							return;
						}

						j--;
					}
				}
				j = j2;
			}


		}
	}


	do
	{
		num_X = rand() % 3;
		num_Y = rand() % 3;

		if (game->board[num_X][num_Y] == ' ')
		{
			game->board[num_X][num_Y] = game->botChar;
			return;
		}

	} while (true);

}

void userTurn(Game* game)
{
	char a;
	short b;

	bool wrong = 1;

	std::cout << "координата x (a,b,c), координата y (1,2,3) ";
	do
	{
		std::cin >> a >> b;

		switch (a)
		{
		case 'a': a = 0;
			break;
		case 'b': a = 1;
			break;
		case 'c': a = 2;
			break;
		default:
			std::cout << "wrong a\n";
			break;
		}

		switch (b)
		{
		case 1: b--;
			break;
		case 2: b--;
			break;
		case 3: b--;
			break;
		default:
			std::cout << "wrong b\n";
			break;
		}


		if (game->board[b][a] == ' ')
			wrong = 0;
		else
			std::cout << "wrong place!\n";


	} while (wrong);

	game->board[b][a] = game->userChar;

}

bool updateGame(Game* game)
{
	for (short i = 0; i < 3; i++)
	{
		if (game->board[i][0] == 'x' || game->board[i][0] == '0')
		{
			if ((game->board[i][1] == game->board[i][0]) && (game->board[i][2] == game->board[i][0]))
			{
				if (game->board[i][0] == game->userChar)
					game->status = USER_WIN;
				else
					game->status = BOT_WIN;
				return true;
			}
		}


		if (game->board[0][i] == 'x' || game->board[0][i] == '0')
		{
			if ((game->board[1][i] == game->board[0][i]) && (game->board[2][i] == game->board[0][i]))
			{
				if (game->board[0][i] == game->userChar)
					game->status = USER_WIN;
				else
					game->status = BOT_WIN;
				return true;
			}
		}
	}

	if (game->board[0][0] == 'x' || game->board[0][0] == '0')
	{
		if ((game->board[1][1] == game->board[0][0]) && (game->board[2][2] == game->board[0][0]))
		{
			if (game->board[2][2] == game->userChar)
				game->status = USER_WIN;
			else
				game->status = BOT_WIN;
			return true;
		}
	}

	if (game->board[2][0] == 'x' || game->board[2][0] == '0')
	{
		if ((game->board[1][1] == game->board[0][2]) && (game->board[1][1] == game->board[2][0]))
		{
			if (game->board[1][1] == game->userChar)
				game->status = USER_WIN;
			else
				game->status = BOT_WIN;
			return true;
		}
	}



	bool draw = 1;
	for (short i = 0; i < 3; i++)
	{
		for (short j = 0; j < 3; j++)
			if (game->board[i][j] == ' ')
				draw = 0;
	}
	if (draw)
	{
		game->status = NOT_WIN;
		return true;
	}

	game->isUserTurn = !game->isUserTurn;
	return false;
}
```

2. Второй файл [main.cpp](https://github.com/MitcherSuchoples/LabolatorkiProg/blob/master/Lab4/main.cpp), вспомогательный. Содержит основные функции 

```C++

#include <iostream>
#include "KandNgame.h"
using namespace std;
int main()
{
    setlocale(LC_ALL, "ru"); int sum = 0;
    char pChar;
    do {
        cout << "Выберите Х или 0: ";
        cin >> pChar;
    } while (pChar != 'X' && pChar != '0');
    Game mainGame = initGame(pChar);
    while (!updateGame(&mainGame))
    {
        if (mainGame.isUserTurn)userTurn(&mainGame);
        else botTurn(&mainGame);
        updateDisplay(mainGame);
    }
    if (mainGame.status == USER_WIN)std::cout << "Вы победили!";
    else if (mainGame.status == BOT_WIN)std::cout << "Вы проиграли!";
    else std::cout << "Ничья!";
}

```

3. Третий файл, связующий.

```C++
#pragma once

enum Status
{
	PLAY,           
	USER_WIN,       
	BOT_WIN,         
	NOT_WIN         
};

struct Game
{
	char board[3][3];  
	bool isUserTurn; 
	char userChar;   
	char botChar;     
	Status status;
};

Game initGame(char userChar);

void updateDisplay(const Game game);
void botTurn(Game* game);
void userTurn(Game* game);
bool updateGame(Game* game);

```

Сама игра выглядит следующим образом:

![4 1](https://user-images.githubusercontent.com/55508481/84669394-7afcd300-af2d-11ea-8a66-e4a0887301c8.png)

*Рисунок 1. Вид игры*

**Вывод:** В ходе выполнения данной лабораторной работы я приобрел навыки работы с многофайловыми программами.
