clc;
clear all;
obj=videoinput('winvideo');
vp=vision.VideoPlayer;
facedetector=vision.CascadeObjectDetector();
for i=1:10 % temporary. Will later be replaced by 'while true'
    frame=getsnapshot(obj);
    %===================================================
    %manipulate frame here
    bbox=step(facedetector,frame);
    frame=insertObjectAnnotation(frame,'rectangle',bbox,'face');
    %===================================================
    step(vp,frame)
end
delete(obj);
delete(vp);