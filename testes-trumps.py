import seaborn as sns
import pandas as pd
# ^^^ pyforest auto-imports - don't write above this line
# obligatory first code cell
# import pyforest
from IPython.core.display import display, HTML

# settings go here
display(HTML("<style>.container { width:85% !important; }</style>"))

# testes
df = pd.read_csv("top-trumps-last-jedi.csv")
df


# pair plot
g = sns.pairplot(df)

g = sns.PairGrid(df)
g = g.map_upper(sns.scatterplot)
g = g.map_lower(sns.kdeplot)
# g = g.map_diag(sns.kdeplot, lw=2)
# g = g.map_diag(sns.rugplot, lw=2)
g = g.map_diag(sns.distplot)
