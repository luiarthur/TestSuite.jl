using TestSuite
include("../src/Main.jl")

tests = :(
  using TicTac;
  C = Cube(1,2,3);

  @vtest "This is a stupid test for 1 == 1" 1==1;

  @vtest "Testing Cube" let
    C.r == 1 && C.c == 2 && C.l == 3
  end;

  @vtest "Testing Cube z" C.z == 34;

  @vtest "Testing Cube oob" oob(C) == false;

  @vtest "Testing Cube moveDir" let
    dir = (1,2,3)
    D = moveDir(C,dir)
    TicTac.show(D)
    oob(D) == true;
  end;

)

testsuite(tests)

