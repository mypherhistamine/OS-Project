void main() {
  int n, m, i, j, k;
  n = 5; // Number of processes
  m = 3; // Number of resources
  List alloc = [
    [0, 1, 0], // P0 // Allocation Matrix
    [2, 0, 0], // P1
    [3, 0, 2], // P2
    [2, 1, 1], // P3
    [0, 0, 2]
  ]; // P4

  List max = [
    [7, 5, 3],
    [3, 2, 2], // P1
    [9, 0, 2], // P2
    [2, 2, 2], // P3
    [4, 3, 3]
  ]; // P4

  List avail = [3, 3, 2]; // Available Resources

  List f;
  List ans;
  var ind = 0;

  for (k = 0; k < n; k++) {
    f[k] = 0;
  }

  List need;

  for (i = 0; i < n; i++) {
    for (j = 0; j < m; j++) need[i][j] = max[i][j] - alloc[i][j];
  }
  int y = 0;
  for (k = 0; k < 5; k++) {
    for (i = 0; i < n; i++) {
      if (f[i] == 0) {
        int flag = 0;
        for (j = 0; j < m; j++) {
          if (need[i][j] > avail[j]) {
            flag = 1;
            break;
          }
        }

        if (flag == 0) {
          ans[ind++] = i;
          for (y = 0; y < m; y++) avail[y] += alloc[i][y];
          f[i] = 1;
        }
      }
    }
  }

  print('Following is the safe seq\n');

  for (i = 0; i < n - 1; i++) {
    print("P ${ans[i]} ->");
  }

  print("P:  ${ans[n - 1]}\n");

  // cout << " P" << ans[n - 1] << endl;
}

// This code is contributed by SHUBHAMSINGH10
