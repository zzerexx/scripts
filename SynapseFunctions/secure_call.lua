return function(func,env,...)
    return coroutine.wrap(function(...)
        setfenv(0, getsenv(env))
        setfenv(1, getsenv(env))
        return func(...)
    end)(...)
end
