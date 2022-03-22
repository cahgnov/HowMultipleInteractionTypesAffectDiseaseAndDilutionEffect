import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
#sns.set_theme(style="whitegrid")
import matplotlib.pyplot as plt
csv_file = "constant_m.csv"
tips = pd.read_csv(csv_file)
tips = pd.DataFrame(tips)
fig = plt.figure(dpi=600,figsize=(5,2.5))
sns.violinplot(x="constant_P_m", y="correlation", hue="correlationship",
				data=tips, palette="muted",legend = False)
plt.xlabel(r'$constant\quad P_m$',fontsize=10)
plt.legend([],[], frameon=False)
plt.yticks([1,0.5,0,-0.5,-1])
plt.savefig("m_den.png")
