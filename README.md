# PV-Loop
Pressure volume loop analysis of mice heartbeats

Download MATLAB to run this project
Open Runlong to run the datasets
* .txt files are the datasets used
* .Data should be formated as Time,Pressure,Volume
* .mat files are summaries of datasets
* .Summaries have pressures, volumes, heartrates, ESPVR, EDPVR and strokework
* .To open datasets Specimenname={list of data from MI mice, list of data from Sham mice}
* .To run comparisons between groups set the i in the for loops to match the indeces of the specimenname
* .In the TableStatsLong file change the i-5 to i-n where n is the number of MI mice
* .In the TableStatsLong file g1=repmat({'Sham'},m,1); where m is the number of sham mice
* .In the TableStatsLong file g2=repmat({'MI'},n,1); wheren is the number of MI mice
* .In the TableListsLong file g1=repmat({'Sham'},m,1); where m is the number of sham mice heartbeats
* .In the TableListsLong file g2=repmat({'MI'},n,1); wheren is the number of MI mice heartbeats
* .Heartbeats can be determined by looking at the length of ListTimeSham and ListTimeMI
