This is the raw data for using mutation analysis to improve static analysis tools.

List of files:

Solidity:
* 424contracts:  full raw mutation analysis data
* 424mutants: actual mutated files
* 424compare.txt: processed output of analysis scripts
* all.securify.killed.txt, all.slither.killed.txt, all.smartcheck.killed.txt: list of actual killed mutants for each tool

Java:
* Java.csv.gz -- raw results, zipped (it's big) in csv format.  Contents should be fairly self-explanatory
* all.Infer.killed.txt, all.PMD.killed.txt, all.spotbugs.killed.txt: list of actual killed mutants for each tool

Python:
* Python.csv.gz -- raw results, zipped in csv.  Format is similar to Java, but not identical (different students)
* all.Pychecker.killed.txt, all.Pyflakes.killed.txx: list of actual killed mutants for each tool

due to the huge space requirements, we have to reproduce the full raw data for Java and Python, but the files above do contain info to perform manual examination of mutants killed by tools
