NOTES
=====

2014-01-04

The first road, making an SVG in matlab and styling it with D3, is a dead end.
- First, matlab doesn't make SVGs
- And I'm not about to write an SVG backend for matlab

Now, I'll attempt to generate a d3 skeleton from matlab figure instance.
This requires pulling apart the matlab figure instance.
For starters, I'll pull out text, lines, and circles.

2014-01-05

Along that line, today I pulled out the lines.
And on my zoo server, I have a version running with the circles.

The current running issue is axes. I'm drawing new ones for each line/ set of points,
and I want them to be the same axes.
This should be very do-able.

Then I'll add zoom and drag features.