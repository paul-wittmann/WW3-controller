#!/bin/sh

### SET COMMON DIRECTORIES ###
WINDDIR="/ocean/transient/gfs0p25/lola"
LOGDIR="/home/wave/run_logs"
SCRIPTHOME="/home/wave/Scripts"

### GET CURRENT RUN AND PREVIOUS RUN FOR COMPARISON ###
CRUNCHECK=`ls -ltr ${WINDDIR}/*.done | tail -n 1 | awk -F' ' '{ print $9 }' | awk -F'/' '{ print $6 }' | sed 's/.done//g'`
PRUNCHECK=`cat ${LOGDIR}/kickoff_seas_models_ptime.log`

### IF CURRENT RUN IS DIFFERENT THAN PREVIOUS, INITIALIZE MODELS ###
if [ "${CRUNCHECK}" != "${PRUNCHECK}" ]
then

### LOG CURRENT RUN INTO PREVIOUS RUN LOG FILE ###
echo "${CRUNCHECK}" > ${LOGDIR}/kickoff_seas_models_ptime.log

### CURRENT HOUR OF MODEL RUN (00, 06, 12, OR 18) ###
RUNHR=`echo "${CRUNCHECK}" | cut -c9-10`

### RUN WAVE MODELS ###
echo "Initializing Inland Sea Wave Models..."

${SCRIPTHOME}/seas/kickoff_seas.bsh > ${LOGDIR}/kickoff_seas_${RUNHR}.log 2>&1

fi

