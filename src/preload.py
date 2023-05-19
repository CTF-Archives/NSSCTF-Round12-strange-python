import re
import random
seed=114514
random.seed(114514)
flag="flag{test}"
flag=re.findall(r'.{2}', flag)
random.shuffle(flag)
__flag__=flag
del re
del flag