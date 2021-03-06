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

Clear[BranchingSimulation];
BranchingSimulation[n_, gmax_, plist_, changepoint_] :=
Block[{mean, var, g, gsize, glist,
       offspring, gmean, gstdev, finallist = {}
      },
      pdistlist = Table[{i-1, plist[[i]]}, {i, 1, Length[plist]}];
      mean = DiscreteMean[pdistlist];
      var = DiscreteVariance[pdistlist];
      Do[glist = {};
         g = 0; 
         gsize = 1;
         While[(gsize > 0) && (g < gmax),
               glist = Append[glist, {g, gsize/(mean^g)}];
               g++;
               If[gsize < changepoint,
                  offspring = 0;
                  For[i = 1, i <= gsize, i++,
                      offspring = 
                        offspring + 
                        SimulateDiscreteVariable[plist] - 1
                     ];
                  gsize = offspring,
                  gmean = gsize * mean;
                  gstdev = Sqrt[gsize * var];
                  gsize = gstdev * Sqrt[-2 * Log[Random[]]]
                                 * Cos[2*Pi*Random[]]
                                 + gmean//N
                 ]
              ];
          glist = Append[glist, {g, gsize/(mean^g)}];
          finallist = Append[finallist, 
                             ListPlot[glist, PlotJoined -> True,
                             DisplayFunction -> Identity]
                            ]
          , 
          {n}
         ];
      Show[finallist,
           DisplayFunction -> $DisplayFunction
          ]
     ]