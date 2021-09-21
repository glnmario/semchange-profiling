import matplotlib.pyplot as plt
import numpy as np

sing = [56, 69]
plur = [47, 8]

labels = ["1810-1860", "1960-2010"]

fig, ax = plt.subplots()
width = 0.3
s = ax.bar(np.arange(len(sing)) - width/2, sing, width, label="Singular")
p = ax.bar(np.arange(len(plur)) + width/2, plur, width, label="Plural")


ax.set_ylabel("Frequency")
ax.set_title("Distribution of number values for the word 'lass'")
ax.set_xticks(np.arange(len(labels)))
ax.set_xticklabels(labels)
ax.legend(loc="best")

plt.savefig("lass.png")
