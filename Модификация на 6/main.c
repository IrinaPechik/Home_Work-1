#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define max_size 20

extern int Task(int array[], int size, int *B);

int main(int argc, char* argv[]) {
    int A[max_size];
    int B[max_size];
    int size_a, size_b;
    FILE *input, *output;
    int i;

    // Ввод с консоли.
    // Количество аргументов (argc) должно быть равно двум
    // т.к. в данном случаем в командной строке должно быть имя программы
    // и сам признак ввода с консоли (цифра 1).
    if (argc == 2 && atoi(argv[1]) == 1) {
        size_a = atoi(argv[1]);
        // Получение с консоли длины массива.
        printf("Input length (0 < length <= %d): ", max_size);
        scanf("%d", &size_a);
        if (size_a < 1 || size_a > max_size) {
            printf("Incorrect length = %d\n", size_a);
            return 1;
        }
        // Заполнение массива.
        for (i = 0; i < size_a; ++i) {
            printf("Enter the value of A[%d]: ", i);
            scanf("%d", A + i);
        }
        // Вызов метода записи в массив B суммы соседних элементов массива А.
        size_b = Task(A, size_a, B);
        // Вывод полученного массива В на консоль.
        printf("New array: ");
        for (int i = 0; i < size_b; ++i) {
            printf("%d ", B[i]);
        }
        printf("\n");
    }

    // Ввод из файла.
    // Количество аргументов теперь уже равно трём (т.к. читаем из файла).
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

    // Рандомный ввод.
    // Количество аргументов теперь уже равно двум.
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
        // Вызов метода записи в массив B суммы соседних элементов массива А.
        size_b = Task(A, size_a, B);
        // Вывод полученного массива В на консоль.
        printf("New array: ");
        for (int i = 0; i < size_b; ++i) {
            printf("%d ", B[i]);
        }
        printf("\n");
    }
    return 0;
}
