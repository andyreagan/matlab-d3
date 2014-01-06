NOTES
=====

2014-01-04

The first road, making an SVG in matlab and styling it with D3, is a dead end.
- First, matlab doesn't make SVGs
- And I'm not about to write an SVG backend for matlab

Now, I'll attempt to generate a d3 skeleton from matlab figure instance.
This requires pulling apart the matlab figure instance.
For starters, I'll pull out text, lines, and circles.