close all
clc
clear
load("FG2P_Stats.mat")
FG2P_Stats=DataStats;
load("G1P_Stats.mat")
G1P_Stats=DataStats;
load("GNP_Stats.mat")
GNP_Stats=DataStats;
load("I1P_Stats.mat")
I1P_Stats=DataStats;
load("INP_Stats.mat")
INP_Stats=DataStats;
load("K1P_Stats.mat")
K1P_Stats=DataStats;
load("K2P_Stats.mat")
K2P_Stats=DataStats;
load("KNP_Stats.mat")
KNP_Stats=DataStats;
Specimen={'FG2P','G1P','GNP','I1P','INP','K1P','K2P','KNP'}';
AverageTime=[FG2P_Stats.Time,G1P_Stats.Time,GNP_Stats.Time,I1P_Stats.Time,INP_Stats.Time,K1P_Stats.Time,K2P_Stats.Time,KNP_Stats.Time]';
AverageMaxPresure=[FG2P_Stats.MaxPressure,G1P_Stats.MaxPressure,GNP_Stats.MaxPressure,I1P_Stats.MaxPressure,INP_Stats.MaxPressure,K1P_Stats.MaxPressure,K2P_Stats.MaxPressure,KNP_Stats.MaxPressure]';
AverageMinPresure=[FG2P_Stats.MinPressure,G1P_Stats.MinPressure,GNP_Stats.MinPressure,I1P_Stats.MinPressure,INP_Stats.MinPressure,K1P_Stats.MinPressure,K2P_Stats.MinPressure,KNP_Stats.MinPressure]';
AverageMaxVolume=[FG2P_Stats.MaxVolume,G1P_Stats.MaxVolume,GNP_Stats.MaxVolume,I1P_Stats.MaxVolume,INP_Stats.MaxVolume,K1P_Stats.MaxVolume,K2P_Stats.MaxVolume,KNP_Stats.MaxVolume]';
AverageMinVolume=[FG2P_Stats.MinVolume,G1P_Stats.MinVolume,GNP_Stats.MinVolume,I1P_Stats.MinVolume,INP_Stats.MinVolume,K1P_Stats.MinVolume,K2P_Stats.MinVolume,KNP_Stats.MinVolume]';
table(Specimen,AverageTime,AverageMaxPresure,AverageMinPresure,AverageMaxVolume,AverageMinVolume)

subplot(2,3,1)
boxplot(AverageTime')
xlabel('Sham')
ylabel('Average Times (ms)')
title('Box Plot of Average Times')
subplot(2,3,2)
boxplot(AverageMaxPresure')
xlabel('Sham')
ylabel('Average Pressures (mmHg)')
title('Box Plot of Average Max Pressure')
subplot(2,3,3)
boxplot(AverageMinPresure')
xlabel('Sham')
ylabel('Average Pressures (mmHg)')
title('Box Plot of Average Min Pressure')
subplot(2,3,4.5)
boxplot(AverageMaxVolume')
xlabel('Sham')
ylabel('Average Volumes (uL)')
title('Box Plot of Average Max Volume')
subplot(2,3,5.5)
boxplot(AverageMinVolume')
xlabel('Sham')
ylabel('Average Volumes (uL)')
title('Box Plot of Average Min Volume')