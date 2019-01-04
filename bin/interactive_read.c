#include <stdio.h>
#include <readline/readline.h>

int main(int argc, char **argv)
{
  /* if (argc != 2) */
  /*   return 1; */

  // stuff the input buffer with the default value
  /* char *def = argv[1]; */
  /* while (*def) { */
  /*   rl_stuff_char(*def); */
  /*   def++; */
  /* } */

  // let the user edit
  char *input = readline(0);
  if (!input) {
    return 1;
  }

  // write out the result to standard error
  fprintf(stderr, "%s", input);
  return 0;
}

