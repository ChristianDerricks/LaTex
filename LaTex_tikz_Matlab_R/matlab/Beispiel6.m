function Beispiel6()

  initialize();
  color = colorlist();

  number_of_figures = 1;
  number_of_axes    = 1;

  config = create_figures_and_load_saved_position(number_of_figures, number_of_axes);

  tikz = tikzoptions();
  tikz.texfilename = 'Beispiel6';

  xLabelFontSize = 16;
  yLabelFontSize = 12;

  x = 1:1:30;
  y = 1:1:30;
  [xx, yy] = meshgrid(x, y);
  z = xx.^2+100*sin(yy);

  owncolormap = [0 ,0 ,0];  
  for inx = 1:1:max(size(color))
    owncolormap = [owncolormap ; color{inx}];
  end  
  owncolormap = owncolormap(2:9, :);
  owncolormap = sortrows(owncolormap, [1,2])
  owncolormap = [owncolormap ; (owncolormap(1,:)+owncolormap(7,:))/2];
  owncolormap = sortrows(owncolormap, [1,2]);
  
%  plot(config{1}.ax(1),1:1:9, owncolormap(:,1))
%  plot(config{1}.ax(1),1:1:9, owncolormap(:,2))
%  plot(config{1}.ax(1),1:1:9, owncolormap(:,3))

  owncolormap = owncolormap/255;
  cmap = colormap(colorb);
%  size(z);
%  Zcolor = zeros(size(z));
%  threshold = 200;
%
%  error('asd')
%  inter = 1;
%  step = threshold/(max(size(cmap))-1);
%  Zcolor(z >=  0 & z < threshold/max(size(cmap))) = 1;  % first color
%  for inx = 1:(max(size(cmap))- 1)
%    Zcolor(z > step*inx & z < step*(inx+1)) = inter;  % intermediate color values
%    inter = inter + 1;
%  end
%  Zcolor(z >= threshold - 1)   = max(size(cmap)); % last color for all z values above threshold

  tikz.h = colorbar(config{1}.ax(1));
  ylabel(tikz.h, '$x^{2}+100\cdot\sin\left(y\right)$', 'FontSize', 20);

  set(tikz.h, 'ytick', [10 15 20 25 30 40 50 60 70]);
  
  colormap(config{1}.ax(1), cmap)
  surf(config{1}.ax(1), x,y,z)

  title(config{1}.ax(1), 'Demo Surface Plot', 'FontSize', 25);
  xlabel(config{1}.ax(1), 'variable x', 'FontSize', xLabelFontSize)
  ylabel(config{1}.ax(1), 'variable y', 'FontSize', yLabelFontSize)
  zlabel(config{1}.ax(1), 'i am invisible')
  
  xlim(config{1}.ax(1), [1 30])
  ylim(config{1}.ax(1), [1 30])
  set(config{1}.ax(1), 'xtick', [10 15 20 25 30])

  %m2t_export(config{1}.ax(1), config{1}.fig(1), tikz.texfilename, num2str(1), tikz);
end