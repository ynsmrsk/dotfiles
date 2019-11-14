setxkbmap -model pc101 -layout en
setxkbmap -option caps:swapescape
setxkbmap -option escape:swapcaps
hsetroot -solid "#596f7b"
xset r rate 200 100
unclutter -idle 2 &
exec i3
