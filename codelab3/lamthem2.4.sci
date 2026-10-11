x = [2, 3, 4, 5, 6];
xorigin = 3;


function [x_e, x_o, n_out] = decompose(xn, xorigin)
    n_start = 1 - xorigin;
    n_end = length(xn) - xorigin;
    

    n_min = min(n_start, -n_end);
    n_max = max(n_end, -n_start);
    n_out = n_min : n_max;
    

    x_full = zeros(1, length(n_out));
    idx_x_start = n_start - n_min + 1;
    x_full(idx_x_start : idx_x_start + length(xn) - 1) = xn;
    

    x_fold = x_full($:-1:1);
    

    x_e = 0.5 * (x_full + x_fold);
    x_o = 0.5 * (x_full - x_fold);
endfunction


[x_even, x_odd, n] = decompose(x, xorigin);
clf;

subplot(311);
plot2d3(n, x, style=5);
x_full_draw = zeros(1, length(n));
x_full_draw((1-xorigin)-min(n)+1 : (1-xorigin)-min(n)+length(x)) = x;
plot2d3(n, x_full_draw, style=5);

xlabel('n', 'color', 'blue');
ylabel('x(n)', 'color', 'blue');
title('tín hiệu x(n)', 'color', 'red');
a = gca(); a.x_location = "origin"; a.data_bounds = [-3, -3; 3, 7];


subplot(312);
plot2d3(n, x_even, style=5);
xlabel('n', 'color', 'blue');
ylabel('x_e(n)', 'color', 'blue');
title('thành phần chẵn của x(n)', 'color', 'red');
a = gca(); a.x_location = "origin"; a.data_bounds = [-3, -3; 3, 7];


subplot(313);
plot2d3(n, x_odd, style=5);
xlabel('n', 'color', 'blue');
ylabel('x_o(n)', 'color', 'blue');
title('thành phần lẻ x(n)', 'color', 'red');
a = gca(); a.x_location = "origin"; a.data_bounds = [-3, -3; 3, 7];
