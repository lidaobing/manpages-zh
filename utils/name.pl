while(<>){
	s/^\.S([H|h])"?\s*名\s*字\s*(\(?NAME\)?"?)?.*$/\.S\1 NAME/;
	s/^\.S([Hh])\s*Name/\.S\1 NAME/;
	s/^\.S([Hh])\s*命令名/\.S\1 NAME/;
	s/^\.SH NAME \[?名字\]?/\.SH NAME/;
	print
}
