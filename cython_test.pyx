

import numpy as np
cimport numpy as np
from skimage.util import view_as_windows
import cython



cdef int step = 16


arr = np.arange(1000*1000, dtype=np.float64).reshape(1000,1000)
windows = view_as_windows(arr, (step, step), step)

@cython.boundscheck(False)
def cython_test(np.ndarray[np.float64_t, ndim=4]  windows):
    cdef np.ndarray[np.float64_t, ndim=2] container = np.zeros((windows.shape[0], windows.shape[1]),dtype=np.float64)
    cdef int i, j
    I = windows.shape[0]
    J = windows.shape[1]
    for i in range(I):
        for j in range(J):
            container[i,j] = np.mean(windows[i,j])
    return container

def move(double x,double v, double dt, int N, double k,double Q, double F_0, double w_m,
         double m):
    cdef np.ndarray[np.float64_t, ndim=1] X
    cdef np.ndarray[np.float64_t, ndim=1] V
    cdef np.ndarray[np.float64_t, ndim=1] T
    X=np.zeros(N)
    V=np.zeros(N)
    T=np.zeros(N)
    cdef double b
    cdef double w_0
    cdef double t

    w_0=np.sqrt(k/m)
    b=k/(Q*w_0)
    
    t=0
    
    for i in range(N):
        X[i]=x
        V[i]=v
        T[i]=t
        
        a=(-k*x-b*v+F_0*np.cos(w_m*t))/m+Force(x)/m
        v+=a*dt
        x+=v*dt
        t=t+dt
        
    
    return [X,V,T]

def Force(z):
    
    cdef double H=6.4E-11
    cdef double R=30E-9
    
    cdef double k=3.8
    cdef double gamma=0.031
    cdef double a_0=np.sqrt(H/(2*np.pi*gamma))
    cdef double z_s=0
    if((z-z_s)>a_0):
        F=-H*R/(6*(z-z_s))
    else:
        F=-H*R/(6*a_0**2)+k*np.sqrt(R)*(z-z_s-a_0)
    return F
