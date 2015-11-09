module stopLight

data stopLight = green | amber | red

nextColor: stopLight -> stopLight
nextColor green = amber
nextColor amber = red
nextColor red = green
