from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

#extensions=[Extension('cy_laplace',['cy_laplace.pyx'])]

#setup(name='Demos', ext_modules=cythonize(extensions))

from distutils.core import setup, Extension
from Cython.Build import cythonize
import numpy as np

#setup(
#    ext_modules=[
#        Extension("cy_laplace", ["cy_laplace.c"],
#                  include_dirs=[np.get_include()]),
#    ],
#)

# Or, if you use cythonize() to make the ext_modules list,
# include_dirs can be passed to setup()

setup(
    ext_modules=cythonize("cython_test.pyx"),
    include_dirs=[np.get_include()]
)   
