function Clean(name)


%% Saves modified loops
    savename=append(name,'_dataLong.mat');
    save(savename,'IsolatedHB')
end
end