% main script to run the program:
video=videoImport();
tic
processVideo(video);
toc
disp("frame rate is "+ num2str(video.FrameRate)+ " and the length is "+ num2str(video.Duration))