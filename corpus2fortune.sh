#!/usr/bin/env zsh
awk '
	/\[/ { 
		capture=1
	} 
	/\]/ { 
		capture=0 
	} 
	{ 
		if(capture) { 
			print $0 
		} 
	}' | grep -v '\[' | grep -v '{' | 
	sed '
		s/^[ \t]*"//;
		s/",*$//;
		s/$/\n%/g' > $1
strfile $1 $1.dat

