#!/bin/bash


DEBUG_OPTS="--print-request --print-reply"
DEBUG_OPTS=""
SERVER="dev.beamto.us"

httperf -v \
        $DEBUG_OPTS \
        --wsesslog=10,1,./htt.sess \
        --server=$SERVER
