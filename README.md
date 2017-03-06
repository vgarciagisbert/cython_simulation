# cython_simulation

Very Simple applications using cython and numpy. The code of cython is stored in the cython_test file. It includes to different ways to compile, either in windows or linux. Atfer the compilation, the test function can run to check everything is going ok.

The methods used include a simulation of a dumped oscillator.

  +cython_test.pyx code of the methods for cython
  
  +compile.bat\sh run to compile the cython code
  
  +setup_linix\windows.py necesary to compile, includes cython options, but this must be launched in the cmd.
  
  +run.py test script, imports the "cython_test" and run the methods
 
 You may have to add the path to the folter manually in the run.py script
