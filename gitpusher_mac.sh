#!/bin/bash
if [[ $# -eq 0 ]]
	then
		echo "No Arguments Supplied."
elif [[ $# -eq 1 ]]
	then
		echo "GitPusher requires 2 arguments; Only 1 was supplied."
elif [[ $# -eq 2 ]]
	then
		BRANCH_NAME=$2
		ALL_BRANCHES=`git show-branch --all | grep -w $BRANCH_NAME`
		if [[ $? == 0 ]]
		then 
			git add .
			git commit -m "$1"
			# Enter the absolute path of the text file 
			# containing your Personal Access Token
			pbcopy /absolute/path/to/your/file.txt
			git pull origin $2
			git push origin $2
		else
			echo "$BRANCH_NAME does not exist."
		fi
else
	echo "Invalid Number of Arguments."
fi

