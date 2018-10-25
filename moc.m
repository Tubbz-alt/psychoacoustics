function [stim, respC]=moc(ilevel,step_size,elevel,trial)
%
% This script implements the psychophysical procedure "Method of constant
% stimuli
% ilevel=starting stimulus magnitude
% step_size of the stimulus magnitude
% elevel=final stimulus magnitude
% trial= number of each stimulus has to be presented
% Usage:-
%      [stim, respC]=moc(4,2,12,10)
% Here the stimulus magnitude would be 4,6,8,10,12 and at each magnitude
% stimuli will be presented 10times
% Further queries contact arivudai.nambi@manipal.edu


lev=ilevel:step_size:elevel;
stim_lev=repmat(lev,1,trial);
stim_lev=stim_lev(randperm(length(stim_lev)));
n=1;

cresp_array=[];

while n<=length(stim_lev)
    mag=stim_lev(n);
    [cResp] = signal(mag);
    cresp_array=[cresp_array cResp];
    n=n+1;
end
x=1;
stim=[];
respC=[];

while x<=numel(lev)
    stim1=lev(x);
    stim=[stim stim1];
    t_cresp=cresp_array(stim_lev==stim1);
    t_cresp1=sum(t_cresp);
    respC=[respC t_cresp1];
    x=x+1;
end
    
