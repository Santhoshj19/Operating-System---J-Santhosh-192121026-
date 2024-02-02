#include <stdio.h>
#include <stdlib.h>

void SCAN(int arr[], int head, int size, int direction) {
    int total_seek_time = 0;
    int current = head;
    int visited[size];
    int i, j;
    
    for (i = 0; i < size; i++) {
        visited[i] = 0;
    }
    
    printf("Seek Sequence: ");
    
    if (direction == 1) { // Moving towards the positive direction
        while (1) {
            int min_seek_time = INT_MAX;
            int next_index = -1;
            
            for (i = 0; i < size; i++) {
                if (!visited[i] && abs(arr[i] - current) < min_seek_time && arr[i] >= current) {
                    min_seek_time = abs(arr[i] - current);
                    next_index = i;
                }
            }
            
            if (next_index == -1) {
                break;
            }
            
            visited[next_index] = 1;
            printf("%d ", arr[next_index]);
            total_seek_time += min_seek_time;
            current = arr[next_index];
        }
        
        total_seek_time += abs(current - 0);
        printf("0 ");
        
        current = 0;
        
        while (1) {
            int min_seek_time = INT_MAX;
            int next_index = -1;
            
            for (i = 0; i < size; i++) {
                if (!visited[i] && abs(arr[i] - current) < min_seek_time && arr[i] <= current) {
                    min_seek_time = abs(arr[i] - current);
                    next_index = i;
                }
            }
            
            if (next_index == -1) {
                break;
            }
            
            visited[next_index] = 1;
            printf("%d ", arr[next_index]);
            total_seek_time += min_seek_time;
            current = arr[next_index];
        }
    } else { // Moving towards the negative direction
        while (1) {
            int min_seek_time = INT_MAX;
            int next_index = -1;
            
            for (i = 0; i < size; i++) {
                if (!visited[i] && abs(arr[i] - current) < min_seek_time && arr[i] <= current) {
                    min_seek_time = abs(arr[i] - current);
                    next_index = i;
                }
            }
            
            if (next_index == -1) {
                break;
            }
            
            visited[next_index] = 1;
            printf("%d ", arr[next_index]);
            total_seek_time += min_seek_time;
            current = arr[next_index];
        }
        
        total_seek_time += abs(current - 0);
        printf("0 ");
        
        current = 0;
        
        while (1) {
            int min_seek_time = INT_MAX;
            int next_index = -1;
            
            for (i = 0; i < size; i++) {
                if (!visited[i] && abs(arr[i] - current) < min_seek_time && arr[i] >= current) {
                    min_seek_time = abs(arr[i] - current);
                    next_index = i;
                }
            }
            
            if (next_index == -1) {
                break;
            }
            
            visited[next_index] = 1;
            printf("%d ", arr[next_index]);
            total_seek_time += min_seek_time;
            current = arr[next_index];
        }
    }
    
    printf("\nTotal Seek Time: %d\n", total_seek_time);
}

int main() {
    int n, head, direction;
    
    printf("Enter the number of requests: ");
    scanf("%d", &n);
    
    int requests[n];
    
    printf("Enter the requests: ");
    for (int i = 0; i < n; i++) {
        scanf("%d", &requests[i]);
    }
    
    printf("Enter the initial head position: ");
    scanf("%d", &head);
    
    printf("Enter the direction (1 for towards positive direction, 0 for towards negative direction): ");
    scanf("%d", &direction);
    
    SCAN(requests, head, n, direction);
    
    return 0;
}