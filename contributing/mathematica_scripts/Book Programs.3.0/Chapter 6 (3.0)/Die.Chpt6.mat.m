(***********************************************************************
This file was generated automatically by the Mathematica front end.
It contains Initialization cells from a Notebook file, which typically
will have the same name as this file except ending in ".nb" instead of
".m".

This file is intended to be loaded into the Mathematica kernel using
the package loading commands Get or Needs.  Doing so is equivalent to
using the Evaluate Initialiation Cells menu command in the front end.

DO NOT EDIT THIS FILE.  This entire file is regenerated automatically 
each time the parent Notebook file is saved in the Mathematica front end.
Any changes you make to this file will be overwritten.
***********************************************************************)

Clear[Die];
Die[n_, s_] :=
Block[{r, olist = Table[0, {j, 1, 6}], alist = {}, 
       avg = 0
      },
      For[i = 1, i <= n, i++,
          r = Random[Integer, {1,s}];
          olist[[r]]++;
          If[EvenQ[r], avg = avg - r,
                       avg = avg + r
            ];
         ];
      alist = Table[{i, olist[[i]], olist[[i]]/n//N},
                    {i, 1, s}
                   ];
      For[j = 1, j <= s, j++,
          If[EvenQ[j],
             alist[[j]] = ReplacePart[alist[[j]],
                                      -alist[[j]][[1]],
                                      1
                                     ]
            ]
         ]; 
      Print["Winning   Frequency  Relative Frequency"];
      Print["  "];
      Print[TableForm[alist, TableSpacing -> {0,10}]        
           ];
      Print["  "];
      avg = avg/n//N;
      Print["Average winnings = ", avg];
      Return[avg]  
     ]