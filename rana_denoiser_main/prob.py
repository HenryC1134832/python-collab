import numpy as np
import matplotlib.pyplot as plt
import math
# for complex sinusoids

x1 = 0.1 * math.pow(1.5, 2) + 0.8 * math.pow(2, 2) + 0.1 * math.pow(3, 2)
print("value of x1", x1)

x2 = (-2)*0.5 + 1.5*0.1 + 2*0.3 + 3*0.1
print("value of x2", x2)
x3 = 0.5 * math.pow(-2, 2) + 0.1 * math.pow(1.5, 2) + 0.3 * math.pow(2, 2) + 0.1 * math.pow(3, 2)
print("value of x3", x3)
x4 = x3 - math.pow(0.050, 2)
print("value of x4", x4)
x5 = 25 * x4
print("value of x5", x5)


a = math.pow(x2, 2)
print("value of a", a)