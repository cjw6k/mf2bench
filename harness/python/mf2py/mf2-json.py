import sys
import mf2py
import json

with open(sys.argv[1], 'r') as file:
    print( "%s" % json.dumps( mf2py.parse( doc=file, url=sys.argv[2] ) ) )
