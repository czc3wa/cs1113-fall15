def hs(n):
    y = 0 # counter 

    while n != 1:
        print(n)
        y = y + 1
        if (n % 2) == 0:
            n = n//2
        else:
            n = 3*n+1
    if n == 1:
        print(1)
        y = y + 1
        print(y)
            
