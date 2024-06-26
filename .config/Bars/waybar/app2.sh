#!/bin/bash
function app(){
	echo -n "App: "
	A=$(hyprctl activewindow | grep title)
	hyprctl activewindow | grep "Invalid" > /dev/null
	if [ "$?" == "0" ]; then
		echo -n ""
		return 0
	fi
	echo $A | grep "Chrome$" > /dev/null
	if [ "$?" == "0" ]; then
		echo -n ""
		return 0
	fi
	echo $A | grep "nano" > /dev/null
	if [ "$?" == "0" ]; then
		echo -n ""
		return 0
	fi
	hyprctl activewindow | grep "class" | grep "kitty" > /dev/null
	if [ "$?" == "0" ]; then
		echo -n ""
		return 0
	fi
	echo -n ""
	return 0
}
#app
current=$(hyprctl activewindow | head -n 1 | cut -d ' ' -f 2)
cur=0
C=0

for i in $(hyprctl clients | grep Window | cut -d ' ' -f 2)
do
	if [ "$current" == "$i" ]; then
		cur=$C
	fi
	((C++))
done

D=0
C=0
#B=$(hyprctl activewindow | grep workspace | cut -d ':' -f 2 | cut -d ' ' -f 2)
B=$(hyprctl monitors | grep workspace | cut -d ':' -f 2 | cut -d ' ' -f 2)
#echo -n "Apps[$B]: "
echo -n "[$B]]:"
#echo -n "  ["

declare -a arr
C=0
for i in $(hyprctl clients | grep workspace | cut -d ':' -f 2 | cut -d ' ' -f 2)
do
	if [ "$i" == "$B" ]; then
		arr[$C]="Y"
	else
		arr[$C]="N"
	fi
	((C++))
done
C=0
for i in $(hyprctl clients | grep "class:" | cut -d ':' -f 2)
do
	if [ "$C" == "$cur" ]; then
		hyprctl activewindow | grep title | grep nano > /dev/null
		if [ "$?" == "0" ]; then
			echo -n "  "
			D=1
			((C++))
			continue
		fi
	fi
	echo $i | grep "kitty" > /dev/null
	if [ "$?" == "0" ] && [ "${arr[C]}" == "Y" ]; then
		echo -n "  "
		D=1
		((C++))
		continue
	fi
	echo $i | grep "chrome" > /dev/null
	if [ "$?" == "0" ] && [ "${arr[C]}" == "Y" ]; then
		echo -n "  "
		D=1
		((C++))
		continue
	fi
	if [ "${arr[C]}" == "Y" ]; then
		echo -n "  "
		D=1
		((C++))
		continue
	fi
	((C++))
done
if [ "$D" == "0" ]; then
	echo -n " "
fi
exit 0
