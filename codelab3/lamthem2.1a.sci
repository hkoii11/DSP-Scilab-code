n = -3:3;
xn = [0, 1/3, 2/3, 1, 1, 1, 1];
clf;
plot2d3(n, xn, style=5);


a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [-5, 0; 5, 1.5];

xlabel('n', 'color', 'blue');
ylabel('x(n)', 'color', 'blue');
title('Signal x(n)', 'color', 'red');
