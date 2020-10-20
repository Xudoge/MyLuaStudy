
function printHead(arg1)
    print("\n"..arg1.."\n")
    
end

printHead("----------------------------Lua基本语法--------------------------------")

print("Hello World！")


-- 单行注释

--[[] 多行
    注释 ]]--

printHead("----------------------------Lua数据类型--------------------------------")

function printType(arg1)
    print("变量值为",type(arg1))
end

a=-1
a=1e-1 
a=0.1e-1  --number 双精度
printType(a)

a="1"  --string 字符串
printType(a)
print(#a)    --# 用于计算长度

a=nil --nil 无效值 类似于C++的NULL
printType(a)
print(a=="nil") --Nil的判断需要 + 引号

a=true   --boolean值
printType(a)

--函数类型
printType(printType)

--thread 线程

printHead("----------------------------Lua变量--------------------------------")

--全局变量
_xuzhe=1
print(_xuzhe)

--函数
function test()

    local a=1 --局部变量
    b=5 --全局变量

    --多值赋值是 右边a为值传递
    a,b=a+1,a+1   -- a，b= 1+1,1+!

    print("变量存在：",a,b) 
end

--局部变量和全局变量的不同
test()
print("变量存在：",a,b)  --未被初始化的值为nil

--数值swap
swap_a=2
swap_b=3
swap_b,swap_a=swap_a,swap_b  --等同于 函数swap(a,b)

--引索
  table_a={ "a","b","c",["key"]="table" }   --不设置key的默认为int
  table_a["key"]="value"
  print(table_a["key"])


printHead("----------------------------Lua循环--------------------------------")

x=true
while x do    --为false 停止循环
    print("while 循环中")
    x=false
end

   
i=0
for i=1,10 do
    print(i)
    if i%2==1 then
        goto label   --goto 移动到标记点 直接跳出循环   
    end
end

::label::  --goto 标记点
i=11
print(i)

repeat
    print("repeat 循环中")
    x=true
until x      --为true时停止循环

printHead("----------------------------Lua流程控制--------------------------------")

x=0
if x==0 then
    print("Lua 0也为true,只有false或者nil,才会判断为错误")
elseif x==1 then
    print("芜湖")
else
    print("芜湖+1")
end

printHead("----------------------------Lua函数--------------------------------")

function staticfunction(arg1, arg2, arg3)   --未在头设置 local 为全局函数
    print("这是个全局函数")
    local a,b,c=0,1,2
    return a,b,c                   --返回值
end

print(staticfunction(1,2,3))

local function localfunction(...)   -- ...为可变参数
    print("这是个局部函数")
    local arg={...}

    print("可变参数长度："..select('#',...))  --select('#',...)得出可变参数长度

    n=1
    print("第个值为："..select(n,...))     --select(n,...)得出第n个参数

    for i,v in pairs(arg) do         --pair遍历全部的table
        print(i,v)
    end
    
end

localfunction( "a","b","c" )

print()
print(select(2,"a","b","c"))  --select会返回第n个数组后的所有值
arg=select(2,"a","b","c")
print(arg)                    --返回的是多个参数，而不是一个table，直接打印值返回第一个


printHead("----------------------------Lua运算符--------------------------------")

a,b=10,10

print("普通运算符")
print(a+b)
print(a-b)
print(a*b)
print(a/b)
print(a^b)    --次方
print(-a+b)


print("关系运算符")
print( a == b)     
print( a ~= b)
print( a>b )
print( a<b )
print( a>=b )
print( a<=b )


print("逻辑运算符")
a,b=1,2
print( a and b)     --若 a 为flase，则返回a,反之返回b
print( a or b)      --若 a 为true, 则返回a,,反之返回b
print( not( a or b) )  --逻辑转换 true改变为false

--三目运算符实现  a,b最好不为nil 或者false
print( a>b and a or b)

a,b="a","b"
print(a..b)  -- .. 字符串链接
print(#(a..b)) -- # 字符串长度       n

printHead("----------------------------Lua字符串--------------------------------")


print("\a ttt")  --响铃(BEL)
print("--")
print("\b".."ab")   --退格(BS) ，将当前位置移到前一列
print("\f".."ab")   --换页(FF)，将当前位置移到下页开头
print("\f".."ab")   --换页(FF)，将当前位置移到下页开头
print("\n".."ab")   --换行(LF) ，将当前位置移到下一行开头
print("ttt".. "\r".."ab")   --回车(CR) ，将当前位置移到本行开头
---还是看菜鸟教程的吧 https://www.runoob.com/lua/lua-strings.html



printHead("----------------------------Lua数组--------------------------------")

array={"ac","b","c"}    --一维数组

for i=1,#array  do
    print(array[i])
end

array={{"a","b"},{"d","c"}} --二维数组

for i=1,#array do
    for j=1,#array[i] do
        print(array[i][j])
    end
end

printHead("----------------------------Lua迭代器--------------------------------")

--[[ pairs: 迭代 table，可以遍历表中所有的 key 可以返回 nil
 ipairs: 迭代数组，不能返回 nil,如果遇到 nil 则退出]]--

 printHead("----------------------------Lua table--------------------------------")

 atable={"a","b",["c"]="c" } --表初始化
 atable["a"]="a"
 atable[5]="end"      --表赋值
 atable=nil          --表删除
 
 
 ctable={"a","b",["c"]="c" }  
 ctablestr=table.concat(ctable, "+++ ",1,2 )     --table元素链接函数
 print(ctablestr)
 
 table.insert( ctable, 2 ,"www" )  --在特定位置后面添加
 print(ctable[2],ctable[3])
 table.remove( ctable, 2 )  --在特定位置后面删除
 print(ctable[2],ctable[3])
 
table.sort(ctable) --排序 按下标数字大小升序

printHead("----------------------------Lua模块--------------------------------")

require("module")

print(module.value1)
module.fun1()
module.fun3()

printHead("----------------------------Lua元表--------------------------------")

--一个只读表
PrivateTable={}                        
metaTable={                             --元表 是类似于对表函数的重写
__index=function (Table,key)               --__index 访问key
    return PrivateTable[key]
end
,__newindex=function (Table,key,value)        --__index 访问新的key
    PrivateTable[key]=value
end
}

testTable= setmetatable({key1="value1"},metaTable)
testTable.newKey1="value2"

print(PrivateTable.newKey1)

--__Index=table

table1={a=1,b=1,c=1}
table2=setmetatable({a=2,b=2},{
        __index=table1,
        __newindex=table1   
        }
        )
print(table2.c)      --table2 中没有c 则去table1取
table2.c=4 
print(table1.c)      --table1 的c 改变了值
table2.d=4      
print(table2.d)      --table2 中没有c 则去table1取 但table1中也没有 但__newindex=table1 意思是把table1的newidnex赋值给table2 所以这里是table1添加了d
print(table1.d)      --table1 中多了d

printHead("----------------------------Lua协同程序(coroutine)--------------------------------")

----------------------------------------


co1=coroutine.create(     --创建一个协程
    function(i)
        ti=coroutine.yield(i*2)
        print(ti)
        print("co1:"..i)
    end
)

coroutine.resume( co1,1 ) --重启一个协程
print(coroutine.status( co1 )) --协程的状态

coroutine.resume( co1,2 )
---------------------------------------
co2=coroutine.wrap(     --创建一个协程,就进入协程 和create功能重复
    function(i)
        
        print("co2:"..i)
    end
)
co2(1)

----------------------------------菜鸟教程案例----------------------------------------

--理解resume与yield的关系
---由这个案例可以得出 coroutine.resume(co, "r")【第二次调用resume】在调用时，会把 参数“r”赋值给最近一次coroutine.yield，即  local r = foo(a + 1)【coroutine.yield(2*a)】


function foo (a)
    print("foo 函数输出", a)
    return coroutine.yield(2 * a) -- 返回  2*a 的值
end
 
co = coroutine.create(function (a , b)
    print("第一次协同程序执行输出", a, b) -- co-body 1 10
    local r = foo(a + 1)
     
    print("第二次协同程序执行输出", r)
    local r, s = coroutine.yield(a + b, a - b)  -- a，b的值为第一次调用协同程序时传入
     
    print("第三次协同程序执行输出", r, s)
    return b, "结束协同程序"                   -- b的值为第二次调用协同程序时传入
end)
       
print("main", coroutine.resume(co, 1, 10)) -- true, 4
print("--分割线----")
print("main", coroutine.resume(co, "r")) -- true 11 -9
print("---分割线---")
print("main", coroutine.resume(co, "x", "y")) -- true 10 end
print("---分割线---")
print("main", coroutine.resume(co, "x", "y")) -- cannot resume dead coroutine
print("---分割线---")


-----案例二
co = coroutine.create(function (a)
    local r = coroutine.yield(a+1)       -- yield()返回a+1给调用它的resume()函数，即2
    print("r=" ..r)                       -- r的值是第2次resume()传进来的，100
end)
status, r = coroutine.resume(co, 1)    -- resume()返回两个值，一个是自身的状态true，一个是yield的返回值2
print("this is r:"..r)
coroutine.resume(co, 100)     --resume()返回true
--------------------------------------------------------------------------------------

---------------------------------------

printHead("----------------------------Lua面向对象--------------------------------")

require("newClass")

new_class=BaseClass:new(1,2,3)       --创建一个类
new_class.value4=4                   --对不存在的value4赋值

print(new_class.value4)              --4
print(BaseClass.value4)              --nil  原始数据不受影响

new_class.value3=44444               --对存在的value4赋值

print(new_class.value3)              --444444  
print(BaseClass.value3)              --3   原始数据不受影响

--函数重载
new_class:testfunction()            --基类的函数调用   错误调用到DeriveClass2
derive_class=DeriveClass1:new(4)   
derive_class:testfunction()         --派生类的函数调用  错误调用到DeriveClass2