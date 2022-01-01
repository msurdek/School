import pandas as pd

import matplotlib.pyplot as plt

data = pd.read_csv("pgaTourData.csv")

plt.scatter(data['Fairway Percentage'], data['Wins'])

plt.show()