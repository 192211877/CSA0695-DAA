
#include <stdio.h>
#include <limits.h>
#define MAX_CITIES 10
int n;
int dist[MAX_CITIES][MAX_CITIES]; 
int dp[MAX_CITIES][1 << MAX_CITIES];
int tsp(int current, int mask) {
    if (mask == (1 << n) - 1) {
        return dist[current][0];
    }
    if (dp[current][mask] != -1) {
        return dp[current][mask];
    }
    int min_cost = INT_MAX;
    for (int next = 0; next < n; next++) {
        if ((mask & (1 << next)) == 0) { 
            int cost = dist[current][next] + tsp(next, mask | (1 << next));
            if (cost < min_cost) {
                min_cost = cost;
            }
        }
    }
    dp[current][mask] = min_cost;
    return min_cost;
}
int main() {
    printf("A.madhuri--192211877");
    printf("Enter the number of cities (maximum %d): ", MAX_CITIES);
    scanf("%d", &n);
    printf("Enter the distance matrix (%d x %d):\n", n, n);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%d", &dist[i][j]);
        }
    }
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < (1 << n); j++) {
            dp[i][j] = -1;
        }
    }
    int min_cost = tsp(0, 1);
    printf("Minimum cost of the tour: %d\n", min_cost);
    return 0;
}
