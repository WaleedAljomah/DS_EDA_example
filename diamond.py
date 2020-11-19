# Diamonds analysis

# libraries
#%%
import numpy as np
import pandas as pd
import seaborn as sns

#%%
# import the data
jems = pd.read_csv("data\diamonds.csv")

#%%
# Explore the DataFrame

# type(jems)
jems.columns # names
jems.describe()
jems.info()
jems.head()
jems.tail()
jems.sample(n = 10)

# %%
#how many value of diamonds depth have been described
#Total depth percentage = z / mean(x, y) = 2 * z / (x + y)
jems['depth'].value_counts()
#jems.shape()

#mean of diamonds depth
np.mean(jems['depth'])

# %%
# How many diamonds with a clarity of category “IF” are present in the data-set?
len(jems[jems.clarity == "IF"])
(jems['clarity'] == 'IF').value_counts()[True]
jems.clarity.value_counts()

jems['depth'].value_counts()
# What fraction of the total do they represent?
# len(jems[jems.clarity == 'IF'])/len(jems)
# %%
# What is the cheapest diamond price overall?
#min(jems.price)
jems['price'].min()
#%%
# What is the range of diamond prices?
# print('Range for prices (', jems['price'].min(), '-', jems['price'].max(), ')')
def getRange (x):
    low = min(x)
    high = max(x)
    return low, high

price_range = getRange(jems.price)

low, high = getRange(jems.price)



#%%
# What is the average diamond price in each category of cut and color?
jems.groupby(['cut','color'])['price'].mean()
# %%
#Make a scatter plot that shows the diamond price described by carat.
sns.pointplot(x= 'price', y='carat', data=jems, join=False)


