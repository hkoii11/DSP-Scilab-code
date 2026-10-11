function [yn, yorigin] = fold(xn, xorigin)
    yn = xn($:-1:1); 
    yorigin = length(xn) - xorigin + 1;
endfunction


xn = [1, -2, 3, 6];
xorigin = 3;
[yn, yorigin] = fold(xn, xorigin);
clf;


n = 1 - xorigin : length(xn) - xorigin; 
subplot(211)
plot2d3(n, xn, style=5)
xlabel('n', 'color', 'blue');
ylabel('x(n)', 'color', 'blue');
title('Signal x(n)', 'color', 'red');
a = gca(); 
a.x_location = "origin"; 
a.data_bounds = [-6, -4; 6, 6];


n1 = 1 - yorigin : length(yn) - yorigin; 
subplot(212)
plot2d3(n1, yn, style=5)
xlabel('n', 'color', 'blue');
ylabel('y(n)', 'color', 'blue');
title('Signal y(n)', 'color', 'red');
a = gca(); 
a.x_location = "origin"; 
a.data_bounds = [-6, -4; 6, 6];
