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

Off[SetDelayed::write];
Off[General::stop];
Off[Set::write];
Off[General::spell];
Off[Power::indet];
Off[Plot::plnr]

<<DiscreteMath`Permutations`

<<Statistics`ContinuousDistributions`

<<Statistics`HypothesisTests`



Clear[Areabargraph];
Areabargraph[data_, xmin_, xmax_, k_] :=
Block[{sorteddata = {},
       length = Length[data],
       dx = (xmax - xmin)/k,
       currentupperlim = xmin + dx,
       result = {},
       index = 1,
       counter,
       rectanglelist = {},
       linelist = {},
       graphicslist = {}
      },
      sorteddata = Sort[data];
      If[((sorteddata[[1]] < xmin)||
          (sorteddata[[length]] > xmax)),
         Print["Note:  some data values lie outside the user-defined interval."]
        ];
      Block[{},
            For[i = 1, i <= k, i++,
                counter = 0;
                While[((index <= length)&&
                      (sorteddata[[index]] <=
                       currentupperlim)),
                      counter++;
                      index++;
                     ];
                result = Append[result, counter];
                currentupperlim += dx;
               ];
           rectanglelist = 
                 Table[Rectangle[{xmin + (i-1)*dx,0},
                                 {xmin + i*dx,result[[i]]/(length*dx)}
                                ],
                            {i, 1, k}
                      ];
           rectanglelist = Prepend[rectanglelist,
                                   RGBColor[0, 0, 1]
                                  ];
           linelist = Table[{Line[{{xmin + (i-1)*dx,0},
                                   {xmin + (i-1)*dx,result[[i]]/(length*dx)}
                                  }
                                 ],
                             Line[{{xmin + i*dx,0},
                                   {xmin + i*dx,result[[i]]/(length*dx)}
                                  }
                                 ],
                             Line[{{xmin + (i-1)*dx, 
                                    result[[i]]/(length*dx)},
                                   {xmin + i*dx,
                                    result[[i]]/(length*dx)}
                                  }
                                 ]
                             },
                             {i, 1, k}
                           ];
          linelist = Flatten[linelist,1];
          graphicslist = Union[rectanglelist, linelist];
   		  Show[Graphics[{rectanglelist, linelist}, 
                         Axes -> True,
                         PlotRange -> All,
                         Frame -> True
                       ]
              ]           
         ]
     ]



Clear[Bargraph];
Bargraph[data_, xmin_, xmax_, k_] :=
Block[{sorteddata = {},
       length = Length[data],
       dx = (xmax - xmin)/k,
       currentupperlim = xmin + dx,
       result = {},
       index = 1,
       counter,
       rectanglelist = {},
       linelist = {},
       graphicslist = {}
      },
      sorteddata = Sort[data];
      If[((sorteddata[[1]] < xmin)||
          (sorteddata[[length]] > xmax)),
         Print["Note:  some data values lie outside the user-defined interval."]
        ];
      Block[{},
            For[i = 1, i <= k, i++,
                counter = 0;
                While[((index <= length)&&
                       (sorteddata[[index]] <=
                        currentupperlim)),
                      counter++;
                      index++;
                     ];
                result = Append[result, counter];
                currentupperlim += dx;
               ];
           rectanglelist = 
                 Table[Rectangle[{xmin + (i-1)*dx,0},
                                 {xmin + i*dx,result[[i]]/length}
                                ],
                       {i, 1, k}
                      ];
           rectanglelist = Prepend[rectanglelist,
                                   RGBColor[0, 0, 1]
                                  ];
           linelist = Table[{Line[{{xmin + (i-1)*dx,0},
                                   {xmin + (i-1)*dx,result[[i]]/length}
                                  }
                                 ],
                             Line[{{xmin + i*dx,0},
                                   {xmin + i*dx,result[[i]]/length}
                                  }
                                 ],
                             Line[{{xmin + (i-1)*dx, 
                                    result[[i]]/length},
                                   {xmin + i*dx,
                                    result[[i]]/length}
                                  }
                                 ]
                            },
                            {i, 1, k}
                           ];
          linelist = Flatten[linelist,1];
          graphicslist = Union[rectanglelist, linelist];
          Show[Graphics[{rectanglelist, linelist}, 
                        Axes -> True,
                        PlotRange -> All,
                        Frame -> True
                       ]
              ]
		 ]
     ]



Clear[BetaDensity];
BetaDensity[alpha_, beta_, x_]  := 
  PDF[BetaDistribution[alpha, beta], x]



Bin[n_, p_, k_] := Binomial[n, k]*(p^k)*((1-p)^(n-k))



Clear[ConsolidateList];
ConsolidateList[inputlist_] :=
Block[{l = Length[inputlist],
       a = {},
       i = 1,
       currentxvalue
      },
      While[(i <= l),
          Block[{b = {0, 0}
                },
                currentxvalue = inputlist[[i]][[1]];
                b[[1]] = currentxvalue;
                While[(inputlist[[i]][[1]] == currentxvalue),
                      Block[{},
                            b[[2]] = b[[2]] + inputlist[[i]][[2]];
                            i++;
                           ];
                      If[(i > l), Break[]];
                     ];
                a = Append[a, b];
               ];    
           ];
      Return[a]
     ]



Clear[ContinuousMean];
ContinuousMean[f_, a_, b_] :=
      Integrate[x * f[x], {x, a, b}]



Clear[ContinuousVariance];
ContinuousVariance[f_, a_, b_] :=
      var = Integrate[((x - ContinuousMean[f, a, b])^2) 
                       * f[x], 
                      {x, a, b}]



Clear[Convolution];
Convolution[distributionlist1_, distributionlist2_] :=
Block[{l1 = Length[distributionlist1],
       l2 = Length[distributionlist2],
       i,
       j,
       newdistribution = {}
      },
      For[i = 1, i <= l1, i++,
          For[j = 1, j <= l2, j++,
              newdistribution = Append[newdistribution,
                                       {distributionlist1[[i]][[1]]+
                                        distributionlist2[[j]][[1]],
                                        distributionlist1[[i]][[2]]*
                                        distributionlist2[[j]][[2]]
                                       }
                                      ];
             ];
         ];
      newdistribution = Sort[newdistribution];
      newdistribution = ConsolidateList[newdistribution];
      Return[newdistribution]
     ]



Clear[DiscreteMean];
DiscreteMean[distributionlist_] :=
      Sum[distributionlist[[i]][[1]] *
          distributionlist[[i]][[2]],
          {i, 1, Length[distributionlist]}
         ]



Clear[DiscreteVariance];
DiscreteVariance[distributionlist_] :=
      Sum[((distributionlist[[i]][[1]] - DiscreteMean[distributionlist])^2) 
           * (distributionlist[[i]][[2]]),
          {i, 1, Length[distributionlist]}
         ]



Clear[FixedVector];
FixedVector[P_, stateslist_, print_] :=
Block[{IdMatrix, B, Z, c = Table[1, {i, 1, Length[P]}], 
       w
      },
       IdMatrix = IdentityMatrix[Length[P]];
       w = NullSpace[IdMatrix - Transpose[P]][[1]];
       w = w/Apply[Plus, w];
       If[print,
          Print["Transition matrix P:"];
          Print[LabelMatrix[P, stateslist, stateslist]];
          Print["  "];
          Print["  "];
          Print["Fixed vector W:"];
          Print[Prepend[{w},stateslist]//MatrixForm]
         ];
       Return[w]
     ]



Clear[LabelMatrix];
LabelMatrix[M_, rowlabels_, columnlabels_] :=
Block[{M2 = M},
      For[k = 1, k <= Length[M2], k++,
          M2[[k]] = Prepend[M2[[k]], rowlabels[[k]]]
         ];
      M2 = Prepend[M2, Prepend[columnlabels," "]];
      Return[M2//MatrixForm]
     ]



Clear[NFoldConvolution];
NFoldConvolution[distributionlist_, n_] :=
Block[{currentdistribution = distributionlist},
      For[i = 2, i <= n, i++,
          Block[{},
                currentdistribution = 
                    Convolution[currentdistribution, 
                                distributionlist];
               ];
         ];
     Return[currentdistribution]
    ]



Clear[NormalArea];
NormalArea[a_, b_] :=
  (CDF[NormalDistribution[0, 1], b]) -
  (CDF[NormalDistribution[0, 1], a])



Clear[NormalDensity];
NormalDensity[x_, mu_, sigma_] :=
  (1/Sqrt[2 Pi sigma^2]) Exp[-(x - mu)^2/(2 sigma^2)]



Clear[SimulateDiscreteVariable];
SimulateDiscreteVariable[plist_] :=
Block[{r, j = 1, subtotal = 0},
      r = Random[];
      While[subtotal <= r,
            subtotal = subtotal + plist[[j]];
            j++
           ];
      Return[j - 1]
	    ]





Clear[SpikeData];
SpikeData[data_] :=
Block[{data2, olist, plist, i, data3},
      data2 = Sort[data];
      olist = {data2[[1]]};
      plist = {1};
      i = 2;
      While[(i <= Length[data2]),
            If[data2[[i]] == data2[[i - 1]],
               plist[[Length[olist]]]++,
               olist = Append[olist, data2[[i]]];
               plist = Append[plist, 1]
              ];
            i++
           ];
      data3 = Table[{olist[[j]], 
                     plist[[j]]/Length[data]//N},
                    {j, 1, Length[olist]}
                   ];
      Return[data3]
     ]



Clear[Spikegraph];
Spikegraph[distributionlist_, xmin_, xmax_, print_] :=
Block[{num = Length[distributionlist],
       j, k,
       linelist
      },
      linelist = Table[Line[{distributionlist[[i]],
                            {distributionlist[[i]][[1]], 0}}
                           ],
                       {i, 1, num}
                      ];
      j = 1;
      While[distributionlist[[j]][[1]] < xmin,
            linelist = Drop[linelist, 1];
            j++
           ];
      k = num;
      While[distributionlist[[k]][[1]] > xmax,
            linelist = Drop[linelist, -1];
            k--
           ];
      If[print,
         If[((distributionlist[[1]][[1]] < xmin)||
             (distributionlist[[num]][[1]] > xmax)),
            Print["Note:  some outcome values lie outside the user-defined interval."]
           ];
         Show[Graphics[linelist],
              PlotRange -> All,
              Frame -> True
             ],
         Show[Graphics[linelist],
              DisplayFunction -> Identity,
              PlotRange -> All,
              Frame -> True
             ]
        ] 
     ]



Clear[SpikegraphWithDots];
SpikegraphWithDots[distributionlist_, xmin_, xmax_, 
                   color_, print_] :=
Block[{num = Length[distributionlist],
       j, k,
       linelist
      },
      linelist = Table[Line[{distributionlist[[i]],
                            {distributionlist[[i]][[1]], 0}}
                           ],
                       {i, 1, num}
                      ];
      pointlist = Table[Point[distributionlist[[i]]],
                        {i, 1, num}
                       ];
      j = 1;
      While[distributionlist[[j]][[1]] < xmin,
            linelist = Drop[linelist, 1];
            pointlist = Drop[pointlist, 1];
            j++
           ];
      k = num;
      While[distributionlist[[k]][[1]] > xmax,
            linelist = Drop[linelist, -1];
            pointlist = Drop[pointlist, -1];
            k--
           ];
      finallist = Join[linelist, pointlist];
      If[print,
         If[((distributionlist[[1]][[1]] < xmin)||
             (distributionlist[[num]][[1]] > xmax)),
            Print["Note:  some outcome values lie outside the user-defined interval."]
           ];
         Show[Graphics[linelist],
              Graphics[{PointSize[.02],
                       RGBColor[color[[1]], color[[2]], color[[3]]],
                       pointlist}
                      ],
              PlotRange -> All,
              Frame -> True
             ],
         Show[Graphics[linelist],
              Graphics[{PointSize[.02],
                       RGBColor[color[[1]], color[[2]], color[[3]]],
                       pointlist}
                      ],
              DisplayFunction->Identity,
              PlotRange -> All,
              Frame -> True
             ]
        ]
     ]

RandomNumbers::usage = "RandomNumbers[n] displays n random real numbers between 0 and 1.";

CoinTosses::usage = "CoinTosses[n, print] simulates n tosses of a fair coin, and prints the proportion of tosses that come up heads. If print = True, then the outcomes of the tosses (H/T) are also printed.";

DeMere1::usage = "DeMere1[n, print] simulates 4 rolls of a die, and determines whether a six has appeared (a 'success'). It repeats this experiment n times, and prints the number of trials that resulted in a success. It also prints the proportion of trials that resulted in a success. Finally, if print = True, then the rolls are printed out.";

DeMere2::usage = "DeMere2[n, m, print] simulates m rolls of two dice, and determines whether a double 6 has appeared (a 'success'). It repeats this experiment n times, and prints the number of trials that resulted in a success. It also prints the proportion of trials that resulted in a success. Finally, if print = True, then the rolls are printed out.";

HTSimulation::usage = "HTSimulation[n, m, print] simulates an experiment in which a fair coin is tossed m times. The experiment is repeated n times. The program records the 'winnings' in each experiment, where the winnings are defined to be the number of heads minus the number of tails. It also keeps track of the number of times the winnings are 'positive' in the course of an experiment (we count as 'positive' a time at which the winnings are 0 but the previous winnings are positive). The program returns a list whose first element is a list of the winnings in each experiment (winningslist), and whose second element is a list of times in the lead in each experiment (timesinleadlist). If print = True and n = 1, then a graph of the game is displayed. If print = True and n > 1, then spike graphs of the winningslist and timesinleadlist are displayed. ";

HorseRace::usage = "HorseRace[n] simulates n of the horse races described in Chapter 1. The program prints each race winner, and returns a list containing the number of times each horse won.";

GeneralSimulation::usage = "GeneralSimulation[n, plist, m, print]simulates m general experiments in which the outcomes 1, 2, ..., n occur with probabilties plist[[1]], plist[[2]], ..., plist[[n]]. The observed frequencies of the outcomes are printed, and if print = True, the outcomes are printed, and spike graphs of the observed data frequencies and plist data frequencies are displayed on the same set of axes (the observed data spikes are topped with blue dots, the plist data spikes with red). Finally, the program returns a list of the n observed frequencies.";

BertrandsParadox::usage = "BertrandsParadox[n, print] illustrates Bertrand's Paradox by choosing n random chords of a circle three times, each time using a different one of the three coordinatizations described in the book. For each coordinatization, the program prints the proportion of chosen chords with length greater than Sqrt[3] and, if print = True, displays a picture of the experiment, drawing  every one-hundredth chord.";

BuffonsNeedle::usage = "BuffonsNeedle[n, print] simulates the Buffon needle experiment described in the book, dropping n pins on a 10 x 10 grid. The program returns an estimate for Pi, using the book's method. If print = True, a graphical display of the experiment is produced, showing every one-hundredth pin. ";

BusParadox::usage = "BusParadox[n] simulates the bus paradox problem stated in the book, for n days. It displays an area bar graph of the waiting times, and returns the experimentally-determined mean waiting time.";

Darts::usage = "Darts[n, print] simulates n throws of a dart at a circular dartboard of radius 1. The program displays a bar graph in which the area of the i'th bar is equal to the fraction of the total falling in the i'th region. If print = True, then the program returns a list of distances that the dart landed from the center of the board.";

GaltonBoard::usage = "GaltonBoard[n, m, print] simulates n Galton board experiments, with m rows of pins. Each simulation consists of choosing 0 or 1 m times, and summing the chosen numbers. The program then displays an area bar graph of the experiment results. If print = True, a list of all the final positions is returned.  ";

MonteCarlo::usage = "MonteCarlo[n, f, xmin, xmax, ymax] estimates  the area under the input function f[x] and above the interval [xmin, xmax] by choosing n random points in the rectangle above the interval [xmin, xmax] and between the y-values 0 and ymax. The program returns its area estimate,  and also plots the random points and the function f[x] on the interval  [xmin, xmax].";