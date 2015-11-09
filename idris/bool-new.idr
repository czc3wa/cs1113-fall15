module bool

data bool = true | false

id: bool -> bool
id b = b

constTrue: bool -> bool
--constTrue true = true
--constTrue false = true
constTrue b = true

constFalse: bool -> bool
constFalse b = false

not: bool -> bool
not true = false
not false = true
