/* fibonacci_recursive.io*/
fib := method(targetValue,
	if(targetValue <= 1) then(value := targetValue) else(value := fib(targetValue - 2) + fib(targetValue - 1));
    returnValue := value;
)

fib(System args at(1) asNumber) println
