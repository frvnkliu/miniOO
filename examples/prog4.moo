var X; malloc(X);
X.c = 0
X.f = proc Y:if Y < 1 then X.r = X.c else X.f(Y - 1)
X.f(2);