#! /bin/bash

<<comment1
	References:
	1. https://en.wikibooks.org/wiki/Bash_Shell_Scripting
	2. https://en.wikipedia.org/wiki/Tower_of_Hanoi
	3. https://futureboy.us/pgp.html
comment1

echo -n 'Number of disks to move: '
read n

<<comment2  
	Providing a recursive implementation of the tower of Hanoi
	Idea here is to break the solution into smaller problems.
	However, although recursive solution is elegant but for larget number 
	of disks, the stack size of the program incurs considerable overhead.

	I would say that did a bash script after a long time, as originally, I 
	was attempting to consider source, auxillary and target as stacks, 
	however, it was prooving to be complex.
comment2

swaps_done=0

tower_of_hanoi()
{ 
	source=$2
	auxilliary=$3
	target=$4
	if [ $1 -gt 0 ];
	then
		#Move n-1 disks from source to auxilliary
		tower_of_hanoi "$(($1-1))" $source $auxilliary $target
		
		echo Moved $n disk from $source to $target
	        swaps_done=$(($swaps_done + 1))	
		
		#Move n-1 disks back from auxilliary to target 
		tower_of_hanoi "$(($1-1))" $auxilliary $target $source
	fi

}

tower_of_hanoi $n 1 2 3
echo "It took $swaps_done moves to solve Towers for $n disks."

