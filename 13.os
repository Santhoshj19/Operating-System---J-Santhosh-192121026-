#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_EMPLOYEES 100
#define MAX_NAME_LENGTH 50
#define FILENAME "employees.dat"

struct Employee {
    int id;
    char name[MAX_NAME_LENGTH];
    float salary;
};

void addEmployee(FILE *file) {
    struct Employee emp;
    printf("Enter employee ID: ");
    scanf("%d", &emp.id);
    printf("Enter employee name: ");
    scanf("%s", emp.name);
    printf("Enter employee salary: ");
    scanf("%f", &emp.salary);

    fseek(file, (emp.id - 1) * sizeof(struct Employee), SEEK_SET);
    fwrite(&emp, sizeof(struct Employee), 1, file);
}

void displayEmployee(FILE *file, int id) {
    struct Employee emp;
    fseek(file, (id - 1) * sizeof(struct Employee), SEEK_SET);
    fread(&emp, sizeof(struct Employee), 1, file);
    printf("Employee ID: %d\n", emp.id);
    printf("Employee Name: %s\n", emp.name);
    printf("Employee Salary: %.2f\n", emp.salary);
}

int main() {
    FILE *file = fopen(FILENAME, "r+");
    if (file == NULL) {
        file = fopen(FILENAME, "w+");
        if (file == NULL) {
            printf("Error opening file.\n");
            exit(1);
        }
    }

    int choice;
    do {
        printf("\n1. Add Employee\n");
        printf("2. Display Employee\n");
        printf("3. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch(choice) {
            case 1:
                addEmployee(file);
                break;
            case 2:
                printf("Enter employee ID: ");
                int id;
                scanf("%d", &id);
                displayEmployee(file, id);
                break;
            case 3:
                printf("Exiting program.\n");
                break;
            default:
                printf("Invalid choice. Please try again.\n");
        }
    } while(choice != 3);

    fclose(file);
    return 0;
}