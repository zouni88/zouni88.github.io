## extern "C" 学习记录
```C++
// A.cpp
//告诉编译器这里修饰的是C语言的代码，
extern "C" {
    //在编译阶段，不会被编译成C++这样的fun_int_int符号，即使找不到函数也不会报错
    void fun(int a,int b){
        
    }
}
```
```C++
//B.cpp
#include "A.h"
int main(){
    //对于C++来说，因为有函数重载的机制，编译后的函数会以 函数名 + 形参 来命名，
    //对于C来说，没有函数重载，不会被转成fun_int_int这样的符号
    fun(1,2); 
}
```

