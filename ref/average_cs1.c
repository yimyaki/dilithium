#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "params.h"

int main(int argc, char **argv) {
  if(argc < 2) {
    fprintf(stderr, "Usage: %s cs1_log.csv [valid|invalid|all]\n", argv[0]);
    return 1;
  }

  const char *wanted = "all";
  if(argc >= 3)
    wanted = argv[2];

  double sum[L][N] = {0};
  uint64_t count[L][N] = {0};

  FILE *f = fopen(argv[1], "r");
  if(!f) {
    perror("fopen");
    return 1;
  }

  char status[32];
  unsigned int attempt, vec, coeff;
  int value;

  while(fscanf(f, "%31[^,],%u,%u,%u,%d\n",
               status, &attempt, &vec, &coeff, &value) == 5) {

    if(vec >= L || coeff >= N)
      continue;

    if(wanted[0] != 'a') {
      int match = 1;
      for(int i = 0; wanted[i] || status[i]; i++) {
        if(wanted[i] != status[i]) {
          match = 0;
          break;
        }
      }
      if(!match)
        continue;
    }

    sum[vec][coeff] += value;
    count[vec][coeff]++;
  }

  fclose(f);

  printf("vec,coeff,average,count\n");
  for(unsigned int i = 0; i < L; i++) {
    for(unsigned int j = 0; j < N; j++) {
      double avg = count[i][j] ? sum[i][j] / count[i][j] : 0.0;
      printf("%u,%u,%.10f,%llu\n",
             i, j, avg, (unsigned long long)count[i][j]);
    }
  }

  return 0;
}