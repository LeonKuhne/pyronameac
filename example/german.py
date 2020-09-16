#!/bin/python

import sys

# take in the first argument
zu_lang = len(sys.argv[1]) > 5

if zu_lang == False:
  print("die schnur ist nicht zu lang")
else:
  print("aber jetzt doch ein bisschen kurzer bitte")
