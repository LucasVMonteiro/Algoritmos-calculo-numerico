x = 1:10;
y = rand (16, 10);
for i_plot = 1:4
  hax(i_plot) = subplot (2, 2, i_plot);
  hold (hax(i_plot), "on");
  grid (hax(i_plot), "on");
endfor
for i_loop = 1:2
  for i_plot = 1:4
    iy = (i_loop - 1)*4 + i_plot;
    plotyy (hax(i_plot), x,y(iy,:), x,y(iy+1,:));
  endfor
 endfor
