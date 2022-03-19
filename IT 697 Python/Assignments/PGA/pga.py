import pandas as pd

import matplotlib.pyplot as plt

####

data = pd.read_csv("pgaTourData.csv")

plt.scatter(data['SG:OTT'], data['Average SG Putts'])

plt.show()

####

data.info()

####

data.Wins = data.Wins.fillna(0)

####

eighteen = data[data.Year == 2018]
plt.scatter(eighteen['Fairway Percentage'], eighteen['Wins'])

####

plt.scatter(eighteen['Avg Distance'], eighteen['Wins'])

####

ten = data[data.Year == 2010]
plt.scatter(ten['Fairway Percentage'], ten['Wins'])

####

plt.scatter(ten['Avg Distance'], ten['Wins'])

####

data.info

####

fig = plt.figure()
gs = fig.add_gridspec(2, 2, hspace = 0, wspace = 0)
(ax1, ax2), (ax3, ax4) = gs.subplots(sharey = True, sharex = 'col')
fig.suptitle("PGA Tour Golfers Are Trading Accuracy For Distance, And It's Paying Off", y = 1)
ax1.scatter(ten['Fairway Percentage'], ten['Wins'])
ax1.set_title('Fairway Percentage')
ax1.set(ylabel = 'Wins in 2010')
ax1.set_ylim(-0.25,3.5)
ax2.scatter(ten['Avg Distance'], ten['Wins'])
ax2.set_title('Driving Distance')
ax3.scatter(eighteen['Fairway Percentage'], eighteen['Wins'])
ax3.set(ylabel = 'Wins in 2018')
ax3.set_ylim(-0.25,3.5)
ax4.scatter(eighteen['Avg Distance'], eighteen['Wins'])
