
BaseClass={value1=1,value2=2,value3=3,
}


function BaseClass:new(val1,val2,val3)
    o={                             --如果这里设置 o= o or { } 那么这个baseClass类则具有缓存功能，全局唯一值并且不支持多态
        value1=val1,
        value2=val2,
        value3=val3
    }

    setmetatable(o,self)    --元表只属于产生在内存空间中的自己，不影响基类
    self.__index=self
    return o
    -- body
end


function BaseClass:testfunction()
    print("this is BaseClass Function".." and value1 ="..self.value1)
end

--------------继承类--------------
DeriveClass1=BaseClass:new(1,2,3)

function DeriveClass1:new(val1)
    o=BaseClass:new(1,2,3)
    self.value4=val1
    setmetatable(o,self)
    self.__index=self
    return o
end

function DeriveClass1:testfunction()
    print("this is DeriveClass1 Function".." and value3 ="..self.value3)
end


DeriveClass2=BaseClass:new(1,2,3)

function DeriveClass2:new(val1)
    o=BaseClass:new(1,2,3)
    self.value4=val1
    setmetatable(o,self)
    self.__index=self
    return o
end

function DeriveClass2:testfunction()
    print("this is DeriveClass2 Function".." and value3 ="..self.value3)
end