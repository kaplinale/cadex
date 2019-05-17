#include <stdio.h>
#include <math.h>
#include "triangle_area.h"

#define PROG_NAME "ta"

void usage()
{
    fprintf(stderr, "USAGE: %s x1 x2 x3 y1 y2 y3\n", PROG_NAME);
}

int main(int argc, char **argv)
{
    int x1 = 0;
    int x2 = 0;
    int x3 = 0;
    
    int y1 = 0;
    int y2 = 0;
    int y3 = 0;
    
    //checking command line
    if((argc == 1) || 
        (argc < 7) || 
         argc > 7) {
        usage();
        return 1;
    }
    
    //Getting positional pagameters
    x1 = atoi(argv[1]);
    x2 = atoi(argv[2]);
    x3 = atoi(argv[3]);
    
    y1 = atoi(argv[4]);
    y2 = atoi(argv[5]);
    y3 = atoi(argv[6]);
    
    fprintf(stderr, "Area of triange is %lf\n", triangle_area(x1, x2, x3,y1,y2,y3));
    return 0;
}
