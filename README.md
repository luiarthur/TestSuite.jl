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

Let's say this is the structure of your project:

```
project/  
  src/  
    Main.jl  
    TicTac.jl  
  test/
    test.jl   
```

## Future

More documentation coming soon.
