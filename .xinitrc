setxkbmap -model pc101 -layout en
setxkbmap -option caps:swapescape
setxkbmap -option escape:swapcaps
hsetroot -solid "#0f191e"
xset r rate 200 100
unclutter -grab &
exec i3
