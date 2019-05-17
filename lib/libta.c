#include "triangle_area.h"


double triangle_area(int x1, int x2, int x3,int y1, int y2, int y3)
{
    double s,p,pp,a,b,c,aa;
    a = sqrt(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2)));
    b = sqrt(((x1-x3)*(x1-x3))+((y1-y3)*(y1-y3)));
    c = sqrt(((x2-x3)*(x2-x3))+((y2-y3)*(y2-y3)));
    s=sqrt(pp*(pp-a)*(pp- b )*(pp-c));
    return s; 
}
