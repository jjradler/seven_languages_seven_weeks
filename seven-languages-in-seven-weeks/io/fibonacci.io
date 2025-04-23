/* fibonacci.io */
fib := method(targetIndex,
	currentValue := 1
	previousValue := 0
	nextValue := 0

	for(i, 0, targetIndex, 1,
		if(i < 2) then(nextValue := currentValue) else(nextValue := currentValue + previousValue);
		previousValue := currentValue;
		currentValue := nextValue;
	)

	currentValue println
)


fib(11)
