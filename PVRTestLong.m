function PVRTestLong(name)
% The purpose of this function is to identify ESPVR,Stroke work and EDPVR
% and its values
% The ploting is for visual and testing purposes, does not affect overall
% code
path=append(name,'_data.mat');
load(path)
figure
for i=1:length(SavedData.IsolatedHB)
   %Iterates through all HB
   savedvol=SavedData.IsolatedHB(i).Volume;
   savedpre=SavedData.IsolatedHB(i).Pressure;
   %Presave data because I average them later
   subplot(1,2,1)
   plot(SavedData.IsolatedHB(i).Volume,SavedData.IsolatedHB(i).Pressure)
   %Pressure Volume loop
   hold on
   %% Stroke work
       strokework=-1*polyarea(SavedData.IsolatedHB(i).Volume,SavedData.IsolatedHB(i).Pressure);
%% Isolating Top Left Corner
   [maxpressure,maxpressureloc]=max(SavedData.IsolatedHB(i).Pressure);
   [minvolume,minvolumeloc]=min(SavedData.IsolatedHB(i).Volume);
   plot(SavedData.IsolatedHB(i).Volume([maxpressureloc:minvolumeloc]),SavedData.IsolatedHB(i).Pressure([maxpressureloc:minvolumeloc]),'ro')
%Identifies and plots top leftmost points
   SavedData.IsolatedHB(i).Volume=smoothdata(SavedData.IsolatedHB(i).Volume,'movmean',20);
   SavedData.IsolatedHB(i).Pressure=smoothdata(SavedData.IsolatedHB(i).Pressure,'movmean',20);
  
   for j=maxpressureloc:minvolumeloc
       degree = 1;
       coefficients = polyfit(SavedData.IsolatedHB(i).Volume([j-1,j,j+1]),SavedData.IsolatedHB(i).Pressure([j-1,j,j+1]), degree);
       if coefficients(1)>0
           xintercept(j)=-coefficients(2)/coefficients(1);
       else
           xintercept(j)=0;
       end
   end
   % Finds X intercepts
   SavedData.IsolatedHB(i).Volume=savedvol;
   SavedData.IsolatedHB(i).Pressure=savedpre;
   [~,locpoint]=dsearchn([minvolume,maxpressure],[SavedData.IsolatedHB(i).Volume,SavedData.IsolatedHB(i).Pressure]);
   [~,locp]=min(locpoint);
   % I found the max pressure min volume point and found the point closes
   % to this value
   [minxintercept,minxinterceptloc]=min(abs(nonzeros(xintercept)));
   minxinterceptloc=minxinterceptloc+maxpressureloc-1;
   plot(minvolume,maxpressure,'bo')
   plot(SavedData.IsolatedHB(i).Volume(locp),SavedData.IsolatedHB(i).Pressure(locp),'ko')
% Identifies top left most point
   if locp==length(SavedData.IsolatedHB(i).Volume)
       coefficients = polyfit(SavedData.IsolatedHB(i).Volume([locp-2,locp-1,locp]),SavedData.IsolatedHB(i).Pressure([locp-2,locp-1,locp]), degree);
       k=1;
       while coefficients(1)<=0 || abs(coefficients(1))>=100 || abs(coefficients(1))<=10^(-4)
           coefficients = polyfit(SavedData.IsolatedHB(i).Volume([locp-1-k,locp-k,locp]),SavedData.IsolatedHB(i).Pressure([locp-1-k,locp-k,locp]), degree);
           k=k+1;
           if k==10
               break;
           end
       end
   elseif locp==1
       coefficients = polyfit(SavedData.IsolatedHB(i).Volume([locp,locp+1,locp+2]),SavedData.IsolatedHB(i).Pressure([locp,locp+1,locp+2]), degree);
       k=1;
       while coefficients(1)<=0 || abs(coefficients(1))>=100 || abs(coefficients(1))<=10^(-4)
           coefficients = polyfit(SavedData.IsolatedHB(i).Volume([locp,locp+k,locp+1+k]),SavedData.IsolatedHB(i).Pressure([locp,locp+k,locp+1+k]), degree);
           k=k+1;
           if k==10
               break;
           end
       end
   else
       coefficients = polyfit(SavedData.IsolatedHB(i).Volume([locp-1,locp,locp+1]),SavedData.IsolatedHB(i).Pressure([locp-1,locp,locp+1]), degree);
       k=1;
       while coefficients(1)<=0 || abs(coefficients(1))>=100 || abs(coefficients(1))<=10^(-4)
           coefficients = polyfit(SavedData.IsolatedHB(i).Volume([locp-k,locp,locp+k]),SavedData.IsolatedHB(i).Pressure([locp-k,locp,locp+k]), degree);
           k=k+1;
           if k==10
               break;
           end
       end
   end
% This if else statement goes over multiple conditions based on the value
% of the top left most point. Also ensures that this point is not a
% vertical or horizontal line
%% Identifying floor of PV Loop
   SavedData.IsolatedHB(i).Volume=smoothdata(SavedData.IsolatedHB(i).Volume,'movmean',10);
   SavedData.IsolatedHB(i).Pressure=smoothdata(SavedData.IsolatedHB(i).Pressure,'movmean',10);
   % I had to average to identify floor
   [minpressure,minpressureloc]=min(SavedData.IsolatedHB(i).Pressure(maxpressureloc:end));
   % Finds min Pressure
   minpressureloc=minpressureloc+maxpressureloc;
   [maxnvolume,maxvolumeloc]=max(SavedData.IsolatedHB(i).Volume);
   %Find max volume
   points=length(minpressureloc:length(SavedData.IsolatedHB(i).Volume));
   SavedData.IsolatedHB(i).Volume=savedvol;
   SavedData.IsolatedHB(i).Pressure=savedpre;
   %  I returned values back to original
   if points<=10
       points=(length(SavedData.IsolatedHB(i).Volume)-10):length(SavedData.IsolatedHB(i).Volume);
       plot(SavedData.IsolatedHB(i).Volume(points),SavedData.IsolatedHB(i).Pressure(points),'go')
   else
       points=minpressureloc:length(SavedData.IsolatedHB(i).Volume);
       plot(SavedData.IsolatedHB(i).Volume([minpressureloc:end]),SavedData.IsolatedHB(i).Pressure([minpressureloc:end]),'go')
   end
% If statement ensures I get sufficient points for the floor
%% Identifying EDPVR Function
   x=0:.1:maxnvolume*1.3;
   plot(x,coefficients(1)*x+coefficients(2))
   xdata=SavedData.IsolatedHB(i).Volume(points);
   ydata=SavedData.IsolatedHB(i).Pressure(points);
   MiniPressure=min(SavedData.IsolatedHB(i).Pressure);
   % Creates parameters for the data fitting, these are the floor of the
   % PV Loops
   fun = @(c,xdata) c(1)*exp(c(2)*xdata)+MiniPressure;
   c0 = [1,1];
   edpvrco=lsqcurvefit(fun,c0,xdata,ydata);
   % Data fitting
%% Plots to make sure fitting was done correctly
   plot(x,edpvrco(1)*exp(edpvrco(2)*x)+MiniPressure)
   xlim([(minvolume-1),(maxnvolume+1)])
   ylim([(minpressure-1),(maxpressure+1)])
   plot(maxnvolume,minpressure,'ko')
   [~,locpoint]=dsearchn([maxnvolume,minpressure],[xdata,ydata]);
   [~,locp]=min(locpoint);
   hold off
   subplot(1,2,2)
   hold on
   plot(x,edpvrco(1)*exp(edpvrco(2)*x)+MiniPressure)
%% Saves Values to new structure
   EDPVRVolume=SavedData.IsolatedHB(i).Volume(points(locp));
   SavedData.PVRatio(i).ESPVR=abs(coefficients(1));
   SavedData.PVRatio(i).EDPVR=edpvrco(1)*edpvrco(2)*exp(edpvrco(2)*EDPVRVolume);
   SavedData.PVRatio(i).Strokework=strokework;
   SavedData.PVRatio(i).A=edpvrco(1);
   SavedData.PVRatio(i).B=edpvrco(2);
end
%% Stores Structures
savename=append(name,'_data.mat');
save(savename,'SavedData')
clear("xintercept")
end

