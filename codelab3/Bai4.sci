function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)

    n1_start = 1 - x1origin;
    n1_end = length(x1n) - x1origin;
    
    n2_start = 1 - x2origin;
    n2_end = length(x2n) - x2origin;
    

    n_min = min(n1_start, n2_start);
    n_max = max(n1_end, n2_end);
    

    yorigin = 1 - n_min;
    

    yn = zeros(1, n_max - n_min + 1);
    

    idx1_start = n1_start - n_min + 1;
    yn(idx1_start : idx1_start + length(x1n) - 1) = x1n;
    

    idx2_start = n2_start - n_min + 1;

    yn(idx2_start : idx2_start + length(x2n) - 1) = yn(idx2_start : idx2_start + length(x2n) - 1) + x2n;
endfunction


x1n = [0, 1, 3, -2]; 
x1origin = 1;
x2n = [1, 1, 2, 3]; 
x2origin = 2;
[yn, yorigin] = add(x1n, x1origin, x2n, x2origin);


clf;


n1 = 1 - x1origin : length(x1n) - x1origin;
subplot(221)
plot2d3(n1, x1n, style=5)
xlabel('n', 'color', 'blue');
ylabel('x1(n)', 'color', 'blue');
title('Tín hiệu x1(n)', 'color', 'red');
a = gca(); a.x_location="origin"; a.data_bounds=[-8,-4;8,6];


n2 = 1 - x2origin : length(x2n) - x2origin;
subplot(222)
plot2d3(n2, x2n, style=5)
xlabel('n', 'color', 'blue');
ylabel('x2(n)', 'color', 'blue');
title('Tín hiệu x2(n)', 'color', 'red');
a = gca(); a.x_location="origin"; a.data_bounds=[-8,-4;8,6];


n_y = 1 - yorigin : length(yn) - yorigin;
subplot(212)
plot2d3(n_y, yn, style=5)
xlabel('n', 'color', 'blue');
ylabel('y(n)', 'color', 'blue');
title('Tín hiệu y(n)', 'color', 'red');
a = gca(); a.x_location="origin"; a.data_bounds=[-8,-4;8,6];
