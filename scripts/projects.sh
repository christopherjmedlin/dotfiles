DMENU_ARGS="-m 0 -fn monospace:size=9 -nb #000000 -nf #eeeeee -sb #000000 -sf #AA0000"

folder=$(ls -1 /home/$USER/projects/ | dmenu $DMENU_ARGS)

cd /home/$USER/projects/$folder
vim
