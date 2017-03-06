import os
import matplotlib.pyplot as plt
import sys
try:
    os.chdir('myfolder')
except:
    pass

import cython_test
import numpy as np
from math import pi as pi
x=0
v=0

N=3000

k=3.8
Q=30
w_0=2*pi*46.2E3
m=k/w_0**2
A0=45E-9
F_0=A0*k/Q #amplitude as calculated

w_m=w_0

dt=(2*pi/w_0)/100


import time

W_M=np.linspace(w_0/2,3*w_0/2,100)
Amp=np.zeros(len(W_M))
for i in range(len(W_M)):
    print(i)
    [X,V,T]=cython_test.move(x,v,dt,N,k,Q,F_0,W_M[i],m)
    X=X[int(len(X)*0.9):int(len(X)-1)]
    Amp[i]=X.max()-X.min()
    x=X[len(X)-1]
    v=V[len(V)-1]



plt.plot(W_M/w_0,Amp)
plt.show()
plt.plot(X)
plt.show()

