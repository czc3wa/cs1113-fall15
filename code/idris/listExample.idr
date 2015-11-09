module listExample

import Android
import bool
import list



lgg4: Phone
lgg4 = mkPhone "LGG4" 4 400 true

onePlus: Phone
onePlus = mkPhone "one plus two" 2 300 true

iPhone: Phone
iPhone = mkPhone "iPhone 6" 6 600 false

samsung: Phone
samsung = mkPhone "Samsung S6" 6 500 true

allPhones: list Phone
allPhones = lgg4 :: onePlus :: iPhone :: samsung :: nil

-- expecting true :: true :: false :: true :: nil
l1: list bool
l1 = map ifWorth allPhones

-- expecting mkPhone "LGG4" 4 400 true ::
--mkPhone "one plus two" 2 300 true ::
--mkPhone "Samsung S6" 6 500 true :: nil
l2: list Phone
l2 = filter ifWorth allPhones
