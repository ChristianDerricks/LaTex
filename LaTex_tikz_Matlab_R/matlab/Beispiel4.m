function Beispiel4()

  initialize();
  color = colorlist();

  number_of_figures = 1;
  number_of_axes    = 1;

  config = create_figures_and_load_saved_position(number_of_figures, number_of_axes);
  grid(config{1}.ax(1), 'off');

  tikz                     = tikzoptions();
  tikz.texfilename         = 'Beispiel4';
  tikz.boxplot             = 1;
  tikz.customboxplotlegend = 1;
  tikz.set_noSize          = true;

  xLabelFontSize = 16;
  yLabelFontSize = 12;
  
  N = 100;
  upperlimit = 40;
  lowerlimit = 20;
  x = [ randi([0 1], N, 4) , [randi([1 4], N/2, 1) ; randi([3 5], N/2, 1)]];

  a = 20;
  b = 40;
  r1 = ((b-a).*rand(N, 1, 'double')+a).*(x(:,1) == 1 & x(:,2) == 1 & x(:,3) == 1);
  r2 = ((b-a).*rand(N, 1, 'double')+a).*(x(:,1) == 1 & x(:,2) == 1 & x(:,3) == 0);
  r3 = ((b-a).*rand(N, 1, 'double')+a).*(x(:,1) == 1 & x(:,2) == 0 & x(:,3) == 1);
  r4 = ((b-a).*rand(N, 1, 'double')+a).*(x(:,1) == 1 & x(:,2) == 0 & x(:,3) == 0);
  r5 = ((b-a).*rand(N, 1, 'double')+a).*(x(:,1) == 0 & x(:,2) == 1 & x(:,3) == 1);
  r6 = ((b-a).*rand(N, 1, 'double')+a).*(x(:,1) == 0 & x(:,2) == 1 & x(:,3) == 0);
  r7 = ((b-a).*rand(N, 1, 'double')+a).*(x(:,1) == 0 & x(:,2) == 0 & x(:,3) == 1);
  r8 = ((b-a).*rand(N, 1, 'double')+a).*(x(:,1) == 0 & x(:,2) == 0 & x(:,3) == 0);

  r3 = r3-r1/2;
  r8 = r8/4+r7/4+r6/2;

  y = [r1 , r2, r3, r4, r5, r6, r7, r8];
  y = r1+r2+r3+r4+r5+r6+r7+r8;
  g = x(:,5);

  tikz.markersizedatapoints = 5;
  tikz.markersizemeanvalues = 10;
  for inx = 1:1:max(size(unique(g)))
    scatter(config{1}.ax(1), unique(g)(inx), mean(y(g == unique(g)(inx))),                                       tikz.markersizemeanvalues, 'filled', 'MarkerFaceColor', color{inx+1})
    scatter(config{1}.ax(1), g(g == unique(g)(inx)), y(g == unique(g)(inx)),                                     tikz.markersizedatapoints,           'MarkerEdgeColor', color{inx+1})
    scatter(config{1}.ax(1), g(g == unique(g)(inx) & y <= lowerlimit), y(g == unique(g)(inx) & y <= lowerlimit), tikz.markersizedatapoints, 'filled', 'MarkerFaceColor', color{inx+1})
    scatter(config{1}.ax(1), g(g == unique(g)(inx) & y >= upperlimit), y(g == unique(g)(inx) & y >= upperlimit), tikz.markersizedatapoints, 'filled', 'MarkerFaceColor', color{inx+1})
    groupsize(inx) = max(size(y(g == unique(g)(inx))));
  end
  groupsize

  line([0 6],[upperlimit upperlimit], 'LineStyle', '--');
  line([0 6],[lowerlimit lowerlimit], 'LineStyle', ':');

  boxplot(y, g);

  set(gca, 'xtick',[1:1:5]);
  set(gca, 'xticklabel', {'Mon','Tue','Wed','Thu','Fri'})
  xlabel(gca, 'Day', 'FontSize', 20);
  ylabel(gca, 'Average Velocity for each Delivery $\frac{km}{h}$', 'FontSize', 20);
  title('Demo Boxplot', 'FontSize', 25);

  xlim([0 6]);
  ylim([0 70]);

  m2t_export(config{1}.ax(1), config{1}.fig(1), tikz.texfilename, num2str(1), tikz);
end