#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include "../randombytes.h"
#include "../sign.h"

#define MLEN 59
#define CTXLEN 14
#define NTESTS 5

static void print_hex(const char *label, const uint8_t *x, size_t len) {
  size_t i;
  printf("%s (%zu bytes) = ", label, len);
  for(i = 0; i < 10; i++) {
    printf("%02x", x[i]);
  }
  printf("\n");
}

int main(void)
{
  size_t i, j;
  int ret;
  size_t mlen, smlen;
  uint8_t b;
  uint8_t ctx[CTXLEN] = {0};
  uint8_t m[MLEN + CRYPTO_BYTES];
  uint8_t m2[MLEN + CRYPTO_BYTES];
  uint8_t sm[MLEN + CRYPTO_BYTES];
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];

  snprintf((char*)ctx,CTXLEN,"test_dilitium");

  for(i = 0; i < NTESTS; ++i) {
    //randombytes(m, MLEN);
    for(j = 0; j < MLEN; j++) {
      m[j] = (uint8_t)j;
    }

    crypto_sign_keypair(pk, sk);
    crypto_sign(sm, &smlen, m, MLEN, ctx, CTXLEN, sk);
    //print_hex("ctx", ctx, CTXLEN);
    //print_hex("msg", m, MLEN);
    print_hex("pk", pk, CRYPTO_PUBLICKEYBYTES);
    print_hex("sk", sk, CRYPTO_SECRETKEYBYTES);

    /* sm = signature || message, so first CRYPTO_BYTES bytes are the signature */
    //print_hex("sig", sm, CRYPTO_BYTES);
    //print_hex("signed_message", sm, smlen);
    printf("smlen = %zu\n", smlen);
    ret = crypto_sign_open(m2, &mlen, sm, smlen, ctx, CTXLEN, pk);

    printf("verify = %d\n", ret);
    printf("mlen = %zu\n", mlen);

    if(ret) {
      fprintf(stderr, "Verification failed\n");
      return -1;
    }
    if(smlen != MLEN + CRYPTO_BYTES) {
      fprintf(stderr, "Signed message lengths wrong\n");
      return -1;
    }
    if(mlen != MLEN) {
      fprintf(stderr, "Message lengths wrong\n");
      return -1;
    }
    for(j = 0; j < MLEN; ++j) {
      if(m2[j] != m[j]) {
        fprintf(stderr, "Messages don't match\n");
        return -1;
      }
    }

    randombytes((uint8_t *)&j, sizeof(j));
    do {
      randombytes(&b, 1);
    } while(!b);
    sm[j % (MLEN + CRYPTO_BYTES)] += b;
    ret = crypto_sign_open(m2, &mlen, sm, smlen, ctx, CTXLEN, pk);
    if(!ret) {
      fprintf(stderr, "Trivial forgeries possible\n");
      return -1;
    }
  }

  printf("CRYPTO_PUBLICKEYBYTES = %d\n", CRYPTO_PUBLICKEYBYTES);
  printf("CRYPTO_SECRETKEYBYTES = %d\n", CRYPTO_SECRETKEYBYTES);
  printf("CRYPTO_BYTES = %d\n", CRYPTO_BYTES);

  return 0;
}
