function calculate_average(total, divider){
	return total / divider
}
BEGIN {
	FS=","
}
{
	# skip first row with column names
	if (NR != 1) {
		gradeSum[$1] = $3 + $4 + $5
		# names associative array since I am using id as the unique identifier instead of 
		# gradeSum[name] = sum (two students may have same first name).
		names[$1] = $2
	}
}
END {
	# max score is 300
	min = 301
	# min score is 0
	max = -1
	maxName = ""
	minName = ""

	for(id in gradeSum) {
		# track max and min scorer
		print "Name: " names[id]
		print "Total score: " gradeSum[id]
		if (gradeSum[id] > max) {
			max = gradeSum[id]
			maxName = names[id]
		}
		if (gradeSum[id] < min) {
			min = gradeSum[id]
			minName = names[id]
		}

		# calculate average 
		avg = calculate_average(gradeSum[id], 3)
		print "Average: " avg
		if (avg >= 70) {
			print "pass"
		}
		else {
			print "fail"
		}
	}
	print "Top scorer: "  maxName
	print "Lowest scorer: "  minName
}
