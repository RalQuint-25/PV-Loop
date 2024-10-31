function TableListsLong(name)
%% Retreiving Data
for i=1:5
    path=append(name{i},'_data.mat');
    load(path)
    if i==1
        ListTimeMI=SavedData.DataLists.Time;
        ListMaxPressureMI=SavedData.DataLists.MaxPressure;
        ListMinPressureMI=SavedData.DataLists.MinPressure;
        ListMaxVolumeMI=SavedData.DataLists.MaxVolume;
        ListMinVolumeMI=SavedData.DataLists.MinVolume;
        ListESPVRMI=SavedData.PVRLists.ESPVR;
        ListEDPVRMI=SavedData.PVRLists.EDPVR;
        ListStrokeWorkMI=SavedData.PVRLists.StrokeWork;
        ListAvalueMI=SavedData.PVRLists.Avalue;
        ListBvalueMI=SavedData.PVRLists.Bvalue;
    else
        ListTimeMI=[ListTimeMI;SavedData.DataLists.Time];
        ListMaxPressureMI=[ListMaxPressureMI;SavedData.DataLists.MaxPressure];
        ListMinPressureMI=[ListMinPressureMI;SavedData.DataLists.MinPressure];
        ListMaxVolumeMI=[ListMaxVolumeMI;SavedData.DataLists.MaxVolume];
        ListMinVolumeMI=[ListMinVolumeMI;SavedData.DataLists.MinVolume];
        ListESPVRMI=[ListESPVRMI;SavedData.PVRLists.ESPVR];
        ListEDPVRMI=[ListEDPVRMI;SavedData.PVRLists.EDPVR];
        ListStrokeWorkMI=[ListStrokeWorkMI;SavedData.PVRLists.StrokeWork];
        ListAvalueMI=[ListAvalueMI,SavedData.PVRLists.Avalue];
        ListBvalueMI=[ListBvalueMI,SavedData.PVRLists.Bvalue];
    end
end
for i=6:9
    path=append(name{i},'_data.mat');
    load(path)
    if i==6
        ListTimeSham=SavedData.DataLists.Time;
        ListMaxPressureSham=SavedData.DataLists.MaxPressure;
        ListMinPressureSham=SavedData.DataLists.MinPressure;
        ListMaxVolumeSham=SavedData.DataLists.MaxVolume;
        ListMinVolumeSham=SavedData.DataLists.MinVolume;
        ListESPVRSham=SavedData.PVRLists.ESPVR;
        ListEDPVRSham=SavedData.PVRLists.EDPVR;
        ListStrokeWorkSham=SavedData.PVRLists.StrokeWork;
        ListAvalueSham=SavedData.PVRLists.Avalue;
        ListBvalueSham=SavedData.PVRLists.Bvalue;
    else
        ListTimeSham=[ListTimeSham;SavedData.DataLists.Time];
        ListMaxPressureSham=[ListMaxPressureSham;SavedData.DataLists.MaxPressure];
        ListMinPressureSham=[ListMinPressureSham;SavedData.DataLists.MinPressure];
        ListMaxVolumeSham=[ListMaxVolumeSham;SavedData.DataLists.MaxVolume];
        ListMinVolumeSham=[ListMinVolumeSham;SavedData.DataLists.MinVolume];
        ListESPVRSham=[ListESPVRSham;SavedData.PVRLists.ESPVR];
        ListEDPVRSham=[ListEDPVRSham;SavedData.PVRLists.EDPVR];
        ListStrokeWorkSham=[ListStrokeWorkSham;SavedData.PVRLists.StrokeWork];
        ListAvalueSham=[ListAvalueSham,SavedData.PVRLists.Avalue];
        ListBvalueSham=[ListBvalueSham,SavedData.PVRLists.Bvalue];
    end
end

%% Histograms
figure
subplot(2,3,1)
histogram(ListTimeSham,'FaceColor','b','BinWidth',1)
hold on
histogram(ListTimeMI,'FaceColor','r','BinWidth',1)
title('Histogram of Time per Heartbeat')
xlabel('Time (ms)')
ylabel('Frequency')
legend('Sham','MI')
subplot(2,3,2)
histogram(ListMaxPressureSham,'FaceColor','b','BinWidth',1)
hold on
histogram(ListMaxPressureMI,'FaceColor','r','BinWidth',1)
title('Histogram of Max Pressure')
xlabel('Pressure (mmHg)')
ylabel('Frequency')
legend('Sham','MI')
subplot(2,3,3)
histogram(ListMinPressureSham,'FaceColor','b','BinWidth',.5)
hold on
histogram(ListMinPressureMI,'FaceColor','r','BinWidth',.5)
title('Histogram of Min Pressure')
xlabel('Pressure (mmHg)')
ylabel('Frequency')
legend('Sham','MI')
subplot(2,3,4.5)
histogram(ListMaxPressureSham,'FaceColor','b','BinWidth',1)
hold on
histogram(ListMaxPressureMI,'FaceColor','r','BinWidth',1)
title('Histogram of Max Volume')
xlabel('Volume (uL)')
ylabel('Frequency')
legend('Sham','MI')
subplot(2,3,5.5)
histogram(ListMinVolumeSham,'FaceColor','b','BinWidth',1)
hold on
histogram(ListMinVolumeMI,'FaceColor','r','BinWidth',1)
title('Histogram of Min Volume')
xlabel('Volume (uL)')
ylabel('Frequency')
legend('Sham','MI')
figure
subplot(1,2,1)
histogram(ListESPVRSham)
hold on
histogram(ListESPVRMI)
title('Histogram of ESPVR per Heartbeat')
xlabel('ESPVR')
ylabel('Frequency')
legend('Sham','MI')
subplot(1,2,2)
histogram(ListStrokeWorkSham)
hold on
histogram(ListStrokeWorkMI)
title('Histogram of StrokeWork per Heartbeat')
xlabel('StrokeWork')
ylabel('Frequency')
legend('Sham','MI')
figure
subplot(1,3,1)
histogram(ListEDPVRSham)
hold on
histogram(ListEDPVRMI)
title('Histogram of EDPVR per Heartbeat')
xlabel('EDPVR')
ylabel('Frequency')
legend('Sham','MI')
subplot(1,3,2)
histogram(ListAvalueSham)
hold on
histogram(ListAvalueMI)
title('Histogram of EDPVR per Heartbeat')
xlabel('EDPVR')
ylabel('Frequency')
legend('Sham','MI')
subplot(1,3,3)
histogram(ListBvalueSham)
hold on
histogram(ListBvalueMI)
title('Histogram of EDPVR per Heartbeat')
xlabel('EDPVR')
ylabel('Frequency')
legend('Sham','MI')

%% Kernel Density Plots
figure
subplot(2,3,1)
ksdensity(ListTimeSham)
hold on
ksdensity(ListTimeMI)
title('ksdensity of Time per Heartbeat')
xlabel('Time (ms)')
ylabel('Frequency')
legend('Sham','MI')
subplot(2,3,2)
ksdensity(ListMaxPressureSham)
hold on
ksdensity(ListMaxPressureMI)
title('ksdensity of Max Pressure')
xlabel('Pressure (mmHg)')
ylabel('Frequency')
legend('Sham','MI')
subplot(2,3,3)
ksdensity(ListMinPressureSham)
hold on
ksdensity(ListMinPressureMI)
title('ksdensity of Min Pressure')
xlabel('Pressure (mmHg)')
ylabel('Frequency')
legend('Sham','MI')
subplot(2,3,4.5)
ksdensity(ListMaxPressureSham)
hold on
ksdensity(ListMaxPressureMI)
title('ksdensity of Max Volume')
xlabel('Volume (uL)')
ylabel('Frequency')
legend('Sham','MI')
subplot(2,3,5.5)
ksdensity(ListMinVolumeSham)
hold on
ksdensity(ListMinVolumeMI)
title('ksdensity of Min Volume')
xlabel('Volume (uL)')
ylabel('Frequency')
legend('Sham','MI')
figure
subplot(1,2,1)
ksdensity(ListESPVRSham)
hold on
ksdensity(ListESPVRMI)
title('ksdensity of ESPVR per Heartbeat')
xlabel('ESPVR')
ylabel('Frequency')
legend('Sham','MI')
subplot(1,2,2)
ksdensity(ListStrokeWorkSham)
hold on
ksdensity(ListStrokeWorkMI)
title('ksdensity of StrokeWork per Heartbeat')
xlabel('StrokeWork')
ylabel('Frequency')
legend('Sham','MI')
figure
subplot(1,3,1)
ksdensity(ListEDPVRSham)
hold on
ksdensity(ListEDPVRMI)
title('ksdensity of EDPVR per Heartbeat')
xlabel('EDPVR')
ylabel('Frequency')
legend('Sham','MI')
subplot(1,3,2)
ksdensity(ListAvalueSham)
hold on
ksdensity(ListAvalueMI)
title('ksdensity of Avalues per Heartbeat')
xlabel('Avalues')
ylabel('Frequency')
legend('Sham','MI')
subplot(1,3,3)
ksdensity(ListBvalueSham)
hold on
ksdensity(ListBvalueMI)
title('ksdensity of Bvalue per Heartbeat')
xlabel('Bvalue')
ylabel('Frequency')
legend('Sham','MI')

%% Organizing Data for box Plots
Time=[ListTimeSham;ListTimeMI];
MaxPressure=[ListMaxPressureSham;ListMaxPressureMI];
MinPressure=[ListMinPressureSham;ListMinPressureMI];
MaxVolume=[ListMaxVolumeSham;ListMaxVolumeMI];
MinVolume=[ListMinVolumeSham;ListMinVolumeMI];
ESPVR=[ListESPVRSham;ListESPVRMI];
EDPVR=[ListEDPVRSham;ListEDPVRMI];
StrokeWork=[ListStrokeWorkSham;ListStrokeWorkMI];
Avalue=[ListAvalueSham';ListAvalueMI'];
Bvalue=[ListBvalueSham';ListBvalueMI'];
g2=repmat({'MI'},2492,1);
g1=repmat({'Sham'},1129,1);
g=[g1;g2];

%% Box Plots
figure
subplot(2,3,1)
boxplot(Time,g)
ylabel('List Times (ms)')
title('Box Plot of List Times')
subplot(2,3,2)
boxplot(MaxPressure,g)
ylabel('List Pressures (mmHg)')
title('Box Plot of List Max Pressure')
subplot(2,3,3)
boxplot(MinPressure,g)
ylabel('List Pressures (mmHg)')
title('Box Plot of List Min Pressure')
subplot(2,3,4.5)
boxplot(MaxVolume,g)
ylabel('List Volumes (uL)')
title('Box Plot of List Max Volume')
subplot(2,3,5.5)
boxplot(MinVolume,g)
ylabel('List Volumes (uL)')
title('Box Plot of List Min Volume')
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
boxplot(Avalue,g)
ylabel('Avalues')
title('Box Plot of Avalues')
subplot(1,3,3)
boxplot(Bvalue,g)
ylabel('Bvalues')
title('Box Plot of Bvalues')
end
