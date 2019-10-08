setxkbmap -model pc101 -layout en
setxkbmap -option caps:swapescape
setxkbmap -option escape:swapcaps
xset r rate 200 100
unclutter -grab &
exec i3
