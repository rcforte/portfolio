import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

from sklearn import (datasets, metrics, model_selection as skms, naive_bayes, neighbors)

iris = datasets.load_iris()
print(iris.DESCR)
