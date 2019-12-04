function Beispiel0()

  initialize();           % a set of clear and load commands 
  color = colorlist();    % loading a set of 8 colors that are distinguishable even for colorblind people

  number_of_figures = 2;  % number of figures
  number_of_axes    = 1;  % number of axes per figure

  config = create_figures_and_load_saved_position(number_of_figures, number_of_axes);

  tikz             = tikzoptions(); % a set of predefined options for matlab2tikz 
  tikz.texfilename = 'Beispiel0';   % single settings can be overwritten after loading
  tikz.makelegend  = 1;
  tikz.legend      = 'Variation 1, Variation 2';

  % ============================== Plot Setup ==================================================

  x = 1:1:200;
  y1 = 10*sin(x/(10*pi));
  y2 = 10*cos(x/(10*pi));

  plot(config{1}.ax(1), x, y1, 'Color', color{2}, 'LineStyle', '--', 'LineWidth', 2);
  plot(config{1}.ax(1), x, y2, 'Color', color{3},                    'LineWidth', 1);
  plot(config{2}.ax(1), x, y2, 'Color', color{4});

  for inx = 1:1:number_of_figures
         title(config{inx}.ax(1), ['A simple plot exported with matlab2tikz', num2str(inx)], 'FontSize', 14);
        xlabel(config{inx}.ax(1), 'Variation',                                               'FontSize', 12);
        ylabel(config{inx}.ax(1), 'Test 1',                                                  'FontSize', 12);
  end

  % ============================================================================================
  
  for inx = 1:1:number_of_figures
    m2t_export(config{inx}.ax(1), config{inx}.fig(inx), tikz.texfilename, num2str(inx), tikz); 
  end

end