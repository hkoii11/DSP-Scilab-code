function val = get_x(n_val)
    val = zeros(1, length(n_val));
    for i = 1:length(n_val)
        if (n_val(i) >= -1 & n_val(i) <= 2) then
            val(i) = 1;
        elseif (n_val(i) == 3 | n_val(i) == 4) then
            val(i) = 0.5;
        else
            val(i) = 0;
        end
    end
endfunction

n = -6:6;
clf;

function plot_signal(subplot_id, n_val, x_val, title_str)
    subplot(4, 2, subplot_id);
    plot2d3(n_val, x_val, style=5);
    xlabel('n', 'color', 'blue');
    ylabel('Amplitude', 'color', 'blue');
    title(title_str, 'color', 'red');
    a = gca();
    a.x_location = "origin";

    a.data_bounds = [-6, -1; 6, 1.5]; 
endfunction


plot_signal(1, n, get_x(n - 2), '(a) x(n-2)');
plot_signal(2, n, get_x(4 - n), '(b) x(4-n)');
plot_signal(3, n, get_x(n + 2), '(c) x(n+2)');
u_2_minus_n = bool2s(n <= 2);
plot_signal(4, n, get_x(n) .* u_2_minus_n, '(d) x(n)u(2-n)');


delta_n_minus_3 = bool2s(n == 3);
plot_signal(5, n, get_x(n - 1) .* delta_n_minus_3, '(e) x(n-1)\delta(n-3)');

plot_signal(6, n, get_x(n.^2), '(f) x(n^2)');


x_even = 0.5 * (get_x(n) + get_x(-n));
plot_signal(7, n, x_even, '(g) thành phần chẵn x(n)');


x_odd = 0.5 * (get_x(n) - get_x(-n));
plot_signal(8, n, x_odd, '(h) thành phần lẻ của x(n)');
