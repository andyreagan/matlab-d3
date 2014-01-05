% making a simple plot
%
% written by Andy Reagan, 2014

x = linspace(-2,2,10);
y_line = sin(x)  + x.^3;
y = y_line + randn(size(x));

plot(x,y_line,'LineStyle','-','Color',0.7*ones(1,3));
hold on;
plot(x,y,'LineStyle','none','Marker','o','MarkerSize',5,'MarkerFaceColor','b','MarkerEdgeColor','k');

% can't do this
% saveas(1,'simpleplot.svg');

% make this, just for comparison
saveas(1,'simpleplot.eps');


% no styling, not yet supported
svgplot('simpleplot.svg',x,y);

