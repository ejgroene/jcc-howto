from java import initVM as initVM_j
from lucene import initVM as initVM_l
from pkg1 import initVM as initVM_1, Wtf
from pkg2 import initVM as initVM_2, MyWtf

initVM_j()
initVM_l()
initVM_1()
initVM_2()

c = Wtf()

s = MyWtf()


wtfSuper = c.class_.getSuperclass()

from org.apache.lucene.search import TotalHitCountCollector
thccSuper = TotalHitCountCollector.class_.getSuperclass()

print(" is ", wtfSuper is thccSuper)
print(" == ", wtfSuper == thccSuper)
print(" id ", id(wtfSuper), id(thccSuper))


s.doit(c)
