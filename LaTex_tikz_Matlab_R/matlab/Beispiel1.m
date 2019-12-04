function Beispiel1()

  initialize();
  color = colorlist();

  number_of_figures = 1;
  number_of_axes    = 4;

  config = create_figures_and_load_saved_position(number_of_figures, number_of_axes);
  reposition_subplots(config, number_of_axes);

  xLabelFontSize = 16;
  yLabelFontSize = 10;
  singleYlabel   = false; % <= special options to switch between one label per plot or a common label for all plots
  markersize     = 5;  

  tikz             = tikzoptions();
  tikz.texfilename = 'Beispiel1';
  tikz.subplot     = 1;

  x = 1:1:50;
  y1 = randi([0 10], 1, max(size(x)));
  y2 = 10*sin(x/(2*pi));
  y3 = y1+y2;
  y4 = 10*cos(x/(2*pi));

  scatter(config{1}.ax(1), x, y1, markersize, 'MarkerEdgeColor', color{2});
  scatter(config{1}.ax(2), x, y2, markersize, 'MarkerEdgeColor', color{4});
  scatter(config{1}.ax(3), x, y3, markersize, 'filled', 'MarkerFaceColor', color{5});
  plot(   config{1}.ax(4), x, y3, 'Color', color{5});
  plot(   config{1}.ax(4), x, y4, 'Color', color{3}, 'LineStyle', '--', 'LineWidth', 4);

  title(config{1}.ax(1), 'Multi Subplot Demo', 'FontSize', 25);
  xlabel(config{1}.ax(number_of_axes), 'Variation', 'FontSize', xLabelFontSize)
  ylabel(config{1}.ax(1), 'Test 1', 'FontSize', yLabelFontSize)
  ylabel(config{1}.ax(2), 'Test 2', 'FontSize', yLabelFontSize)
  ylabel(config{1}.ax(3), 'Test 3', 'FontSize', yLabelFontSize)
  ylabel(config{1}.ax(4), 'Test 4', 'FontSize', yLabelFontSize)
  
  ylim(config{1}.ax(1), [-2 12]);
  ylim(config{1}.ax(2), [-15 15]);
  ylim(config{1}.ax(3), [-10 25]);
  ylim(config{1}.ax(4), [-25 25]);

  for inx = 1:number_of_axes    
    ylabelxpos(inx) = get(get(config{1}.ax(inx), 'ylabel'), 'position')(1);
    ylabelypos(inx) = get(get(config{1}.ax(inx), 'ylabel'), 'position')(2);
    ytickval = get(config{1}.ax(inx), 'ytick');
    set(config{1}.ax(inx), 'ytick', ytickval(2:max(size(ytickval))-1));
  end

  if singleYlabel == true
    for inx = 1:number_of_axes
      ylabel(config{1}.ax(inx), []);
    end
    ylabel(config{1}.ax(round(number_of_axes/2)), 'Response', 'FontSize', yLabelFontSize);
    set(get(config{1}.ax(round(number_of_axes/2)), 'ylabel'), 'position', [min(ylabelxpos) ylabelypos(round(number_of_axes/2)) 0]);
  else
    for inx = 1:number_of_axes
      set(get(config{1}.ax(inx), 'ylabel'), 'position', [min(ylabelxpos) ylabelypos(inx) 0])
    end
  end

  m2t_export(config{1}.ax(1), config{1}.fig(1), tikz.texfilename, num2str(1), tikz); 
end