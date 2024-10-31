function DataSaveLong(name)
path=append(name,'_data.mat');
load(path)

%% Allocating Memory + Variable Creation
TimeList=zeros(1,length(SavedData.IsolatedHB));
MaxPressureList=zeros(1,length(SavedData.IsolatedHB));
MaxVolumeList=zeros(1,length(SavedData.IsolatedHB));
MinPressureList=zeros(1,length(SavedData.IsolatedHB));
MinVolumeList=zeros(1,length(SavedData.IsolatedHB));
ESPVRList=zeros(1,length(SavedData.PVRatio));
EDPVRList=zeros(1,length(SavedData.PVRatio));
StrokeWorkList=zeros(1,length(SavedData.PVRatio));
AvalueList=zeros(1,length(SavedData.PVRatio));
BvalueList=zeros(1,length(SavedData.PVRatio));
%% Obtaining values from each heart beat by running for loop on structure
for i=1:length(SavedData.IsolatedHB)
TimeList(i)=length(SavedData.IsolatedHB(i).Time);
MaxPressureList(i)=max(SavedData.IsolatedHB(i).Pressure);
MaxVolumeList(i)=max(SavedData.IsolatedHB(i).Volume);
MinPressureList(i)=min(SavedData.IsolatedHB(i).Pressure);
MinVolumeList(i)=min(SavedData.IsolatedHB(i).Volume);
ESPVRList(i)=SavedData.PVRatio(i).ESPVR;
EDPVRList(i)=SavedData.PVRatio(i).EDPVR;
StrokeWorkList(i)=SavedData.PVRatio(i).Strokework;
AvalueList(i)=SavedData.PVRatio(i).A;
BvalueList(i)=SavedData.PVRatio(i).B;
end


%% Taking out zero values
% might not be necessary
TimeList=nonzeros(TimeList);
MaxPressureList=nonzeros(MaxPressureList);
MinPressureList=nonzeros(MinPressureList);
MaxVolumeList=nonzeros(MaxVolumeList);
MinVolumeList=nonzeros(MinVolumeList);
ESPVRList=nonzeros(ESPVRList);
EDPVRList=nonzeros(EDPVRList);
StrokeWorkList=nonzeros(StrokeWorkList);

%% Obtaining averages and standard deviations and sorting them into new structure
SavedData.DataStats.Time=mean(TimeList);
SavedData.DataStats.StdTime=std(TimeList);
SavedData.DataStats.MaxPressure=mean(MaxPressureList);
SavedData.DataStats.StdMaxPressure=std(MaxPressureList);
SavedData.DataStats.MaxVolume=mean(MaxVolumeList);
SavedData.DataStats.StdMaxVolume=std(MaxVolumeList);
SavedData.DataStats.MinPressure=mean(MinPressureList);
SavedData.DataStats.StdMinPressure=std(MinPressureList);
SavedData.DataStats.MinVolume=mean(MinVolumeList);
SavedData.DataStats.StdMinVolume=std(MinVolumeList);
SavedData.DataLists.Time=TimeList;
SavedData.DataLists.MaxPressure=MaxPressureList;
SavedData.DataLists.MaxVolume=MaxVolumeList;
SavedData.DataLists.MinPressure=MinPressureList;
SavedData.DataLists.MinVolume=MinVolumeList;
SavedData.PVRStats.ESPVR=mean(ESPVRList);
SavedData.PVRStats.StdESPVR=std(ESPVRList);
SavedData.PVRLists.ESPVR=ESPVRList;
SavedData.PVRStats.EDPVR=mean(EDPVRList);
SavedData.PVRStats.StdEDPVR=std(EDPVRList);
SavedData.PVRLists.EDPVR=EDPVRList;
SavedData.PVRStats.StrokeWork=mean(StrokeWorkList);
SavedData.PVRStats.StdStrokeWork=std(StrokeWorkList);
SavedData.PVRLists.StrokeWork=StrokeWorkList;
SavedData.PVRStats.Avalue=mean(AvalueList);
SavedData.PVRStats.StdAvalue=std(AvalueList);
SavedData.PVRLists.Avalue=AvalueList;
SavedData.PVRStats.Bvalue=mean(BvalueList);
SavedData.PVRStats.StdBvalue=std(BvalueList);
SavedData.PVRLists.Bvalue=BvalueList;

savenamestat=append(name,'_data.mat');

save(savenamestat,'SavedData')

end
