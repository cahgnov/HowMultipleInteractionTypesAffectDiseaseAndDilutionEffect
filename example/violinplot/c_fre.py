import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
#sns.set_theme(style="whitegrid")
import matplotlib.pyplot as plt
csv_file = "constant_c_fre.csv"
tips = pd.read_csv(csv_file)
tips = pd.DataFrame(tips)
fig = plt.figure(dpi=600,figsize=(5,2.5))
sns.violinplot(x="constant_P_c", y="correlation", hue="correlationship",
				data=tips, palette="muted")
plt.xlabel(r'$constant\quad P_p$',fontsize=10)
plt.legend()#title = r'$\quad$'
plt.yticks([1,0.5,0,-0.5,-1])
plt.savefig("c_fre.png")
