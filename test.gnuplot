set datafile separator ","
set xrange [-2:2]
set yrange [-2:2]
plot 'test.csv' using 1:2 w l
