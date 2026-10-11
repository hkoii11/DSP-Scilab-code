n = -4:8;
function val = get_x(n_val)
    val = zeros(1, length(n_val));
    for i = 1:length(n_val)
        if (n_val(i) >= 0 & n_val(i) <= 3) then
            val(i) = 1;
        end
    end
endfunction
xn = get_x(n);


function plot_sub(plot_pos, n_axis, sig, title_str, b_min, b_max)
    subplot(3, 2, plot_pos);
    plot2d3(n_axis, sig, style=5);
    xlabel('n', 'color', 'blue'); ylabel('Amplitude', 'color', 'blue');
    title(title_str, 'color', 'red');
    a = gca(); a.x_location = "origin"; a.data_bounds = [-4, b_min; 8, b_max];
endfunction


scf(0); clf;

plot_sub(1, n, xn, '(1) x(n)', -0.5, 1.5);

yn_b = get_x(n.^2);
plot_sub(2, n, yn_b, '(2) y(n) = x(n^2)', -0.5, 1.5);

yn_minus_2_b = get_x((n-2).^2);
plot_sub(3, n, yn_minus_2_b, '(3) y(n-2)', -0.5, 1.5);

x2n = get_x(n-2);
plot_sub(4, n, x2n, '(4) x2(n) = x(n-2)', -0.5, 1.5);

y2n_b = get_x(n.^2 - 2);
plot_sub(5, n, y2n_b, '(5) y2(n) = T[x2(n)]', -0.5, 1.5);



scf(1); clf;
plot_sub(1, n, xn, '(1) x(n)', -1.5, 1.5);

yn_c = get_x(n) - get_x(n-1);
plot_sub(2, n, yn_c, '(2) y(n) = x(n) - x(n-1)', -1.5, 1.5);

yn_minus_2_c = get_x(n-2) - get_x(n-3);
plot_sub(3, n, yn_minus_2_c, '(3) y(n-2)', -1.5, 1.5);

plot_sub(4, n, x2n, '(4) x2(n) = x(n-2)', -1.5, 1.5);

y2n_c = get_x(n-2) - get_x(n-3);
plot_sub(5, n, y2n_c, '(5) y2(n) = T[x2(n)]', -1.5, 1.5);



scf(2); clf;
plot_sub(1, n, xn, '(1) x(n)', -1, 6);

yn_d = n .* get_x(n);
plot_sub(2, n, yn_d, '(2) y(n) = n*x(n)', -1, 6);

yn_minus_2_d = (n-2) .* get_x(n-2);
plot_sub(3, n, yn_minus_2_d, '(3) y(n-2)', -1, 6);

plot_sub(4, n, x2n, '(4) x2(n) = x(n-2)', -1, 6);

y2n_d = n .* get_x(n-2);
plot_sub(5, n, y2n_d, '(5) y2(n) = T[x2(n)]', -1, 6);
