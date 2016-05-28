module TicTac

using Lazy
export Cube, Board, z, show, oob, moveDir

n = 4
allCells = 1:n^3

immutable Cube
  r
  c
  l
  z
  Cube(r,c,l) = new(r,c,l,(l-1)*n*n + (r-1)*n + c) # This happens only at instantiation
end # of type Cube

# Methods for Cube
show(C::Cube) = println(string("(",C.r,",",C.c,",",C.l,")"))
oob(C::Cube) = C.r<1 || C.r>n || C.c<1 || C.c>n || C.l<1 || C.l>n
moveDir(C::Cube, dir) = Cube(C.r+dir[1],C.c+dir[2],C.l+dir[3])

# private val lst = List(-1,0,1)
# private val dirs = (for(i <- lst; j <- lst; k <- lst) yield (i,j,k)).
#   filterNot(x => x == (0,0,0))
# private val coord = (1 to n).toList
# def build(start: Cube, dir: (Int,Int,Int)): Set[Cube] = {
#   def loop(s: Cube, S: Set[Cube]): Set[Cube] = {
#     if (S.size == n && !s.oob) S else {
#       val dest = s.moveTo(dir)
#       val newS = S + dest
#       if (dest.oob || newS.size > n) S.empty else loop(dest, newS)
#     }
#   }
#   loop(start, Set(start))
# }
# 
# val winSets_tmp = for(i <- coord; j <- coord; k <- coord; d <- dirs) yield { 
#   build(new Cube(i,j,k), d).map(x => x.z)
# }
# val winSets = winSets_tmp.toSet.filter(x => x != Set.empty)




end # end of module Board
