% main script to run the program:
disp("This is a program that detects motion from still video such as security camera footage.")
video=videoImport();
motionFrames=processVideo(video);
% framesToTimestamps(motionFrames); % printtaus
disp("frame rate is "+ num2str(video.FrameRate)+ " and the length is "+ num2str(video.Duration))