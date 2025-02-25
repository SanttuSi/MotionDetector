% Function to start the processing with the algorithm that the user
% specifies
function [ motionFrames ] = processVideo(video)


    %disp("Please input the option you want to use for processing the video.")
    %disp("commands:")
    %disp("boxed")
    %disp("machine vision")
    %disp("outlines")
    %disp("datapoints")
    count = 0;
    err_count = 0;
    while count == err_count
        arg = menu('Please input the option you want to use for processing the video.','boxed','machine vision','outlines','datapoints','motion video');
        %arg= input("",'s');
        if arg == 1
            motionFrames=processWithBox(video, videoExporter());
        elseif arg == 2
            motionFrames=processWithMachineVision(video,videoExporter());
        elseif arg == 3
            motionFrames=processWithOutlines(video,videoExporter());
        elseif arg == 4
            motionFrames=processWithGetMovement(video);
        elseif arg == 5
            motionFrames=processWithGetMovement(video);
            timeStamps=framesToTimestamps(motionFrames, video);
            processWithMovement(video, timeStamps, videoExporter());
        else
            disp("Command not recognized. Please try again.")
            err_count = err_count + 1;
        end
        count= count+1;
    end
end

