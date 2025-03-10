import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import (AutoMinorLocator, MultipleLocator)

labels = ['BUS', 'PED', 'STR', 'QUTSTREET', 'QUTREVERB', 'QUTHOME', 'QUTCAR','QUTCAFE', 'Average(Unseen)']
# SL1_SI_SNRi = [9.8,7.81,9.33,8.27,9.50,9.29,11.42,7.79,5.83]
# SL2_Si_SNRi = [10.32,8.18,9.71,8.76,9.96,9.93,11.74,8.36,6.82]
# SL3_Si_SNRi = [10.36,8.08,9.70,8.54,9.75,9.83,11.65,8.30,7.14]
SL1_SI_SNRi = [8.975,6.933,8.504,7.115,8.558,8.141,10.329,6.827, 8.194]
SL2_Si_SNRi = [9.214,7.316,8.861,7.723,9.032,8.79,10.47,7.425, 8.688]
SL3_Si_SNRi = [8.72,7.152,8.587,7.147,8.657,8.252,9.658,7.228, 8.1884]

x = np.arange(len(labels))  # the label locations
print()
width = 0.25  # the width of the bars
fig, ax = plt.subplots(figsize=(16, 8))
rects1 = ax.bar(x, SL1_SI_SNRi, width, label='MS-TCN1_SI-SNRi', align="center")
rects2 = ax.bar(x+width, SL2_Si_SNRi, width, label='MS-TCN2_SI-SNRi',align="center")
rects3 = ax.bar(x+2*width, SL3_Si_SNRi, width, label='MS-TCN3_SI-SNRi', align="center")

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('SI-SNRi (dB)',fontsize=18)
ax.set_xlabel('Nosie Types',fontsize=18)
ax.set_ylim([6,11])
ax.yaxis.set_major_locator(MultipleLocator(3))
# ax.set_title('Performance Comparison for Slice-based Systems without the CahnnelWise')
ax.set_xticks(x+2*width/2, labels)
ax.legend()
ax.bar_label(rects1, padding=1, fmt='%.1f')
ax.bar_label(rects2, padding=1, fmt='%.1f')
ax.bar_label(rects3, padding=1, fmt='%.1f')
ax.vlines(x=[2.75], ymin=0, ymax=45, colors='black',  linestyles='dashed')
ax.vlines(x=[7.75], ymin=0, ymax=45, colors='black',  linestyles='dashed')
#fig.tight_layout()
fig.savefig('SL_SI_SNRi.jpg', dpi=300)
plt.show()