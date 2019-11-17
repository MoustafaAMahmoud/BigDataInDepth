#!/bin/sh

#xelatex -jobname=Ch00-CourseOverview '\includeonly{Ch00-CourseOverview/CourseOverview}\input{main}'
echo "First arg: $1";

if (( $# != 1 ))
then
  echo "Empty arguement exit: ...";
  exit 1;
elif [ $1 == "rc" ]
then
	cat preamble/preamble_rc_settings.tex > preamble/presentation-mode.tex;
elif [ $1 == "ps" ]
then
	cat preamble/preamble_video_settings.tex > preamble/presentation-mode.tex;
else
	echo "wrong arguement";
	exit 1;
fi;
xelatex "main".tex;
for dir in Ch*/
do
    for file in "$dir"*.tex
    do
        if [[ -f $file ]]
        then
        	echo "process file $file";
        	outputPDF="$(basename "${file}" .tex)";
        	echo "$outputPDF-presentation";
        	inputTex="${file%.tex}";
        	echo "$inputTex";
	        	if [ $1 == "rc" ] #still under testing
				then
				  	echo "Release mode running";
		            rcFile=$outputPDF"-rc";
	    	    	echo "$rcFile";
	        	    sed -i 's/\[<+->\]/ /g' $file;
	            	sed -i 's/smartdiagramanimated/smartdiagram/g' $file; 
	            	#xelatex -jobname=$rcFile "\includeonly{$inputTex}\input{main}";
				else [ $1 == "ps" ]
				  	echo "Presenetation mode running";
				  	xelatex -jobname=$outputPDF "\includeonly{$inputTex}\input{main}";
				fi;  	
        fi;
    done;
done;
xelatex "main".tex;