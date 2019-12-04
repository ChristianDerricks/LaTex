function Beispiel5()

  initialize();
  color = colorlist();

  number_of_figures = 1;
  number_of_axes    = 1;

  config = create_figures_and_load_saved_position(number_of_figures, number_of_axes);
  grid(config{1}.ax(1), 'off');

  tikz             = tikzoptions();
  tikz.texfilename = 'Beispiel5';

  xLabelFontSize = 16;
  yLabelFontSize = 12;

  N = 300;
  upperlimit = 40;
  lowerlimit = 20;
  x = [ randi([0 1], N, 4) , [randi([1 4], N/2, 1) ; randi([3 5], N/2, 1)]];
  x = [ (1:1:N)' , x ];

  inx1 = 2; inx2 = 3; inx3 = 4;  
  a = 2; b = 15; r1 = (a.*randn(N,1) + b).*(x(:,inx1) == 1 & x(:,inx2) == 1 & x(:,inx3) == 1);
  a = 2; b = 15; r2 = (a.*randn(N,1) + b).*(x(:,inx1) == 1 & x(:,inx2) == 1 & x(:,inx3) == 0);
  a = 2; b = 15; r3 = (a.*randn(N,1) + b).*(x(:,inx1) == 1 & x(:,inx2) == 0 & x(:,inx3) == 1);
  a = 2; b = 15; r4 = (a.*randn(N,1) + b).*(x(:,inx1) == 1 & x(:,inx2) == 0 & x(:,inx3) == 0);
  a = 5; b = 30; r5 = (a.*randn(N,1) + b).*(x(:,inx1) == 0 & x(:,inx2) == 1 & x(:,inx3) == 1);
  a = 3; b = 38; r6 = (a.*randn(N,1) + b).*(x(:,inx1) == 0 & x(:,inx2) == 1 & x(:,inx3) == 0);
  a = 5; b = 25; r7 = (a.*randn(N,1) + b).*(x(:,inx1) == 0 & x(:,inx2) == 0 & x(:,inx3) == 1);
  a = 5; b = 35; r8 = (a.*randn(N,1) + b).*(x(:,inx1) == 0 & x(:,inx2) == 0 & x(:,inx3) == 0);

  y = [r1, r2, r3, r4, r5, r6, r7, r8];
  y = r1+r2+r3+r4+r5+r6+r7+r8;

  tikz.markersizedatapoints = 50;

  group = 0;
  sum_member = 1;

  for g1 = 0:1:1
    for g2 = 0:1:1
      for g3 = 0:1:1
        group += 1;
        value(group) = {y(x(:,inx1) == g1 & x(:,inx2) == g2 & x(:,inx3) == g3)};        
        position{group} = sum_member:1:sum_member + max(size(value{group})) - 1;
        zmax(group)  = max(position{group});
        zmean(group) = mean(position{group});
        sum_member  += max(size(value{group}));
      end
    end
  end

  scatter(config{1}.ax(1), position{1}', value{1}, tikz.markersizedatapoints,           'MarkerFaceColor', color{2}, 'MarkerEdgeColor', 'none');
  scatter(config{1}.ax(1), position{2}', value{2}, tikz.markersizedatapoints,           'MarkerFaceColor', 'none',   'MarkerEdgeColor', color{2}, 'Linewidth', 1);
  scatter(config{1}.ax(1), position{3}', value{3}, tikz.markersizedatapoints,           'MarkerFaceColor', color{3}, 'MarkerEdgeColor', 'none');
  scatter(config{1}.ax(1), position{4}', value{4}, tikz.markersizedatapoints,           'MarkerFaceColor', 'none',   'MarkerEdgeColor', color{3}, 'Linewidth', 1);  
  scatter(config{1}.ax(1), position{5}', value{5}, tikz.markersizedatapoints, 'square', 'MarkerFaceColor', color{4}, 'MarkerEdgeColor', 'none');
  scatter(config{1}.ax(1), position{6}', value{6}, tikz.markersizedatapoints, 'square', 'MarkerFaceColor', 'none',   'MarkerEdgeColor', color{4}, 'Linewidth', 1);
  scatter(config{1}.ax(1), position{7}', value{7}, tikz.markersizedatapoints, 'square', 'MarkerFaceColor', color{5}, 'MarkerEdgeColor', 'none');
  scatter(config{1}.ax(1), position{8}', value{8}, tikz.markersizedatapoints, 'square', 'MarkerFaceColor', 'none',   'MarkerEdgeColor', color{5}, 'Linewidth', 1);

  for lindx = 1:7    
    line(config{1}.ax(1), [zmax(lindx)+0.5 zmax(lindx)+0.5], [0 50], 'LineStyle', '--', 'Color', color{1});
  end

  sector = {'I','II','III','IV','V','VI','VII','VIII'};
  for lindx = 1:8 
    text(zmean(lindx)-1, 2, sector{lindx})
  end

  xlabel(config{1}.ax(1), '$Deliveries sorted by Driver$', 'FontSize', 20);
  ylabel(config{1}.ax(1), 'Average Velocity for each Delivery $\left[\frac{km}{h}\right]$', 'FontSize', 20);
  title('Demo Scatter Plot with auto grouping', 'FontSize', 25);

  xlim(config{1}.ax(1), [0 N]);
  ylim(config{1}.ax(1), [0 50]);

 % m2t_export(gca, gcf, tikz.texfilename, num2str(1), tikz);
end