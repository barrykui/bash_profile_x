import sys

import torch

def cuda_to_cpu(filename):
    checkpoint = torch.load(filename)
    state_dict  = checkpoint.copy()
    for k, v in state_dict.items():
        state_dict[k] = v.cpu()

    torch.save(state_dict, filename+".cpu")
    print("CPU version: "+filename+".cpu")

cuda_to_cpu(sys.argv[1])
