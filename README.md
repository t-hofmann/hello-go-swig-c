# hello-go-swig-c

`hello-go-swig-c` illustrates how to integrate a `C`-library with SWIG into `Go`.

## Building
### Building the Go Program
```
cd cmd/hello
go build .
```

### Building the C Program
```
cd cmd/hello-c
gcc main.c -o hello
```

## Wrapper Files

The `Go`-tools create the necessary wrapper files in the background as temporary files.

If neccessary the actual wrapper files could be explicitly generated with:
```
swig -go -intgosize 64 hello.i
# => new files:
#    hello_wrap.c
#    hello.go
```

But be aware of, that this will lead to conflicts when building, since then multiple files (the temporary wrapper files and the explicitly generated ones) will contain the wrapped functionality, leading to redeclarations.

## Function Names

Please note, that public function names in Go are starting with capital letters. Therefore a public c-function will be wrapped - and hence be accessible - by a wrapper function with the same name but *capitalized* first letter.

## Files
```
.
├── README.md               # this file
├── cmd
│   ├── hello
│   │   └── main.go         # GO "hello world" program
│   └── hello-c
│       └── main.c          # C "hello world" program
├── hello.c                 # library with the function "hello()"
├── hello.i                 # SWIG interface file
├── hello.swig -> hello.i   # link to the SWIG interface file, 
│                           #   since the go-tools expects a file 
│                           #   ending with ".swig" to interface with "c"
└── hello_test.go           # go-testfile
```
