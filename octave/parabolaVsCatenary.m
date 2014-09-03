x = [-3:.1:3];
y_parabola = x.^2;
y_caternary = cosh(x) - 1;
plot(x, y_parabola, "r-");
hold on;
plot(x, y_caternary, "g+");
