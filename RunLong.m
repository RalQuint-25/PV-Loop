clc
clear
close all

Specimenname={'F2P_long','FNP_long','H2P_long','HNP_long','JNP_long','FG2P_long','G1P_long','GNP_long','I1P_long'};
for i=1:5
    name=char(cellstr(Specimenname(i)));
    GraphLong(name)
    PVRTestLong(name)
    DataSaveLong(name)
end

for i=6:9
    name=char(cellstr(Specimenname(i)));
    GraphLong2(name)
    PVRTestLong(name)
    DataSaveLong(name)
end
TableStatsLong(Specimenname)
TableListsLong(Specimenname)

