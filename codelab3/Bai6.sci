function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    yn = conv(xn, hn);
    yorigin = xorigin + horigin - 1;
endfunction


xn = [0, 1, 3, -2];
xorigin = 1;
hn = [1, 1, 2, 3];
horigin = 2;
[yn, yorigin] = convolution(xn, xorigin, hn, horigin);
clf;


n = 1 - xorigin : length(xn) - xorigin;
subplot(221)
plot2d3(n, xn, style=5)
xlabel('n', 'color', 'blue');
ylabel('x(n)', 'color', 'blue');
title('Tín hiệu x(n)', 'color', 'red');
a = gca(); 
a.x_location = "origin"; 
a.data_bounds = [-8, -4; 8, 6];


n1 = 1 - horigin : length(hn) - horigin;
subplot(222)
plot2d3(n1, hn, style=5)
xlabel('n', 'color', 'blue');
ylabel('h(n)', 'color', 'blue');
title('Tín hiệu h(n)', 'color', 'red');
a = gca(); 
a.x_location = "origin"; 
a.data_bounds = [-8, -4; 8, 6];


n2 = 1 - yorigin : length(yn) - yorigin;
subplot(212)
plot2d3(n2, yn, style=5)
xlabel('n', 'color', 'blue');
ylabel('y(n)', 'color', 'blue');
title('Tín hiệu y(n)', 'color', 'red');
a = gca(); 
a.x_location = "origin"; 
a.data_bounds = [-8, -8; 8, 12];
