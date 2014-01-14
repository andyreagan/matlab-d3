function d3loadData(f,fname,iter,figure_hash,plot_hash)

fprintf(f,'d3.text("%s_%s%02d.csv", function(text) {\n',fname,figure_hash,iter);
fprintf(f,'    var data = d3.csv.parseRows(text).map(function(row) {\n');
fprintf(f,'      return row.map( function(value) {\n');
fprintf(f,'        return +value;\n');
fprintf(f,'      });\n');
fprintf(f,'    });\n');
fprintf(f,'    data_%s%02d = data;\n',figure_hash,iter);
fprintf(f,'    console.log(data_%s%02d);',figure_hash,iter);
fprintf(f,'    if (!--csvLoadsRemaining) plot%s(d3.select("#figure%s"));\n',plot_hash,figure_hash);
fprintf(f,'});\n');