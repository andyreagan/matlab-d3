function svgplot(fname,x_data,y_data,varargin)
% plotting utility to make simple SVG's
%
% written by Andy Reagan, 2014

f = fopen(fname,'w');

height = 400;
width = 800;
fprintf(f,'<svg width="%g" height="%g">\n',width,height);

x_data_scaled = x_data./max(x_data)*width;
y_data_scaled = y_data./max(y_data)*height;

for i=1:length(x_data)
    fprintf(f,'<circle cx="%g" cy="%g" r="40" stroke="black" stroke-width="3" fill="red"/>\n',x_data_scaled(i),y_data_scaled(i));
end

fprintf(f,'</svg>\n');
fclose(f);