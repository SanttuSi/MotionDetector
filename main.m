% main script to run the program:
disp("This is a program that detects motion from still video such as security camera footage.")
video=videoImport();
motionFrames=processVideo(video);
timeStamps=framesToTimestamps(motionFrames, video); % printtaus
% Printing the resulting timestamps
fprintf('\n');
disp("Time spaces with motion")
disp("In seconds:")
disp("------------------------")
disp("(start time, end time)")
disp(timeStamps)
disp("frame rate is "+ num2str(video.FrameRate)+ " and the length is "+ num2str(video.Duration))