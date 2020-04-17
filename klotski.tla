------------------------------ MODULE klotski ------------------------------

EXTENDS Integers

(* The board is a set of (x,y) point tuples. Its size is 3x4, located on the  *)
(* first quadrant (upper right) of the cartesian coordinate plane, with (0,0) *)
(* at the bottom left of the board. *)
BoardPoints == { x \in 0..3: TRUE } \X {y \in 0..4 : TRUE}

(* These two points are the exit *)
ExitPoints == { <<1,0>>, <<2,0>> }

(* This is the set of all pieces. A piece is the set of its points. *)
VARIABLES PieceA

AllPieces == { PieceA } 

Overlapping(Piece) == TRUE

(* A piece is off the board if any of its points are not in the set of board points *)
OffBoard(Piece) ==
  \neg \A pt \in Piece : pt \in BoardPoints

(* A piece is legal if it is on the board and it's not overlapping another piece. *)
Legal(P) ==
  \neg ( OffBoard(P) \/ Overlapping(P) )
  
(* A piece moves up if all of its points are y+1 and if the piece is legal *)
 MoveUp(P) ==
     /\ Legal(P')
     /\ TRUE
 \*    /\ \A pt \in P <<4,5>>[2]

(* Initial state shows the pieces in standard positions. PieceA is the goal piece, the 2x2 one. *)
Init == 
    PieceA = {<<1,3>>, <<2,3>>, <<1,4>>, <<2,4>>}

\* Next == \/ MoveUp
\*        \/ MoveDown

=============================================================================
\* Modification History
\* Last modified Fri Apr 17 14:53:23 EDT 2020 by mperilstein
\* Created Fri Apr 17 13:15:25 EDT 2020 by mperilstein
