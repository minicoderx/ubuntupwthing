
#!/bin/bash
#reset pw thing

#clear txt files
> user.txt
> userpw.txt

for i in $(sudo awk -F':' '$2 ~ "\$" {print $1}' /etc/shadow); do

	#write users to file
	echo $i >> user.txt

	#echo $i
done

#echo "reading file..."

while read file; do
	#echo $file

	#generate  random pw
	password=$(( ( RANDOM %10000000 ) + 10000000))

	#change pw
	echo -e "$password\n$password" | sudo passwd $file

	#write user/pw to file
	echo -e "$file\t$password" >> userpw.txt

done < user.txt

#echo 'out'




