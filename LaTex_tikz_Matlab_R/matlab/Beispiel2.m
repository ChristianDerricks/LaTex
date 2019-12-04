function Beispiel2()

  initialize();
  color = colorlist();

  number_of_figures = 2;
  number_of_axes    = 1;

  config = create_figures_and_load_saved_position(number_of_figures, number_of_axes);

  tikz             = tikzoptions();
  tikz.barplot     = 1;
  tikz.texfilename = 'Beispiel2';  
  tikz.makelegend  = 1;
  tikz.legend      = 'Region 1, Region 2, Region 3';

  xLabelFontSize = 16;
  yLabelFontSize = 12;

  y = normrnd(30,10,100000,1);

  binwidth = 1;
  xbins = (-10:binwidth:70);
  [ydata, xdata] = hist(y, xbins);
  xbins1 = (-10:binwidth:70)-binwidth/2;
  [ydata1, xdata1] = hist(y, xbins1);

  barwidth = 1;
  bar(config{1}.ax(1), xdata(xdata >= 40), ydata(xdata >= 40),                         barwidth, 'FaceColor', color{3});
  bar(config{1}.ax(1), xdata(xdata > 20 & xdata < 40), ydata(xdata > 20 & xdata < 40), barwidth, 'FaceColor', color{4});
  bar(config{1}.ax(1), xdata(xdata <= 20), ydata(xdata <= 20),                         barwidth, 'FaceColor', color{2});

  bar(config{2}.ax(1), xdata1(xdata1 >= 40), ydata1(xdata1 >= 40),                           barwidth, 'FaceColor', color{3});
  bar(config{2}.ax(1), xdata1(xdata1 > 20 & xdata1 < 40), ydata1(xdata1 > 20 & xdata1 < 40), barwidth, 'FaceColor', color{4});
  bar(config{2}.ax(1), xdata1(xdata1 <= 20), ydata1(xdata1 <= 20),                           barwidth, 'FaceColor', color{2});

  [xnorm,ynorm] = fitnormdist(y);
  plot(config{1}.ax(1), xnorm, ynorm, 'Color', color{1}, 'LineStyle', '--', 'LineWidth', 1);
  plot(config{2}.ax(1), xnorm, ynorm, 'Color', color{1}, 'LineStyle', '--', 'LineWidth', 1);
  
  for inx = 1:number_of_figures
    title(config{inx}.ax(1), 'Demo Barplot', 'FontSize', 25);
    xlabel(config{inx}.ax(1), 'Variation [\%]', 'FontSize', xLabelFontSize)
    ylabel(config{inx}.ax(1), 'Häufigkeit', 'FontSize', yLabelFontSize)
    set(config{inx}.ax(1), 'xtick', [-20 -10 0 10 20 25 30 35 40 50 60 70 80])
    %m2t_export(config{inx}.ax(1), config{inx}.fig(1), tikz.texfilename, num2str(inx), tikz);
  end

  m2t_export(config{1}.ax(1), config{1}.fig(1), tikz.texfilename, num2str(1), tikz);
  
end