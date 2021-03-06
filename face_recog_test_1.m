clc;
clear all;
obj=videoinput('winvideo');
vp=vision.VideoPlayer;
facedetector=vision.CascadeObjectDetector();
overlay=imread('krrish.jpg');
disp('press ctrl+c to exit')
while 1 
    frame=getsnapshot(obj);
    %===================================================
    %manipulate frame here
    bbox=step(facedetector,frame);
    faces=size(bbox);
    for i=1:faces(1) %do for each face
        reduced_overlay=imresize(overlay,[bbox(i,3) bbox(i,4)]);
        for j=bbox(i,2):bbox(i,2)+bbox(i,3)-1
            for k=bbox(i,1):bbox(i,1)+bbox(i,4)-1
                for m=1:3
                    if reduced_overlay(j-bbox(i,2)+1,k-bbox(i,1)+1,m)<250
                        frame(j,k,m)=reduced_overlay(j-bbox(i,2)+1,k-bbox(i,1)+1,m);
                    end
                end
            end
        end
    end
    
    
    %===================================================
    step(vp,frame)
end
