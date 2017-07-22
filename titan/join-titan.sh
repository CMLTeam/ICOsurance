#!/usr/bin/env bash
geth --datadir d/ --keystore k/ --networkid 20170125 console --rpc --rpccorsdomain "*" --mine --minerthreads 1 --rpcaddr 10.0.110.143
