```python
import pandas as pd
# ^^^ pyforest auto-imports - don't write above this line
# obligatory first code cell
from IPython.core.display import display, HTML
```

```python
# settings go here
display(HTML("<style>.container { width:85% !important; }</style>"))
```

```python
# testes
df = pd.read_csv("top-trumps-last-jedi.csv")
df
```


```python
# pair plot
g = sns.pairplot(df)
```

```python
g = sns.PairGrid(df)
g = g.map_upper(sns.scatterplot)
g = g.map_lower(sns.kdeplot)
# g = g.map_diag(sns.kdeplot, lw=2)
# g = g.map_diag(sns.rugplot, lw=2)
g = g.map_diag(sns.distplot)
```
