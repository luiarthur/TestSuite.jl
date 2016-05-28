# TestSuite.jl

## My Test Suite for Julia

Tests powered by vulture (David Dahl) and TestSuite.jl (Arthur Lui).

vulture is a bash script created by David B. Dahl which can be found at
https://github.com/luiarthur/myBin/blob/master/vulture

You need to install inotify-tools to use vulture. In a terminal,

```bash
sudo apt-get install inotify-tools
```

TestSuite.jl is a basic julia test suite. To install TestSuite.jl,
enter in a Julia session,

```julia
Pkg.clone("https://github.com/luiarthur/TestSuite.jl.git")
```

## Demo

You'll find a demo in the `demo` directory.

The script, runtest, sleeps until any of the files in `src` changes, then
executes the test suite in `test/tests/jl` in julia with color mode.

If this is the structure of your project:

```
project/  
  src/  
    Main.jl  
    Stuff.jl  
  test/
    test.jl   
```

then in the `project` directory, execute in the terminal

```bash
./runtests
```

This will start the test suite. There is only one line in the `runtests` script.
It's job is to call vulture and rerun the test suite when any of the files in 
`src` changes. For more help on vulture, execute in the terminal

```bash
vulture --help
```

## Future

More documentation coming soon.
