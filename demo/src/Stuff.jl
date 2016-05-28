#=
You will need the Lazy package and the TestSuite package to run this demo

julia> Pkg.add("Lazy")
julia> Pkg.clone("https://github.com/luiarthur/TestSuite.jl.git")
=#

module Stuff

using Lazy, Base.Test
export logfact, logfact_woTCO

"""
Log factorial function with tail call optimization using Lazy.@bounce
"""
function logfact(n)
 @bounce function loop(N, acc) 
   N == 0? acc : loop(N-1, log(N) + acc)
 end
 loop(n,0.0)
end

"""
Log factorical function without TCO
"""
function logfact_woTCO(n)
 function loop(N, acc) 
   N == 0? acc : loop(N-1, log(N) + acc)
 end
 loop(n,0)
end

end
