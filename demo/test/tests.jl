using TestSuite
include("../src/Main.jl")

tests = :(
  using Stuff; # You NEED to import your packages here!

  @vtest "This is a stupid test for 1 == 1" 1==1; # You need ';' within this expression
  @vtest "Assert logfact(3) = log(6)" logfact(3) == log(6);
  @vtest "Assert logfact_woTCO(3) = log(6)" logfact_woTCO(3) == log(6);
  @vtest "Assert logfact(500) = logfact_woTCO(500)" logfact(500) == logfact_woTCO(500);
  @vtest "Assert TCO works for logfact" let # this is how you test a block
    made_it_to_end = true
    println( "logfact(1000) = ", logfact(100000) )
    made_it_to_end
  end;
  @vtest "Assert TCO works for logfact_woTCO" let # this is how you test a block
    made_it_to_end = true
    println( "logfact_woTCO(1000) = ", logfact_woTCO(100000) )
    made_it_to_end
  end;
  @vtest "Assert this still works" 1==1 # you can continue testing even if something breaks in a block.
)

testsuite(tests)
