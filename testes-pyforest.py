import seaborn as sns
import numpy as np
import pandas as pd
# ^^^ pyforest auto-imports - don't write above this line
# testes-pyforest
df = pd.DataFrame(dict(a=np.arange(10)))
sns.distplot(df.a)


