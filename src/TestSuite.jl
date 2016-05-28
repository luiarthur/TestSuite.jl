module TestSuite
export vtest, @vtest, testsuite

"""
I'd like to be able to do this:

```julia
@TestSuite let
  @vtest "Test 1" mysum(3,5) == 8
  @vtest "Test 2" true
  @vtest "Test 3" some_syntax_error
  @vtest "Test 4" mysum(3,5) == 7
end
```

and have it print:
```julia

Passed Test 1
Passed Test 2
Error in Test 3
Failed Test 4

Passed 3 of 4 tests
```

See: https://www.youtube.com/watch?v=EpNeNCGmyZE
"""

passColor = :cyan
failColor = :black
stopColor = :red

macro vtest(s::AbstractString, ex::Expr)
  quote
    try print_with_color($(esc(ex)) ? passColor : failColor, 
      ($(esc(ex)) ? "Passed" : "Failed") * " Test: " * $s * "\n") 
    catch
      #throw($(esc(ex))) # can I print without stopping?
      print_with_color(stopColor, "Error in test syntax: " * $s * "\n")
    end
    Base.Test.@test $(esc(ex))
  end
end

function testsuite(tests::Expr)
  numPass = 0
  numFail = 0
  numStop = 0

  function custom_handler(r::Base.Test.Success)
    #print_with_color(passColor, "Passed test: $(r.expr)\n")
    numPass += 1
  end

  function custom_handler(r::Base.Test.Failure)
    #print_with_color(failColor, "Failed test : $(r.expr)\n")
    numFail += 1
  end

  function custom_handler(r::Base.Test.Error) 
    #print_with_color(failColor, "Error in test: $(r.expr)\n")
    numFail += 1
  end


  Base.Test.with_handler(custom_handler) do
    println()

    eval(tests)

    printColor = numFail == 0 ? passColor : failColor
    println()
    print_with_color(printColor, 
      string("Tests Passed: ", numPass, " of ", numPass + numFail),"\n")
  end
end

end

#=
include("TestSuite.jl")
using TestSuite

mytests = :(
  @vtest "Test 1" 1==1;
  @vtest "Test 2" true==true;
  @vtest "Test 3" 2==1;
  @vtest "Test 4" 1==a;
)

testsuite(mytests)
=#
