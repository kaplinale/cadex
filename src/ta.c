#include <stdio.h>
#include <math.h>
#include "triangle_area.h"

#define PROG_NAME "ta"

void usage()
{
    fprintf(stderr, "USAGE: %s b h\nwhere b - the basis of triangle, h - it's height.\n", PROG_NAME);
}

int main(int argc, char **argv)
{
    double b;
    double h;
    
    //checking command line
    if((argc == 1) || 
        (argc < 3) || 
         argc > 3) {
        usage();
        return 1;
    }
    
    //Getting positional pagameters
    //b = atan(argv[1]);
    //h = atan(argv[2]);
    
    sscanf(argv[1], "%lf", &b);
    sscanf(argv[2], "%lf", &h);
    
    fprintf(stderr, "Area of triange is %3.2lf\n", triangle_area(b,h));
    return 0;
}
