#!/bin/bash
# make c project script

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.


me=`basename "$0"` # to get the name of the script itself
usage="Usage mkcproj [make C project]: $me -n <project_name> -l <PCL|OPENCV> \n Example which prepare a project with PCL both OPENCV can be done either by: 
\n\n $me -n test -l po \n\n or by: \n\n $me -n test -l op\n\n"


opencv_use=false
pcl_use=false
project_name="default_project"
#check for input project name paramenter
while getopts “:n:l:h” OPTION
do
	  case $OPTION in
	    n)
	      project_name=$OPTARG
				echo project name: $project_name 
        ;;
	    l)
	      libraries="$OPTARG" 
				while read char; do
						if [ "$char" == "o" ] || [ "$char" == "O" ] 
						then
					    echo "Opencv library added to project $project_name."
							opencv_use=true
						elif [ "$char" == "p" ] || [ "$char" == "P" ] 
						then
					    echo "PCL library added to project $project_name."
							pcl_use=true
						else
							echo "unkown library $char"
						fi
				done < <(fold -w1 <<<"$libraries")
	      ;;
			h)
				printf "${usage}"
				exit 
				;;
	    ?)
	       echo "invalid argument $OPTION"
	       printf "${usage}"
				 exit 
	       ;;
	esac
done

mkdir $project_name
cd $project_name
mkdir build &> /dev/null
mkdir include &> /dev/null 
mkdir lib &> /dev/null
mkdir doc  &> /dev/null
cd doc	
doxygen -g config  &> /dev/null
cd .. 
mkdir -p src/examples &> /dev/null
rm CMakeLists.txt &> /dev/null
printf "cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
project($project_name)\n
" >> CMakeLists.txt
if [ "$opencv_use" = true ]
then
	printf "find_package(OpenCV REQUIRED)\n" >> CMakeLists.txt
fi
if [ "$pcl_use" = true ]
then
	printf "find_package(PCL 1.2 REQUIRED)\n\n" >> CMakeLists.txt
fi

# include_directories
printf "include_directories(./include" >> CMakeLists.txt
if [ "$pcl_use" = true ]
then
printf "\${PCL_INCLUDE_DIRS} " >> CMakeLists.txt
fi
if [ "$opencv_use" = true ]
then
	printf "\${OpenCV_INCLUDE_DIRS} " >> CMakeLists.txt
fi
printf ")" >> CMakeLists.txt


if [ "$pcl_use" = true ]
then
printf "link_directories(\${PCL_LIBRARY_DIRS})
add_definitions(\${PCL_DEFINITIONS})\n" >> CMakeLists.txt
fi





printf "\n\n#Example of linking: 
#add_executable( executable src/main.cpp )
#target_link_libraries( executable  \${OpenCV_LIBS})
#set_target_properties( executable PROPERTIES RUNTIME_OUTPUT_DIRECTORY \${PROJECT_SOURCE_DIR}/bin)" >> CMakeLists.txt

