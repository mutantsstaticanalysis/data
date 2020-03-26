import glob

powers = ["2^32", "2 ^ 32", "2^64", "2 ^ 64", "2^256", "2 ^ 256"]

contracts = glob.glob("*.sol")
print len(contracts)

ndone = 0
for contract in contracts:
    ndone += 1
    with open(contract) as cfile:
        for line in cfile:
            for power in powers:
                if power in line.split("//")[0]:
                    print ndone, contract, ":", line[:-1]
            if ("require" in line) and ("^" in line):
                print ndone, contract, ":", line[:-1]
