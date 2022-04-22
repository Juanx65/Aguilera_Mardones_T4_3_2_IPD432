#chanel 6: HW
#chanel 7: SW


import statistics as s
def get_stats(nom_arch, version):
    arch = open(nom_arch)
    scale = 10**6

    TIME = []
    HW = []
    SW = []

    hw_latency = []
    sw_latency = []


    for line in arch:
        if "T" not in line:
        
            line = list(map(float,line.strip().split(",")))
            time, hw, sw = line

            TIME.append(time)
            HW.append(hw)
            SW.append(sw)

    arch.close()


    for i in range(len(TIME)):
        if HW[i] == 1:
            hw_latency.append(TIME[i+1]-TIME[i])

        if SW[i] == 1:
            sw_latency.append(TIME[i+1]-TIME[i])        
                
    #Hardware stats
    print(version.upper()+" VERSION\n")
    hw_mean =  s.mean(hw_latency)
    hw_variance =  s.variance(hw_latency)
    hw_median = s.median(hw_latency)
    hw_min = min(hw_latency)
    hw_max = max(hw_latency)

    hw_std = s.pstdev(hw_latency, mu = None)

    print(" HW Average latency: ", hw_mean*scale, "us")
    print(" HW variance of  latency: ",hw_variance*scale, "us")
    print(" HW median of  latency: ",hw_median*scale, "us")
    print(" HW min latency: ",hw_min*scale, "us")
    print(" HW max latency: ",hw_max*scale, "us")





    print()
    print()

    #Software stats

    SW_mean =  s.mean(sw_latency)
    SW_variance =  s.variance(sw_latency)
    SW_median = s.median(sw_latency)
    SW_min = min(sw_latency)
    SW_max = max(sw_latency)

    print(" SW Average latency: ", SW_mean*scale, "us")
    print(" SW variance of  latency: ",SW_variance*scale, "us")
    print(" SW median of  latency: ",SW_median*scale, "us")
    print(" SW min latency: ",SW_min*scale, "us")
    print(" SW max latency: ",SW_max*scale, "us")

    print()

get_stats("float_measurements.csv","float 32")
#get_stats("int_measurements.csv","int 32")
