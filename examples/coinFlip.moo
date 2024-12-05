var X
var P; P = proc L : {atom(X = 0-L) ||| X = L}
var Face
var Weights; malloc(Weights); Weights.tails = 20; Weights.heads = 0-10 
var Earnings; Earnings = 0
var I; I = 10; skip
while 0 < I {P(I); if X < 0 then Face = tails else Face = heads; Earnings = Earnings - Weights.Face; I = I - 1}
Earnings = Earnings