import re
import random
from random import shuffle
seed=114514
random.seed(114514)
flag="flag{test}"
flag=re.findall(r'.{2}', flag)
shuffle(flag)
__flag__=flag
del re
del flag