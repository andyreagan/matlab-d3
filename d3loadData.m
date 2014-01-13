function d3loadData(f,fname,iter)

fprintf(f,'d3.csv("%s_%02d.csv", function(error, data) {\n',fname,iter);
fprintf(f,'  data.forEach(function(d) {\n');
fprintf(f,'    d.x = d.x;\n');
fprintf(f,'    d.y = d.y;\n');
fprintf(f,'  });\n');
fprintf(f,'    data%02d = data;\n',iter);
fprintf(f,'    if (!--csvLoadsRemaining) loaded(d3.select("#figure01"));\n');
fprintf(f,'});\n');