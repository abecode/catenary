% s, the length of the chain in increments up to 100 meters

s = [0:1:100]; % meters

% a, a parameter describing the source tension T to the pull of gravity
lambda = 1 % weight per meter of chain (kg/meter)
T = 10 % wind and wave force on boat (kg m s^-2)
g = 9.8 % earth's gravitational constant (m s^-2)
a = T/(lambda*g)

% dx and dy, the incremental changes in x and y, as in calculus (actually per dx/ds, dy/ds)
dx = a./sqrt(a**2+s.**2);
dy = s./sqrt(a**2+s.**2);

% the nifty upper triangular matrix for summation of dx and dy
nifty = triu(ones(length(s)));

x = dx*nifty;
y = dy*nifty;
figure;
plot(x,y) 
axis([0 100 0 100])
