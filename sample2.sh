#!/bin/sh

printMenu()
{
        echo "1) Make a directory in the current working directory"
        echo "2) Change working directory"
        echo "3) Rename a file or directory"
        echo "4) Delete a file or directory"
        echo "5) Copy a file"
        echo "0) Exit"
        echo "Current working directory: $(pwd)"
}

newDir()
{
      read -p "Type the name of the new directory: " input
      if [[   -d "$input" ]]; then
             echo "ERROR: This directory already exists"
      else
              mkdir "$input"
      fi
}

changeDir()
{
 	read -p "Type the name of the directory you want to change to: " input
     	if [[   -d "$input" ]]; then
		cd "$input"
	else
		echo "ERROR: This directory does not exist"
	fi
}

rename()
{
	read -p "Type the file/directory you want to rename: " input
	if [[   -f "$input"  ||   -d "$input" ]]; then
		read -p  "Now type the new name of the file/directory: " input2
		mv "$input" "$input2"
       else
         echo "ERROR: This file/directory does not exist. Try again."
fi
}

delete()
{
        read -p "Type the name of the file/directory you want deleted: " input
	if [[   -f "$input"  ||   -d "$input" ]]; then
		 rm -rf "$input"
       else	       
         echo "ERROR: This file/directory does not exist. Try again."
fi
}


copy()
{
        read -p "Type the name of the file you want copied: " input
	if [[   -f "$input"  ||   -d "$input" ]]; then
                 read -p "Type the name of the new file/where you want the file copied: " input2
		 cp "$input" "$input2"
      else
         echo "ERROR: This file/directory does not exist. Try again."
 fi  
}

main()
{
	printMenu
	read -p "What do you want to do (Enter the number) --> " choice
   while [[ ! $choice -eq 0 ]]; do
   if [[ "$choice" -eq 1 ]]; then
        newDir
        #break
   elif [[ "$choice" -eq 2 ]]; then
        changeDir
        #break
   elif [[ "$choice" -eq 3 ]]; then
        rename
        #break
   elif [[ "$choice" -eq 4 ]]; then
        delete
        #break
   elif [[ "$choice" -eq 5 ]]; then
        copy
        #break
   else
         echo "ERROR: That was not one of the listed options. Try again."
 	# break
 fi
 echo 
 printMenu
 read -p "What do you want to do --> " choice
done

}

main

