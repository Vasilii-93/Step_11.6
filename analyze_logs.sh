#!/bin/bash
{
echo
echo "Web Server Log Report"

echo "==========================="

awk '// { count++ } END { print "Total number of requests:", count }' access.log
awk '{ unique[$1]++ } END { print "Number of unique IP:", length(unique) }' access.log
echo
echo "Number of requests by methods:"

awk '{count[substr($6, 2)]++} END {for (n in count) print  count[n], n}' access.log
echo
awk '{count[$7]++} END {for (n in count) if (count[n] > max) {max = count[n]; most_pop = n}} END {print "Most popular URL:", max, mos
t_pop}' access.log
} > report.txt
echo "The Report has saved in file report.txt"
