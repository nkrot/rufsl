#!/usr/bin/env ruby

Encoding::default_external = 'Windows-1252'

key = id = input = ""
keys = Array.new

# krot: Masha, hardcoding input files is a bad idea!
# Instead, get the filename from the command line like this:
report_file = ARGV.shift
# provided that the script is run as follows:
# > my_tc_extract syn_qa.full testcase_file(s)
IO.foreach(report_file, sep="case_end\n") do |block|
	# krot: this check will not work for cases when reqstate and state go in another order.
	#       see my tc_extract_changed_to_success for an alternative
	if block =~ /reqstate\t(FAILED|UNKNOWN)\nstate\tSUCCESS/
		if block =~ /input\t+(.+)\n/
			input = $1
		end
		if block =~ /id\t+(.+)\n/
			id = $1
		end
		key = id + input
		keys << key
		key = id = input = ""
	end
end

while line = gets(sep="case_end\n") # krot: gets("case_end\n") is enough
	if line =~ /input\t+(.+)\n/
		input = $1
	end
	if line =~ /id\t+(.+)\n/
		id = $1
	else 
		id = ""
	end
	key = id + input
	if keys.include?(key) && line =~ /^reqstate\s/i # krot: you'd better check that this is the line holding reqstate!
		line.gsub!(/^(reqstate\s+)FAILED/i, "\\1SUCCESS")
	end
	puts line
end

