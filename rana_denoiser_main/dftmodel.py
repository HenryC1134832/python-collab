import numpy as np
import math
from scipy.fftpack import fft, ifft

def dftmodel(x, w, N):
    # analysis/synthsis of a signal using the discrete fourier transform
    # x: input signal, w: analysis window, N: FFT size
    #  return y: output signal
    hn = N/2 #size of positive spectrum
    hM1 = int(math.floor((w.size + 1)/2)) #half analysis window size by rounding
    hm2 = int(math.floor(w.size/2)) #half analysis window size by floor
    fftbuffer = np.zeros(N) # initialize the input sound
    y = np.zeros(x.size) # initialize output array

    #------analysis-------
    xw = x * w  #window the input sound
    fftbuffer[:hM1] = xw[hm2:] #zero-phase window in fftbuffer
    fftbuffer[N-hm2:] = xw[:hm2]
    x = fft(fftbuffer) #comppute ffet
    mX = 20 * np.log10(abs(x[:hn]))
    px = np.unwrap(np.angle(x[:hn]))

    # -----synthessis--------------
    y = np.zeros(N, dtype=complex) #clean output spectrum
    y[:hn] = 10 ** (mX/20) * np.exp(1j*px) #generate positive frequencies
    y[hn-1:] = 10 ** (mX[:0:-1]/20) * np.exp(-1j*px[:0:-1]) # generate negative frequencies
    fftbuffer = np.real(ifft(y)) #compute inverse fft
    y[:hm2] = fftbuffer[N-hm2:] #undo zero padding
    y[hm2:] = fftbuffer[:hM1]
    return y

def dftAnal(x, w, N):
    # analysis/synthsis of a signal using the discrete fourier transform
    # x: input signal, w: analysis window, N: FFT size
    #  return y: output signal
    hn = N/2 #size of positive spectrum
    hM1 = int(math.floor((w.size + 1)/2)) #half analysis window size by rounding
    hm2 = int(math.floor(w.size/2)) #half analysis window size by floor
    fftbuffer = np.zeros(N) # initialize the input sound
    w = w / sum(w) #normalize analysis window

    #------analysis-------
    xw = x * w  #window the input sound
    fftbuffer[:hM1] = xw[hm2:] #zero-phase window in fftbuffer
    fftbuffer[N-hm2:] = xw[:hm2]
    x = fft(fftbuffer) #comppute ffet
    mX = 20 * np.log10(abs(x[:hn])) #magnitude spectrum of positive frequenceis in dB
    px = np.unwrap(np.angle(x[:hn])) #unwrapped phase spectrum of positive frequencies
    return mX, px

def dftSynth(mX, px, M):
    # synthsis of a signal using the discrete fourier transform
    # mX: magnitude signal, px: phase spectrum, M: window size
    #  return y: output signal
    N = mX.size*2 #size of positive spectrum
    hN = N/2
    hM1 = int(math.floor((M + 1)/2)) #half analysis window size by rounding
    hm2 = int(math.floor(M/2)) #half analysis window size by floor
    fftbuffer = np.zeros(N) # initialize the input sound
    y = np.zeros(M) # initialize output array
    # -----synthessis--------------
    y = np.zeros(N, dtype=complex) #clean output spectrum
    y[:hN] = 10 ** (mX/20) * np.exp(1j*px) #generate positive frequencies
    y[hN-1:] = 10 ** (mX[:0:-1]/20) * np.exp(-1j*px[:0:-1]) # generate negative frequencies
    fftbuffer = np.real(ifft(y)) #compute inverse fft
    y[:hm2] = fftbuffer[N-hm2:] #undo zero padding
    y[hm2:] = fftbuffer[:hM1]
    return y




