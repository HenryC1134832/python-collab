from matplotlib.font_manager import font_family_aliases
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import (AutoMinorLocator, MultipleLocator)


labels = ['BUS', 'PED', 'STR', 'QUTREVERB','QUTSTREET', 'QUTCAR', 'QUTHOME','QUTCAFE', 'Average(Unseen)']
# ChW_SL1_SNRi = [5.97,3.93,5.56,4.12,7.33,5.14,10.80,7.56,8.82]
# ChW_SL2_SNRi = [10.48,8.42,9.69,8.66,9.80,10.00,11.80,8.80, 9.81]
# ChW_SL3_SNRi = [10.74,8.45,10.02,9.04,10.13,10.45,12.18,8.86, 10.13]
# ChW_SL1_SNRi = [9.211,7.148,8.767,7.739,8.822,8.487,10.709,7.226, 8.5966]
# ChW_SL2_SNRi = [8.651,7.286,8.273,7.051,8.564,8.502,9.627,7.582,8.2652]
# ChW_SL3_SNRi = [9.702,7.576,9.206,7.969,9.194,9.241,10.748,7.783, 8.987]
 

 

#Mahzoon code
# TCN_SL1_SNRi = [5.97,5.51,3.93,5.56,4.12,7.33,5.14,3.83,5.19]
# ChW_SL1_SNRi = [6.21,5.77,4.15,5.82,4.74,7.71,5.49,4.23,5.60]
# TCN1_FT_SNRi = [8.38,7.10,8.12,8.45,7.10,10.10,8.23,7.49,8.12]

#Mahzoon code
TCN1_FT_SNRi= [9.16,8.21,9.60,9.68,8.72,11.89,9.43,8.30,9.37]
TCN2_FT_SNRi = [9.75,7.95,9.71,9.96,8.68,12.07,9.89,7.93,9.49]
TCN3_FT_SNRi = [9.57,8.23,9.73,9.81,8.93,12.15,10.14,8.41,9.62]

1.77,1.49,1.72,1.68,1.72,2.24,1.90,1.54,1.757
1.82,1.47,1.71,1.65,1.77,2.26,1.90,1.52,1.807
1.44,1.49,1.49,1.40,1.46,1.45,1.46,1.53,1.465


# TCN_SL2_SNRi = [6.21,5.82,4.31,6.02,4.72,7.47,5.79,4.43,5.69]
# ChW_SL2_SNRi = [5.65,5.28,4.28,5.56,4.05,6.63,5.50,4.58,5.27]
# TCN2_FT_SNRi = [9.88,7.45,8.12,9.20,8.01,11.09,8.91,7.45,8.78]


x = np.arange(len(labels))  # the label locations
print()
width = 0.25  # the width of the bars
fig, ax = plt.subplots(figsize=(18,8))
# rects1 = ax.bar(x, TCN_SL2_SNRi, width, label='MS-TCN2_SI-SNRi', align="center")

# rects2 = ax.bar(x+width, ChW_SL2_SNRi, width, label='CWM-TCN2_SI-SNRi',align="center")
# rects3 = ax.bar(x+2*width, TCN2_FT_SNRi, width, label='TCN2-FT_SI-SNRi', align="center")


#SliceOne
rects1 = ax.bar(x, TCN1_FT_SNRi, width, label='TCN1-FT_SI-SNRi', align="center")

rects2 = ax.bar(x+width, TCN2_FT_SNRi, width, label='TCN2-FT_SI-SNRi',align="center")
rects3 = ax.bar(x+2*width, TCN3_FT_SNRi, width, label='TCN3-FT_SI-SNRi', align="center")

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('SI-SNRi (dB)',fontsize=18)
ax.set_xlabel('Nosie Types', fontsize=18)
ax.set_ylim([1,13])
ax.yaxis.set_major_locator(MultipleLocator(2))
# ax.yaxis.set_minor_locator(AutoMinorLocator(3))

# ax.set_title('Performance Comparison for Slice-based Systems with the CahnnelWise')
ax.set_xticks(x+2*width/2, labels)
ax.legend()
ax.bar_label(rects1, padding=1,fmt='%.1f')
ax.bar_label(rects2, padding=1, fmt='%.1f')
ax.bar_label(rects3, padding=1,fmt='%.1f')
ax.vlines(x=[2.75], ymin=0, ymax=45, colors='black',  linestyles='dashed')
ax.vlines(x=[7.75], ymin=0, ymax=45, colors='black',  linestyles='dashed')
#fig.tight_layout()
fig.savefig('CHW_SI_SNRi.jpg', dpi=300)
plt.show()