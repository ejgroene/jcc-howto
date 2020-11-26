
import pkg1
pkg1.initVM() # start VM with classpath of pkg1

import pkg2
pkg2.initVM() # detects running VM and extends classpath


c = pkg1.Wtf()
s = pkg2.MyWtf() # MyWtf extends Wtf


# should be the same class (but it isn't)
assert str(c.class_) == "class pkg1.Wtf"
assert str(s.class_.getSuperclass()) == "class pkg1.Wtf"


# so this fails
assert c.class_ == s.class_.getSuperclass()


# should work, but it gives InvalidArgs
s.wtf(c)
