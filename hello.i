%module hello

%include "hello.c"

%inline %{
// extern void hello(); // either this or the next line
#include "hello.h"
%}
