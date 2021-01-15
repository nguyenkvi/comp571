# Vi Nguyen
# COMP 571
# Homework 2, #3

import numpy as np
from hmmlearn import hmm

class CustomHMM(hmm._BaseHMM):
	def 

model = hmm.Custom(n_components=4)
model._startprob = np.array([0.25, 0.25, 0.25, 0.25])
model._transmat = np.array([[5.0/6.0, 0, 0, 1.0/11.0],
							[1.0/6.0, 10.0/11.0, 0, 0],
							[0, 1.0/11.0, 6.0/7.0, 0],
							[0, 0, 1.0/7.0, 10.0/11.0]])

X, Z = model.sample(10)

print X
