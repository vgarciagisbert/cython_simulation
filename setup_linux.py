# -*- coding: utf-8 -*-
"""
Created on Mon Mar  6 11:18:52 2017

@author: elena
"""

from distutils.core import setup
from Cython.Build import cythonize
import numpy
setup(
    name = "python",
    ext_modules = cythonize("*.pyx", include_path = [numpy.get_include()]),
)
