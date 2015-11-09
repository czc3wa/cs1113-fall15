module colors

import pair
import bool

%default total

data color = red | blue | green | cyan | magenta | yellow

complement: color -> color
complement red = cyan
complement green = magenta
complement blue = yellow
complement cyan = red
complement magenta = green
complement _ = blue

additive: color -> bool
additive red = true
additive green = true
additive blue = true
additive _ = false

subtractive: color -> bool
subtractive c = not (additive c)

complements: pair color color -> bool
complements (mkPair red cyan) = true
complements (mkPair red _) = false
complements (mkPair green magenta) = true
complements (mkPair green _) = false
complements (mkPair blue yellow) = true
complements (mkPair cyan red) = true
complements (mkPair cyan _) = false
complements (mkPair magenta green) = true
complements (mkPair magenta _) = false
complements (mkPair yellow blue) = true
complements (mkPair yellow _) = false

mixink: pair color color -> color
mixink (mkPair cyan magenta) = blue
mixink (mkPair cyan yellow) = green
mixink (mkPair magenta cyan) = blue
mixink (mkPair magenta yellow) = red
mixink (mkPair yellow cyan) = green
mixink (mkPair yellow magenta) = red


 

