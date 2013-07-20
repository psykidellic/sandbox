# example output
```bash
httperf --verbose --client=0/1 --server=dev.beamto.us --port=80 --uri=/ --send-buffer=4096 --recv-buffer=16384 --wsesslog=10,1.000,./htt.sess
```
```
httperf: maximum number of open descriptors = 1024
Connection lifetime = 4714.60 
reply-rate = 1.2     
session-rate = 0.2     
Connection lifetime = 4715.61 
reply-rate = 1.0     
session-rate = 0.2     
Connection lifetime = 4748.94 
reply-rate = 1.0     
session-rate = 0.2     
Connection lifetime = 4617.74 
reply-rate = 1.0     
session-rate = 0.2     
Connection lifetime = 4798.16 
reply-rate = 1.2     
session-rate = 0.2     
Connection lifetime = 4592.00 
reply-rate = 1.0     
session-rate = 0.2     
Connection lifetime = 4717.01 
reply-rate = 1.0     
session-rate = 0.2     
Connection lifetime = 4603.09 
reply-rate = 1.2     
session-rate = 0.2     
Connection lifetime = 4853.42 
reply-rate = 1.0     
session-rate = 0.2     
Maximum connect burst length: 1
Connection lifetime = 4665.61 
```

```
Total: connections 10 requests 50 replies 50 test-duration 47.025 s

Connection rate: 0.2 conn/s (4702.5 ms/conn, <=2 concurrent connections)
Connection time [ms]: min 4592.0 avg 4702.6 max 4853.4 median 4714.5 stddev 85.1
Connection time [ms]: connect 23.8
Connection length [replies/conn]: 5.000
```

```
Request rate: 1.1 req/s (940.5 ms/req)
Request size [B]: 107.0

Reply rate [replies/s]: min 1.0 avg 1.1 max 1.2 stddev 0.1 (9 samples)
Reply time [ms]: response 105.4 transfer 30.3
Reply size [B]: header 579.0 content 19679.0 footer 2.0 (total 20260.0)
Reply status: 1xx=0 2xx=50 3xx=0 4xx=0 5xx=0
```

```
CPU time [s]: user 23.67 system 21.97 (user 50.3% system 46.7% total 97.0%)
Net I/O: 21.1 KB/s (0.2*10^6 bps)

Errors: total 0 client-timo 0 socket-timo 0 connrefused 0 connreset 0
Errors: fd-unavail 0 addrunavail 0 ftab-full 0 other 0

Session rate [sess/s]: min 0.20 avg 0.21 max 0.20 stddev 0.00 (10/10)
Session: avg 1.00 connections/session
Session lifetime [s]: 4.7
Session failtime [s]: 0.0
Session length histogram: 0 0 0 0 0 10
```
