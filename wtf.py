
import pkg1
pkg1.initVM()

import pkg2
pkg2.initVM()


c = pkg1.Wtf()
s = pkg2.MyWtf()


# should work, but it gives InvalidArgs
s.f(c)
