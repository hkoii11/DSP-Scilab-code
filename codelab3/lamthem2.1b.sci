function [yn, yorigin] = delay(xn, xorigin, k)
    yorigin = xorigin - k;
    if (yorigin < 1) then 
        yn = [zeros(1, 1 - yorigin), xn];
        yorigin = 1; 
    else
        yn = xn;
    end
endfunction

function [yn, yorigin] = fold(xn, xorigin)
    yn = xn($:-1:1); 
    yorigin = length(xn) - xorigin + 1;
endfunction

n_x = -3:3;
xn = [0, 1/3, 2/3, 1, 1, 1, 1];
xorigin = 4;
clf;
[v1, v1origin] = fold(xn, xorigin);
[y1, y1origin] = delay(v1, v1origin, 4);


n1 = 1 - y1origin : length(y1) - y1origin;
subplot(211);
plot2d3(n1, y1, style=5);
xlabel('n', 'color', 'blue');
ylabel('y1(n)', 'color', 'blue');
title('TH1', 'color', 'red');
a = gca(); a.x_location = "origin"; a.data_bounds = [-2, 0; 10, 1.5];


[v2, v2origin] = delay(xn, xorigin, 4);
[y2, y2origin] = fold(v2, v2origin);
n2 = 1 - y2origin : length(y2) - y2origin;
subplot(212);
plot2d3(n2, y2, style=5);
xlabel('n', 'color', 'blue');
ylabel('y2(n)', 'color', 'blue');
title('TH2', 'color', 'red');
b = gca(); b.x_location = "origin"; b.data_bounds = [-10, 0; 2, 1.5];
