// list2d.io
List2D := Object clone do (
    init := method(
        self data := list()
    )

    // dim(x, y)
    dim := method(x, y,
        self data preallocateToSize(y)
        for(i, 0, y - 1, self data append(list() preallocateToSize(x)))
        self
    )
    // set(x, y)
    set := method(x, y, value,
        // ideally we'd have range checking, but we'll skip this for now for
        // the sake of simplicity...
        self data at(y) atInsert(x, value)
    )

    // get(x, y)
    get := method(x, y,
        return self data at(y) at(x)
    )

    // matrix transpose
    transpose := method(
        x := self data at(0) size
        y := self data size
        x_T := y
        y_T := x

        matrix_T := self clone
        matrix_T dim(x_T, y_T)

        for(i, 0, y - 1,
            for(j, 0, x - 1,
                value_T := self get(j, i)
                matrix_T set(i, j, value_T)
            )
        )

        return matrix_T
    )

    printMatrix := method(
        for(i, 0, (self data size) - 1,
            if(i == 0, write("["))
            for(j, 0, (self data at(0) size) - 1,
                write(self get(j, i), " ")
            )
            write("\n")
        )
        write("]\n")
    )

    // write to file
    toFile := method(filename,
        File with(filename) open  write(self serialized) close
    )

    // read from file
    fromFile := method(filename,
        doRelativeFile(filename)
    )
)


// tests
matrix := List2D clone
x := 2
y := 3
matrix dim(x, y)
write("Array Size = ", matrix data size, "\n")
for(i, 0, y-1, write("Array Size at", i, " = ", matrix data at(i) size, "\n"))

// iteratively load the array with the sum of each pair of indices for now.
for(i, 0, y-1,
    for(j, 0, x - 1, matrix set(j, i, j+1))
)

// then we'll check the dimensions now that it's all loaded...
write("Array Size = ", matrix data size, "\n")
for(i, 0, y-1, write("Array Size at", i, "," j, " = ", matrix data at(i) size, "\n"))

// then we'll spit all the values back out again iteratively.
for(i, 0, y-1,
    for(j, 0, x - 1, write("[",j,",",i,"] = ", matrix get(j, i),"\n"))
)

// Next we have to write a transpose method that will produce a copy of the
// List2D with x and y transposed such that comparing
// matrix_T get(y, x) == matrix get(x,y) evaluates as True.
matrix_T := matrix transpose

"Matrix = " println
matrix printMatrix
"Matrix_T = " println
matrix_T printMatrix

matrix toFile("matrix.txt")
matrix_T toFile("matrix_T.txt")
matrix2 := File2D fromFile("matrix.txt")
