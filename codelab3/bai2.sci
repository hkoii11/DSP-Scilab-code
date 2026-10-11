
function [yn, yorigin] = advance(xn, xorigin, k)
    yorigin = xorigin + k;
    
    if (yorigin > length(xn)) then
        yn = [xn, zeros(1, yorigin - length(xn))]; 
    else
        yn = xn;
    end
endfunction


xn = [1, -2, 3, 6]; 
xorigin = 3;
k = 5;
[yn, yorigin] = advance(xn, xorigin, k);
clf;


n = 1 - xorigin : length(xn) - xorigin;
subplot(211)
plot2d3(n, xn, style=5)
xlabel('n', 'color', 'blue');
ylabel('x(n)', 'color', 'blue');
title('Tín hiệu x(n)', 'color', 'red');
a = gca(); 
a.x_location = "origin"; 
a.data_bounds = [-8, -4; 8, 6];


n1 = 1 - yorigin : length(yn) - yorigin; 
subplot(212)
plot2d3(n1, yn, style=5)
xlabel('n', 'color', 'blue');
ylabel('y(n)', 'color', 'blue');
title('Tín hiệu y(n)', 'color', 'red');
a = gca(); 
a.x_location = "origin"; 
a.data_bounds = [-8, -4; 8, 6];
