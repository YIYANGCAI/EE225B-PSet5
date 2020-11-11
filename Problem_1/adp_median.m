function II=adp_median(I,Smax)
% first we set a restriction of "kernel size", denser noise, larger Smax
if (Smax<=1)||(Smax/2==round(Smax/2))||(Smax~=round(Smax))
    error('Smax must be an odd integer >1');
end
%initiailization
II=I;
II(:)=0;
alreadyProcessed=false(size(I));
%iteration
for k=3:2:Smax
zmin=ordfilt2(I,1,ones(k,k),'symmetric');
zmax=ordfilt2(I,k*k,ones(k,k),'symmetric');
zmed=medfilt2(I,[k k],'symmetric');
% pixels which processed by B
processUsingLevelB=(zmed>zmin)&(zmax>zmed)&(~alreadyProcessed);
zB=(I>zmin)&(zmax>I);
outputZxy=processUsingLevelB&zB;
outputZmed=processUsingLevelB&~zB;
II(outputZxy)=I(outputZxy);
II(outputZmed)=zmed(outputZmed);
alreadyProcessed=alreadyProcessed|processUsingLevelB;
if all(alreadyProcessed(:))
    break;
end
end
%original value of the pixel
II(~alreadyProcessed)=I(~alreadyProcessed);
