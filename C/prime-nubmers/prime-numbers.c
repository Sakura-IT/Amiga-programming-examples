#include <stdio.h>

int
main(int argc, char *argv[])
{
	int number, i, modulo, counter, square;

	number = 0;
	counter = 0;

	printf("Prime numbers:\n");

	while(1) {
		number++;

		for(i = 1; i <= number; i = i+1) {
			modulo = number % i;
			if(modulo == 0)
				counter++;
		}

		if(counter == 2)
			printf("%d\n", number);
		
		counter = 0;
	}

	return(0);
}

