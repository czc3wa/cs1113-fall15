module Android

import Essential
import relation

 {-First field represents the name of the phone, second represents the  
 version of the phone and the third field states the price and fourth states whether the phone is
 worth the dollar -}
 
record Phone where
       constructor mkPhone
       name : String
       version : Nat
       price : Nat
       ifWorth : bool


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

totalPrice: Nat
totalPrice = query2 allPhones ifWorth price plus 0

numberAndroid: Nat
numberAndroid = count_rel allPhones ifWorth

totalPrice2: Nat
totalPrice2 = sum_rel allPhones ifWorth price

totalVers: Nat
totalVers = sum_rel allPhones ifWorth version

avePrice: pair Nat Nat
avePrice = mkPair totalPrice numberAndroid


aveVers: pair Nat Nat
aveVers = mkPair totalVers numberAndroid
