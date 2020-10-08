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

Clear[DeMere1];
DeMere1[n_, print_] :=
Block[
      {successcounter = 0,
       currentrollset = {}
      },
      For[i = 1, i <= n, i++,
          currentrollset = {};
          For[j = 1, j <= 4, j++,
              currentrollset = 
                Append[currentrollset, 
                       Ceiling[6*Random[]]
                      ];
             ];
          If[print, Print[currentrollset]
            ];
          If[Count[currentrollset, 6] > 0,
             successcounter++
            ];
         ];
      Print["number of successes = ", 
            successcounter
           ];
      Print["proportion of successes = ",
            N[successcounter/n, 5]
           ]
     ]

Clear[DeMere2];
DeMere2[n_, m_, print_] :=
Block[{successcounter = 0,
       currentrollset = {}
      },
      For[i = 1, i <= n, i++,
          currentrollset = {};
          For[j = 1, j <= m, j++,
              currentrollset = 
                Append[currentrollset, 
                       {Ceiling[6*Random[]],
                        Ceiling[6*Random[]]
                       }
                      ];
             ];
          If[print, Print[currentrollset]
            ];
          If[Count[currentrollset, {6, 6}] > 0,
             successcounter++
            ];
         ];
      Print["number of successes = ", 
            successcounter
           ];
      Print["proportion of successes = ",
            N[successcounter/n, 5]
           ]
     ]