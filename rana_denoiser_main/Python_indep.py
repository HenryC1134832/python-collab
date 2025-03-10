import random, matplotlib.pyplot as plt,numpy as np    #一些數據
sta  = ["R1", "R2", "R3", "S3", "R4", "R5", "R6"]      #S3有可能故障因此要特別標記，R4、R5、R6皆直接通往終點B
q1 = [1-0.00003, 1-0.00002, 1-0.00015, 1-0.000001, 1-0.00008, 1-0.000015, 1-0.00001]
q2 = [1-0.00003, 1, 1-0.00015, 1-0.000001, 1-0.00008, 1-0.000015, 1-0.00001]
pathA = ["R1", "R2", "R4"]                             #A有三個Router可選
pathR1 = ["R2", "R3", "R5"]                            #R1有三個Router可選
pathR2_1 = ["R3", "R5", "R6"]                          #在A選R2後，R2有三個Router可選
pathR2_2 = ["R4", "R6"]                                #在R1選R2後，R2有三個Router可選
pathR3 = ["R4", "R5", "R6"]                            #R3有三個Router可選
def router():
    path = []
    TF =  0
    j = 0
    while TF == 0:
        path.append(random.choice(pathA))              #A隨機在pathA中選一個Router走
        j += 1
        if path[j-1] == "R1":
            path.append(random.choice(pathR1))         #在A之後R1隨機在pathR1中選一個Router走
            j += 1
            if path[j-1] == "R2":
                path.append(random.choice(pathR2_2))   #在R1之後R2隨機在pathR2_2中選一個Router走
                break
            if path[j-1] == "R3":
                path.append("S3")                      #只有R3需要經過S3
                path.append(random.choice(pathR3))     #在R1之後R3隨機在pathR3中選一個Router走
                break                                  #在R1之後R5直接傳到B
            break
        if path[j-1] == "R2":
            path.append(random.choice(pathR2_1))       #在A之後R2隨機在pathR2_1中選一個Router走
            j += 1
            if path[j-1] == "R3":
                path.append("S3")
                path.append(random.choice(pathR2_2))   #在R2之後R3隨機在pathR3中選一個Router走
                break                                  #在R2之後R5直接傳到B #在R2之後R6直接傳到B
        break
    return path
sum1, sum2 = 0, 0                                      #以下為主程式
t = int(input("執行次數"))
prob_1, prob_2 = [], []                                #執行中各階段的機率平均值
times =  np.linspace(1,t,t)
global pro1, pro2
for k in range(t):
    path = router()                                   #呼叫function
    l = len(path)                                     #確認路徑長度
    pro1, pro2 = 1, 1                                 #機率初始值
    #print("A -> ", end="")
    for i in range(l):                                #開始確認行經的路徑
        str = path[i]                                 #先複製該Router名稱
        #if str != "S3":
            #print(str,"-> ", end="")
        n = sta.index(str)                            #確認它位sta中的第幾位
        p1 = q1[n]                                    #對應其第二小題的機率
        p2 = q2[n]                                    #對應其第三小題的機率
        pro1 *= p1
        pro2 *= p2
    #print("B")
    sum1 += pro1
    sum2 += pro2
    prob_1.append(sum1*100/ (k+1) )
    prob_2.append(sum2*100/ (k+1) )
print("第一小題機率:",prob_1[t-1],"%")                #結果顯示
print("第二小題機率:",prob_2[t-1],"%") 
plt.plot(times, prob_1, label = "P(C)")
plt.plot(times, prob_2, label = "P(C|R2 is OK)")
plt.title("Probability VS Times")
plt.xlabel('times') 
plt.ylabel('Probability(%)') 
plt.legend()
plt.show()