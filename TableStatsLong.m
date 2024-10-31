function TableStatsLong(name)
    %% Retreiving Data
for i=1:5
    path=append(name{i},'_data.mat');
    load(path)
    AverageTimeMI(i)=SavedData.DataStats.Time;
    AverageMaxPressureMI(i)=SavedData.DataStats.MaxPressure;
    AverageMinPressureMI(i)=SavedData.DataStats.MinPressure;
    AverageMaxVolumeMI(i)=SavedData.DataStats.MaxVolume;
    AverageMinVolumeMI(i)=SavedData.DataStats.MinVolume;
    StdTimeMI(i)=SavedData.DataStats.StdTime;
    StdMaxPressureMI(i)=SavedData.DataStats.StdMaxPressure;
    StdMinPressureMI(i)=SavedData.DataStats.StdMinPressure;
    StdMaxVolumeMI(i)=SavedData.DataStats.StdMaxVolume;
    StdMinVolumeMI(i)=SavedData.DataStats.StdMinVolume;
    AverageESPVRMI(i)=SavedData.PVRStats.ESPVR;
    StdESPVRMI(i)=SavedData.PVRStats.StdESPVR;
    AverageEDPVRMI(i)=SavedData.PVRStats.EDPVR;
    StdEDPVRMI(i)=SavedData.PVRStats.StdEDPVR;
    AverageStrokeWorkMI(i)=SavedData.PVRStats.StrokeWork;
    StdStrokeWorkMI(i)=SavedData.PVRStats.StdStrokeWork;
    AverageAvalueMI(i)=SavedData.PVRStats.Avalue;
    StdAvalueMI(i)=SavedData.PVRStats.StdAvalue;
    AverageBvalueMI(i)=SavedData.PVRStats.Bvalue;
    StdBvalueMI(i)=SavedData.PVRStats.StdBvalue;
end
for i=6:9
    path=append(name{i},'_data.mat');
    load(path)
    AverageTimeSham(i-5)=SavedData.DataStats.Time;
    AverageMaxPressureSham(i-5)=SavedData.DataStats.MaxPressure;
    AverageMinPressureSham(i-5)=SavedData.DataStats.MinPressure;
    AverageMaxVolumeSham(i-5)=SavedData.DataStats.MaxVolume;
    AverageMinVolumeSham(i-5)=SavedData.DataStats.MinVolume;
    StdTimeSham(i-5)=SavedData.DataStats.StdTime;
    StdMaxPressureSham(i-5)=SavedData.DataStats.StdMaxPressure;
    StdMinPressureSham(i-5)=SavedData.DataStats.StdMinPressure;
    StdMaxVolumeSham(i-5)=SavedData.DataStats.StdMaxVolume;
    StdMinVolumeSham(i-5)=SavedData.DataStats.StdMinVolume;
    AverageESPVRSham(i-5)=SavedData.PVRStats.ESPVR;
    AverageEDPVRSham(i-5)=SavedData.PVRStats.EDPVR;
    StdESPVRSham(i-5)=SavedData.PVRStats.StdESPVR;
    StdEDPVRSham(i-5)=SavedData.PVRStats.StdEDPVR;
    AverageStrokeWorkSham(i-5)=SavedData.PVRStats.StrokeWork;
    StdStrokeWorkSham(i-5)=SavedData.PVRStats.StdStrokeWork;
    AverageAvalueSham(i-5)=SavedData.PVRStats.Avalue;
    StdAvalueSham(i-5)=SavedData.PVRStats.StdAvalue;
    AverageBvalueSham(i-5)=SavedData.PVRStats.Bvalue;
    StdBvalueSham(i-5)=SavedData.PVRStats.StdBvalue;
end

%% Orgainizing Data onto table for plots
Time=[AverageTimeSham,AverageTimeMI];
MaxPressure=[AverageMaxPressureSham,AverageMaxPressureMI];
MinPressure=[AverageMinPressureSham,AverageMinPressureMI];
MaxVolume=[AverageMaxVolumeSham,AverageMaxVolumeMI];
MinVolume=[AverageMinVolumeSham,AverageMinVolumeMI];
ESPVR=[AverageESPVRSham,AverageESPVRMI];
EDPVR=[AverageEDPVRSham,AverageEDPVRMI];
StrokeWork=[AverageStrokeWorkSham,AverageStrokeWorkMI];
AValue=[AverageAvalueSham,AverageAvalueMI];
BValue=[AverageBvalueSham,AverageBvalueMI];
g1=repmat({'Sham'},4,1);
g2=repmat({'MI'},5,1);
g=[g1;g2];

%% Box and Whiskers plot of averages
figure
subplot(2,3,1)
boxplot(Time,g)
ylabel('Average Times (ms)')
title('Box Plot of Average Times')
subplot(2,3,2)
boxplot(MaxPressure,g)
ylabel('Average Pressures (mmHg)')
title('Box Plot of Average Max Pressure')
subplot(2,3,3)
boxplot(MinPressure,g)
ylabel('Average Pressures (mmHg)')
title('Box Plot of Average Min Pressure')
subplot(2,3,4.5)
boxplot(MaxVolume,g)
ylabel('Average Volumes (uL)')
title('Box Plot of Average Max Volume')
subplot(2,3,5.5)
boxplot(MinVolume,g)
ylabel('Average Volumes (uL)')
title('Box Plot of Average Min Volume')
figure
subplot(1,2,1)
boxplot(ESPVR,g)
ylabel('ESPVR')
title('Box Plot of ESPVR')
subplot(1,2,2)
boxplot(StrokeWork,g)
ylabel('StrokeWork')
title('Box Plot of StrokeWork')
figure
subplot(1,3,1)
boxplot(EDPVR,g)
ylabel('EDPVR')
title('Box Plot of EDPVR')
subplot(1,3,2)
boxplot(AValue,g)
ylabel('AValue')
title('Box Plot of AValues')
fig=gca;
fig.YScale='log';
subplot(1,3,3)
boxplot(BValue,g)
ylabel('BValue')
title('Box Plot of BValues')
end