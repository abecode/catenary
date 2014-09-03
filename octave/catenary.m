% Prevent Octave from thinking that this
% is a function file:
1;

function [x, y] = catenary(s, T, lambda) 
  % s, vector of incremental length of chain (meters) 
  % lambda,  weight per meter of chain (kg/meter)
  % T tension from wind and wave force on boat (kg m s^-2)

  g = 9.8 % earth's gravitational constant (m s^-2)
  
  % a, a parameter describing the source tension T to the pull of gravity
  a = T/(lambda*g)

  % dx and dy, the incremental changes in x and y, as in calculus (scaled by ds ds)
  ds = [1 diff(s)];  % size of link. this could handle chains with differing link sizes
  dx = a./sqrt(a**2+s.**2).*ds; % change in x relative to ds
  dy = s./sqrt(a**2+s.**2).*ds; % change in y relative to ds

  % the nifty upper triangular matrix for summation of dx and dy
  nifty = triu(ones(length(s)));

  x = dx*nifty;
  y = dy*nifty;

end
% s, the length of the chain in increments up to 100 meters

s = [0:1:100]; % meters

figure;

subplot(4,1,1)
lambda = .01
T = 10
[x, y] = catenary(s, T, lambda);
plot(x,y) 
axis([0 100 0 100])

subplot(4,1,2)
lambda = .1
T = 10
[x, y] = catenary(s, T, lambda);
plot(x,y) 
axis([0 100 0 100])

subplot(4,1,3)
lambda = 1
T = 10
[x, y] = catenary(s, T, lambda);
plot(x,y) 
axis([0 100 0 100])

subplot(4,1,4)
lambda = 10
T = 10
[x, y] = catenary(s, T, lambda);
plot(x,y) 
axis([0 100 0 100])

