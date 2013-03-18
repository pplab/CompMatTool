#!/bin/sh
#------------------------------------>8======================================
#  Copyright (c) 2013, pplab (shenyu828@gmail.com)
#  All rights reserved.
#  
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are met:
#      * Redistributions of source code must retain the above copyright
#        notice, this list of conditions and the following disclaimer.
#      * Redistributions in binary form must reproduce the above copyright
#        notice, this list of conditions and the following disclaimer in the
#        documentation and/or other materials provided with the distribution.
#      * Neither the name of the <organization> nor the
#        names of its contributors may be used to endorse or promote products
#        derived from this software without specific prior written permission.
#  
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
#  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#  DISCLAIMED. IN NO EVENT SHALL pplab BE LIABLE FOR ANY
#  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#====================================8<----------------------------------------
#  calculate the volume of a cell from POSCAR
DIE () {
    echo $1;
    exit 1;
}
fPOSCAR="$1"
[ -z $fPOSCAR ] && DIE "usage: $0 [path to]POSCAR"
cat $fPOSCAR | awk 'NR==3 {
                    a1=$1;a2=$2;a3=$3;
                    next;}
                    NR==4 {
                    b1=$1;b2=$2;b3=$3;
                    next;}
                    NR==5 {
                    c1=$1;c2=$2;c3=$3;
                    next;}
                    END {
                    print a1*b2*c3+a2*b3*c1+a3*b1*c2- \
                          a3*b2*c1-a2*b1*c3-a1*b3*c2;
                    }'

