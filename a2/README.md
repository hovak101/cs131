<h1>Beautify</h1>
<h2>What This Command Does</h2>
This command inputs a delimiter seperated values file(like a CSV or TBV) and outputs a more readable and labeled format for the first n entries in the file. 

<h2>Why/When This Command Is Useful</h2>
This command is useful when trying to determine the column numbers of a delimiter seperated values file. It's alsouseful for gauging the type of data contained in such a file. 

<h2>How To Use This Command</h2>
The command has the following syntax: 

	beautify -d<delimiter> -n<first n entries> -i<index start value> <file path>

Note that all the flags(options starting with -) are optional and the their order does not matter. However, the flags must all come before the file path. Furthermore, the file path cannot be omitted. For example, the following commands are all valid: 

	beautify /path/to/file
	beautify -d: /path/to/file
	beautify -d, -i0 -n13 /path/to/file
	beautify -n13 -d, -i1 /path/to/file

The following commands are NOT valid: 

	beautify
	beautify /path/to/file -d, (flag comes after file path)
	beautify -d,               (no file path)
	beautify -d /path/to/file  (delimiter flag is used, but no value is specified)

When a flag is omitted, the following default values are used: 

	-d: ,  (delimiter is ,)
	-n: 5  (first 5 values are shown)
	-i: 1  (1-indexing

<h2>Examples</h2>

	in a2 directory:
 
	command: 
		beautify ../ws3/2019-01-h1.csv
	output:
		1         2                             3                             4                5              6           7                   8             9             10            11         >
		vendorid  tpep_pickup_datetime          tpep_dropoff_datetime         passenger_count  trip_distance  ratecodeid  store_and_fwd_flag  pulocationid  dolocationid  payment_type  fare_amount>
		1.0       "2019-01-01 00:46:40.000000"  "2019-01-01 00:53:20.000000"  1.0              1.5            1.0         N                   151.0         239.0         1.0           7.0        >
		1.0       "2019-01-01 00:59:47.000000"  "2019-01-01 01:18:59.000000"  1.0              2.6            1.0         N                   239.0         246.0         1.0           14.0       >
		2.0       "2018-12-21 13:48:30.000000"  "2018-12-21 13:52:40.000000"  3.0              0.0            1.0         N                   236.0         236.0         1.0           4.5        >
		2.0       "2018-11-28 15:52:25.000000"  "2018-11-28 15:55:45.000000"  5.0              0.0            1.0         N                   193.0         193.0         2.0           3.5        >

	command: 
		beautify -d, -n10 -i0 ~/cs131/ws3/2019-01-h1.csv
	output:
		0         1                             2                             3                4              5           6                   7             8             9             10         >
		vendorid  tpep_pickup_datetime          tpep_dropoff_datetime         passenger_count  trip_distance  ratecodeid  store_and_fwd_flag  pulocationid  dolocationid  payment_type  fare_amount>
		1.0       "2019-01-01 00:46:40.000000"  "2019-01-01 00:53:20.000000"  1.0              1.5            1.0         N                   151.0         239.0         1.0           7.0        >
		1.0       "2019-01-01 00:59:47.000000"  "2019-01-01 01:18:59.000000"  1.0              2.6            1.0         N                   239.0         246.0         1.0           14.0       >
		2.0       "2018-12-21 13:48:30.000000"  "2018-12-21 13:52:40.000000"  3.0              0.0            1.0         N                   236.0         236.0         1.0           4.5        >
		2.0       "2018-11-28 15:52:25.000000"  "2018-11-28 15:55:45.000000"  5.0              0.0            1.0         N                   193.0         193.0         2.0           3.5        >
		2.0       "2018-11-28 15:56:57.000000"  "2018-11-28 15:58:33.000000"  5.0              0.0            2.0         N                   193.0         193.0         2.0           52.0       >
		2.0       "2018-11-28 16:25:49.000000"  "2018-11-28 16:28:26.000000"  5.0              0.0            1.0         N                   193.0         193.0         2.0           3.5        >
		2.0       "2018-11-28 16:29:37.000000"  "2018-11-28 16:33:43.000000"  5.0              0.0            2.0         N                   193.0         193.0         2.0           52.0       >
		1.0       "2019-01-01 00:21:28.000000"  "2019-01-01 00:28:37.000000"  1.0              1.3            1.0         N                   163.0         229.0         1.0           6.5        >
		1.0       "2019-01-01 00:32:01.000000"  "2019-01-01 00:45:39.000000"  1.0              3.7            1.0         N                   229.0         7.0           1.0           13.5       >	
