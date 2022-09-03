import sys
import time
import mf2py

for idx in range(0, int(sys.argv[3])):
    with open(sys.argv[1], 'r') as file:
        start = time.time_ns()
        mf2py.parse(doc=file, url=sys.argv[2])
        print( "%d" % ( ( time.time_ns() - start ) / 1000 ) )
