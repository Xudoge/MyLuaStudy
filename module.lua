
module={}

module.value1="wu hu"

function module.fun1( ... )
    print("这是个public函数")
end

local function fun2( ... )
    print("这是个private函数")
end

function module.fun3( ... )
    fun2()
end

