df = pd.DataFrame(dict(a=np.arange(10)))
sns.distplot(df.a)

# almost certainly its better to put import pyforest at the top and then start