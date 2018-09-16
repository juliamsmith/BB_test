from Meta_Driver import vary_params
import numpy

if __name__ == "__main__":
    #this is what gets editted most of the time -- also potentially writer
    dim_vec=[900,2250]#[900, 2250, 4500, 9000] #the equivalent of grid [100, 250, 500, 1000]
    m_prop_vec=numpy.linspace(.05, .95, 10)#numpy.linspace(.05, .95, 19) #.05, .1, .15, ... , .95; OR: intervals of .1
    RB_time_vec=[4,6]#[.5, 2, 4, 6] #hrs
    num_sims=1000
    vary_params(dim_vec, m_prop_vec, RB_time_vec, num_sims)