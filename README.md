# Индивидуальное домашние задание №1 по "АВС" на тему "Массивы и целочисленная арифметика" (на оценку 8)
Печик Ирина Юрьевна, БПИ-217, Вариант-3
# Как пользоваться программой:
### Есть три способа ввода данных:
  * __Ввод с консоли:__
     
     Ввести цифру __1__ после указания исполняемого файла
     ```
     (./program#1.exe 1)
     ```
     
  * __Ввод из файла:__
  
     Ввести цифру __2__ после указания исполняемого файла, а затем количество элементов в массиве (k)
     ```
     (./program#1.exe 2 k)
     ```
     
  * __Рандомный ввод__
  
     Ввести цифру __3__ после указания исполняемого файла
     ```
     (./program#3.exe 3)
     ```
     
# Решение на 4 балла:
### 1. Приведено решение на С:
---
* Главный файл: [main.c](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%A0%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B1%D0%B5%D0%B7%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B8/main.c)

* Файл с функцией для создания массива B [task.c](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%A0%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B1%D0%B5%D0%B7%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B8/task.c)  
---

### 2. В полученную ассемблерную программу, откомпилированную без оптимизирующих и отладочных опций, добавлены комментарии, поясняющие эквивалентное представление переменных в программе на C:

---
* Главный файл (не модифицированный): [main.s](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%A0%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B1%D0%B5%D0%B7%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B8/main.s)
* Файл с функцией для создания массива B (не модифицированный): [task.s](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%A0%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B1%D0%B5%D0%B7%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B8/task.s)
---

### 3. Из ассемблерной программы убраны лишние макросы за счет использования соответствующих аргументов командной строки:

* Из главного файла были убраны следующие строки:

```
1. Убрана строчка 50: endbr64
2. Убраны строчки 369 - 388: 
  .size	main, .-main
    # Удалить этот комент. Для модификации удаляем всё что ниже!!
    .ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
    .section	.note.GNU-stack,"",@progbits
    .section	.note.gnu.property,"a"
    .align 8
    .long	1f - 0f
    .long	4f - 1f
    .long	5
  0:
    .string	"GNU"
  1:
    .align 8
    .long	0xc0000002
    .long	3f - 2f
  2:
    .long	0x3
  3:
    .align 8
  4:

```
  Получился модифицированный главный файл: [main.s](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%204/main.s)

* Из файла с функцией для создания массива В были убраны следующие строки:
```
  1. Убрана строчка 12: endbr64
  2. Убраны строчки: 60-80
    .size	Task, .-Task
    .ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
    .section	.note.GNU-stack,"",@progbits
    .section	.note.gnu.property,"a"
    .align 8
    .long	1f - 0f
    .long	4f - 1f
    .long	5
  0:
    .string	"GNU"
  1:
    .align 8
    .long	0xc0000002
    .long	3f - 2f
  2:
    .long	0x3
  3:
    .align 8
  4:
```
  
  Получился модифицированный файл с функцией: [task.s](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%204/task.s)
  
 
### 4.  Модифицированная ассемблерная программа отдельно откомпилирована и скомпонована без использования опций отладки:

Были использованы следующие команды:

```
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./main.c \
    -S -o ./main.s
    
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./task.c \
    -S -o ./task.s
```

```
gcc ./main.s task.s -o program#2.exe

```

### 5. Представлено полное тестовое покрытие, дающее одинаковый результат на обоих программах:

Программы отработали верно на следующих тестах и выдали одинаково верные результаты:


* Тест №1

  ```
  5
  1 2 3 4 5
  ```
  Результаты работы программ идентичны: 
  ![Тест №1](https://user-images.githubusercontent.com/100044301/197404046-41d78351-456a-4cb5-afdc-0ad5d9db10ed.png)
  
* Тест №2
  
    ```
    0
    ```
    ![test2](https://user-images.githubusercontent.com/100044301/197404149-107f7e33-ea85-4343-894a-9b926bc4fe18.png)
    
* Тест №3
  
    ```
    20
    0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 10
    ```
    ![test3](https://user-images.githubusercontent.com/100044301/197404209-c93fad26-1a80-443d-86fe-f640e02e5077.png)

* Тест №4
   
    ```
    1
    6
    ```
    ![test4](https://user-images.githubusercontent.com/100044301/197404250-5b3e830d-1eec-4e07-8667-164058f8c909.png)
    
# Решение на 5 баллов:

### 1.  В реализованной программе использовать функции с передачей данных через параметры:
---

  В функции для создания массива B: [task.c](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%204/task.c)
        
  Я передавала данные через параметры следующим образом:
  
  ```
  int Task(int arr[], int length, int *B)
  ```
---

### 2.  Использовать локальные переменные:
---

* Локальные переменные в главной функции [main.c](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%204/main.c):

```
    int A[max_size];
    int B[max_size];
    int size_a, size_b;
    FILE *input, *output;
    int i;
```

* Локальные переменные в функции [task.c](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%204/task.c)

```
int k, j;
```

---

### 3.  В ассемблерную программу при вызове функции добавить комментарии, описывающие передачу фактических параметров и перенос возвращаемого результата.
---

  * Главный файл: [main.s](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%204/main.s)
  * Файл с функцией для создания массива B: [task.s](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%204/task.s)

---

### 4.  В функциях для формальных параметров добавить комментарии, описывающие связь между параметрами языка Си и регистрами (стеком).
---

  * Главный файл: [main.s](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%204/main.s)
  * Файл с функцией для создания массива B: [task.s](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%204/task.s)

---

# Решение на 6 баллов:

### 1. Рефакторинг программы на ассемблере за счет максимального использования регистров процессора. Добавление этой программы к уже представленным:

---

Были заменены все локальные переменные на регистры:

* В главной функции [main.s](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%206/main.s)

```
	# r15d size_a
	# r12d - i
	# r13d - локальная i
	# r14d - локальная-локальная i
	# r11d - size_b
	# -212[rbp] - argc
	# -224[rbp] - argv
	# -192[rbp] - B
	# -112[rbp] - A
	# -24[rbp] - input
	# -32[rbp] - output
```

* В функции для создания массива В [task.s](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%206/task.s)

```
	# r12d - j
	# r11d - k
	# -24[rbp] - arr
	# -28[rbp] - length
	# -40[rbp] - B
```

---

### 2. Добавление комментариев в разработанную программу, поясняющих эквивалентное использование регистров вместо переменных исходной программы на C:

---

* Главная функция: [main.s](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%206/main.s)

* Функция для создания массива В: [task.s](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%206/task.s)

---

### 3. Представление результатов тестовых прогонов для разработанной программы. Оценка корректности ее выполнения на основе сравнения тестовых прогонов результатами тестирования предшествующих программ:

---

Программа была успешно протестированна на следующих тестах и выдала верный результат:

* Тест №1

  ```
  5
  1 2 3 4 5
  ```
  
  ![test1](https://user-images.githubusercontent.com/100044301/197406370-bd0efd6c-3f0a-437c-83fc-58500e266884.png)

  
* Тест №2
  
    ```
    0
    ```
    ![test2](https://user-images.githubusercontent.com/100044301/197406383-01c79a7c-b7b3-412e-95c3-fba736741f38.png)

    
* Тест №3
  
    ```
    20
    0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 10
    ```
    ![test3](https://user-images.githubusercontent.com/100044301/197406395-a6d49cd9-2d6e-4873-9291-b4b79f954c92.png)


* Тест №4
   
    ```
    1
    6
    ```
    ![test4](https://user-images.githubusercontent.com/100044301/197406403-50dcef3b-0915-49c6-b503-4fe18c6c9303.png)

---

# Решение на 7 баллов:

### 1.  Реализация программы на ассемблере, полученной после рефакторинга, в виде двух или более единиц компиляции.
---
Две единицы компиляции:
    
* Главная функция: [main.s](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%206/main.s)

* Функция для создания массива В: [task.s](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%206/task.s)
---

### 2. Задание файлов с исходными данными и файла для вывода результатов с использованием аргументов командной строки.
---
* Главная функция: [main.с](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%206/main.c)

Добавили в main: 
```
 else if (argc == 3 && atoi(argv[1]) == 2) {
        size_a = atoi(argv[2]);
        if (size_a < 1 || size_a > max_size) {
            printf("Incorrect length = %d\n", size_a);
            return 1;
        }
        // Открываем файл для чтения (файл должен существовать).
        input = fopen("input.txt", "r");
        // Читаем из файла массив А.
        for (i = 0; i < size_a; ++i) {
            fscanf(input, "%d", A + i);
        }
        // Вызов метода записи в массив B суммы соседних элементов массива А.
        size_b = Task(A, size_a, B);
        // Записываем в файл теперь массив В.
        output = fopen("output.txt", "w");
        for (i = 0; i < size_b; ++i) {
            fprintf(output, "%d ", B[i]);
        }
        printf("New array in file 'output.txt'\n");
    }
```

* Функция для создания массива В: [task.с](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%206/task.c)

#### Прогон на тестах:
![test1](https://user-images.githubusercontent.com/100044301/197407156-a97c590f-2811-43ef-ac0a-5483fab5d46f.png)
![test2](https://user-images.githubusercontent.com/100044301/197407162-d457a5d8-0f71-44b5-9e5e-48a6d6a6c28b.png)
![test3](https://user-images.githubusercontent.com/100044301/197407163-a3da5953-9840-4ffb-a666-b4023a4ae818.png)

---


# Решение на 8 баллов:

### 1. Добавление в программу генератора случайных наборов данных, расширяющих возможности тестирования. Подключение генератора к программе с выбором в командной строке варианта ввода данных:
---
* Главная функция: [main.с](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%206/main.c)
Добавили в main: 
```
    else if (argc == 2 && atoi(argv[1]) == 3) {
        size_a = atoi(argv[1]);
        srand(time(NULL));
        size_a = 0;
        // Генерация длины массива А.
        while (size_a < 1 || size_a > max_size) {
            size_a = rand();
        }
        // Рандомное заполнение массива А.
        for (i = 0; i < size_a; ++i) {
            A[i] = rand();
            if (A[i] % 4 == 0) {
                A[i] *= 1;
            }
        }
        printf("Randomized length of array A = %d \n", size_a);
        printf("Randomized values of array A: ");
        for (i = 0; i < size_a; ++i) {
            printf("%d ", A[i]);
        }
        printf("\n");
```

* Функция для создания массива В: [task.с](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%206/task.c)

Корректно пройдено тестирование:
![Снимок1](https://user-images.githubusercontent.com/100044301/197407676-741b3b2c-dbc6-46ca-9b8c-9bd73db8cc3b.JPG)
![Снимок3](https://user-images.githubusercontent.com/100044301/197407681-c3726bed-8614-4454-9d8f-112d0d931917.JPG)
![Снимок 4JPG](https://user-images.githubusercontent.com/100044301/197407684-6cc2e4cd-6e22-4d65-bd63-1a7d7ad6bc8c.JPG)

---

### 2.  Расширение анализа командной строки для выбора способа порождения исходных данных. Добавление данных, порождаемых генератором.
---
Главная функция: [main.с](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%206/main.c)

Функция для создания массива В: [task.с](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%206/task.c)
* __Ввод с консоли:__
     
     Ввести цифру __1__ после указания исполняемого файла
     
     ```
     if (argc == 2 && atoi(argv[1]) == 1) {
        size_a = atoi(argv[1]);
     }
     ```
     
     
 * __Ввод из файла:__
  
     Ввести цифру __2__ после указания исполняемого файла, а затем количество элементов в массиве
     
     ```
     else if (argc == 3 && atoi(argv[1]) == 2) {
        size_a = atoi(argv[2]);
     }
     ```
     
     
* __Рандомный ввод__
  
     Ввести цифру __3__ после указания исполняемого файла
     
     ```
     else if (argc == 2 && atoi(argv[1]) == 3) {
        size_a = atoi(argv[1]);
     }
     ```     
---

### 3.  Добавить замеры во времени, которые не учитывают время ввода и вывода данных.
---

* Добавлены замеры
Главная функция: [main.с](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%208/main.c)
Функция для создания массива В: [task.с](https://github.com/IrinaPechik/Home_Work-1/blob/main/%D0%9C%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BD%D0%B0%208/task.c)


```
time_t begin =  clock();
        for (i = 0; i < 2000000; ++i) {
            // Вызов метода для извлечения из А положительных элементов в B
            size_b = Task(A, size_a, B);
        }
        time_t end = clock();
        printf("\n%f миллисекунд\n", difftime(end, begin));
```
* Проведя замеры, было замечено, что модифицированная программа работает примерно в полтора раза быстрее.

до

![Снимок1](https://user-images.githubusercontent.com/100044301/197409865-6bbe811e-fd7a-4238-8abe-9856925cc4f7.JPG)

после

![Снимок2](https://user-images.githubusercontent.com/100044301/197409872-cdd2753b-b86e-42ba-9e9c-ad0d2f935710.JPG)

---

