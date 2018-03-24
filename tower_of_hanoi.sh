#! /bin/bash

<<comment1
	References:
	1. https://en.wikibooks.org/wiki/Bash_Shell_Scripting
	2. https://en.wikipedia.org/wiki/Tower_of_Hanoi
	3. https://futureboy.us/pgp.html

	Providing a recursive implementation of the tower of Hanoi
	Idea here is to break the solution into smaller problems.
	However, although recursive solution is elegant but for larget number 
	of disks, the stack size of the program incurs considerable overhead.

	I would say that did a bash script after a long time, as originally, I 
	was attempting to consider source, auxillary and target as stacks, 
	however, it was prooving to be complex.

	The disk are numbered from 1 to n
	where if i < j then j is bigger than j

	There 3 slots, source, auxilliary, target.
comment1

#Function spec
tower_of_hanoi()
{ 
	if [ $1 -gt 0 ];
	then
		#Move n-1 disks from source to auxilliary
		tower_of_hanoi "$(($1-1))" $2 $4 $3
		
		#Moves nth disk from source to target
		echo Moved $1-th disk $2-slot to $3-slot
	        swaps_done=$(($swaps_done + 1))	
		
		#Move n-1 disks back from auxilliary to target 
		tower_of_hanoi "$(($1-1))" $4 $2 $3
	fi

}

swaps_done=0
echo -n 'Enter num disks: '
read n

#Loops until you enter a valid non-null input. Will need to add check for a valid integer.
while [[ -z "$n" ]]
do
	echo -n 'Enter valid num disks: '
	read n
done

if [ $n -lt 0 ]; then
	echo "Illegal value provided for disks, should be greater than 0"
else
	tower_of_hanoi $n 1 2 3
	echo "It took $swaps_done moves to solve Towers for $n disks."
fi
