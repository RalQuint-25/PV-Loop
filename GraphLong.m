function GraphLong(name)
% The purpose of this function is to isolate, graph and store individual
% heartbeats
path=append(name,'.txt');
TableofData=readtable(path);
Time=table2array(TableofData(:,"Time"));
p_LV=table2array(TableofData(:,"LAS30a1_AnalogChannel01"));
V_LV=table2array(TableofData(:,"LAS30a1_AnalogChannel02"));
p_LV_ave=smoothdata(p_LV,'movmean',20); %20 Point Moving Average
V_LV_ave=smoothdata(V_LV,'movmean',20); %20 Point Moving Average
dp=diff(p_LV_ave); %First derivative Pressure
dp2=smoothdata(diff(dp),'movmean',20); %Second Derivative pressure

%% Finding Maximas, %ploting Minimas
[peakp,locp]=findpeaks(p_LV_ave,'MinPeakDistance',75); %Peaks of pressure
[peakdp,locdp]=findpeaks(dp,'MinPeakDistance',75); %Peaks of pressure derivative
[peakdp2,locdp2]=findpeaks(dp2,'MinPeakDistance',50); %Peaks of pressure second derivative
% Finding Minimas, %ploting Minimas
[minpeakp,minlocp]=findpeaks(-p_LV_ave,'MinPeakDistance',75); %Peaks of pressure
[minpeakdp,minlocdp]=findpeaks(-dp,'MinPeakDistance',75); %Peaks of pressure derivative
[minpeakdp2,minlocdp2]=findpeaks(-dp2,'MinPeakDistance',30,'SortStr','ascend'); %Peaks of pressure derivative
minpeakp=-minpeakp;
minpeakdp=-minpeakdp;
minpeakdp2=-minpeakdp2;
%% Isolating Heartbeats
dp2check=abs(minpeakdp2)<=0.01; %Finds Zero values in second Derivative
HBstart=sort(minlocdp2(dp2check)); % Gets zero values and superimposes them on the second derivative
%These points used to seperate heartbeats

%% Figure Creation
figure
% For loop iterates heartbeat to heartbeat to store and graph them
for i=1:length(HBstart)-2
    [~,maxloc]=max(p_LV(HBstart(i):HBstart(i+1)));
    offset=floor(maxloc*0.4);
    %In between each heart beat I added an offset based on 40% of the
    %distance from the start of HB to the max pressure
    SavedData.IsolatedHB(i).Pressure=p_LV(HBstart(i)+offset:HBstart(i+1)+offset);
    SavedData.IsolatedHB(i).Volume=V_LV(HBstart(i)+offset:HBstart(i+1)+offset);
    SavedData.IsolatedHB(i).Time=HBstart(i)+offset:HBstart(i+1)+offset;
    %Structure used to organize data
    %The following are graphs to demonstrate individual HBs
    subplot(2,2,1);
    plot(SavedData.IsolatedHB(i).Volume,SavedData.IsolatedHB(i).Pressure)
    xlabel('Volume (uL)')
    ylabel('Pressure (mmHg)')
    title('Pressure Volume Loop')
    hold on
    subplot(2,2,2);
    plot(1:length(SavedData.IsolatedHB(i).Pressure),SavedData.IsolatedHB(i).Pressure)
    xlabel('Time (ms)')
    ylabel('Pressure (mmHg)')
    title('Pressure over Single Beat Duration')
    hold on
    subplot(2,2,3);
    plot(SavedData.IsolatedHB(i).Time,SavedData.IsolatedHB(i).Pressure)
    xlabel('Time (ms)')
    ylabel('Pressure (mmHg)')
    title('Overall Pressure over Time')
    hold on
    subplot(2,2,4)
    plot(1:length(SavedData.IsolatedHB(i).Volume),SavedData.IsolatedHB(i).Volume)
    xlabel('Time (ms)')
    ylabel('Volume (uL)')
    title('Volume over Single Beat Duration')
    hold on
end

%% Saving Figure as Image and Structure
% savefig=append(name,'Img.png');
% saveas(gcf,savefig)

%% Excess data Cleaning
% Removes excess data points and adds them to next loop
% Flaw doesnt work if heartbeats dont alternate between having excess and
% not  having excess
% Flaw last heartbeat will not be affected by this code
for i=1:floor(length(SavedData.IsolatedHB)/2)
    % I noticed HB alternated between having excess and not having excess
    % so I worked with even and odd numbered HB
    while SavedData.IsolatedHB(2*i-1).Volume(end)>=SavedData.IsolatedHB(2*i-1).Volume(1)
        SavedData.IsolatedHB(2*i).Volume=[SavedData.IsolatedHB(2*i-1).Volume(end);SavedData.IsolatedHB(2*i).Volume];
       SavedData.IsolatedHB(2*i).Pressure=[SavedData.IsolatedHB(2*i-1).Pressure(end);SavedData.IsolatedHB(2*i).Pressure];
        SavedData.IsolatedHB(2*i).Time=[SavedData.IsolatedHB(2*i-1).Time(end),SavedData.IsolatedHB(2*i).Time];
        SavedData.IsolatedHB(2*i-1).Volume(end)=[];
        SavedData.IsolatedHB(2*i-1).Pressure(end)=[];
        SavedData.IsolatedHB(2*i-1).Time(end)=[];
        % I noticed the excess data was caused by an overshoot in the
        % volume values so while the end volume is greater that or equal to the
        % first data point this code will remove those points and add them
        % to the next loop
    end

    %% Graph for testing purposes
    %     figure
    %     subplot(1,2,1)
    %     plot(IsolatedHB(2*i-1).Volume,IsolatedHB(2*i-1).Pressure)
    %     subplot(1,2,2)
    %     plot(IsolatedHB(2*i).Volume,IsolatedHB(2*i).Pressure)
    savename=append(name,'_data.mat');
    save(savename,'SavedData')
end