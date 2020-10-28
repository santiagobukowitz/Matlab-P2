function [maxt,maxheight] = MaxHeight(ih,iv,g,incr,ltime)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
for j=1:incr:ltime;
h(j)=ih+iv.*j+0.5.*g.*j.^2;
end 
maxh=-5000;
for j=1:incr:ltime
    if h(j)>maxh;
        maxh=h(j);
        i=j;
    end
end

maxheight=maxh;
maxt=i;
