HTTPerf = require("httperfjs")
httperf = new HTTPerf(
  server: "dev.beamto.us"
  uri: "/"
  "num-conns": 100
)
first_run = httperf.runSyn()
console.log first_run
console.log httperf.results
console.log first_run.connection_time_avg
