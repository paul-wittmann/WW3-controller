#!/bin/sh

### ECHO COMMANDS ###
set -x 

### SET COMMON DIRECTORIES ###
WINDDIR="/ocean/transient/gfs0p25/lola"
LOGDIR="/home/wave/run_logs"
SCRIPTHOME="/home/wave/Scripts"

### GET CURRENT RUN AND PREVIOUS RUN FOR COMPARISON ###
CRUNCHECK=`ls -ltr ${WINDDIR}/*.done | tail -n 1 | awk -F' ' '{ print $9 }' | awk -F'/' '{ print $6 }' | sed 's/.done//g'`
PRUNCHECK=`cat ${LOGDIR}/kickoff_beta_model_ptime.log`
#PRUNCHECK=`cat ${SCRIPTHOME}/beta/lastrun`

### IF CURRENT RUN IS DIFFERENT THAN PREVIOUS, INITIALIZE MODELS ###
if [ "${CRUNCHECK}" != "${PRUNCHECK}" ]
then

### LOG CURRENT RUN INTO PREVIOUS RUN LOG FILE ###
echo "${CRUNCHECK}" > ${LOGDIR}/kickoff_beta_model_ptime.log

### CURRENT HOUR OF MODEL RUN (00, 06, 12, OR 18) ###
RUNHR=`echo "${CRUNCHECK}" | cut -c9-10`

### RUN WAVE MODELS ###
echo "Initializing Beta Wave Model..."

${SCRIPTHOME}/beta/kickoff_beta_test.bsh > ${LOGDIR}/kickoff_beta_${RUNHR}.log 2>&1

fi

