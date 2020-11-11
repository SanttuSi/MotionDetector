% Function to start the processing with the algorithm that the user
% specifies
function [ motionFrames ] = processVideo(video)

    disp("Please input the option you want to use for processing the video.")
    disp("commands:")
    disp("boxed")
    disp("machine vision")
    disp("outlines")
    disp("datapoints")
    count = 0;
    err_count = 0;
    while count == err_count
        arg= input("",'s');
        if arg=="boxed"
            motionFrames=processWithBox(video, videoExporter());
        elseif arg== "machine vision"
            % processWithMachineVision(video,videoExporter());
        else
            disp("Command not recognized. Please try again.")
            err_count = err_count + 1;
        end
        count= count+1;
    end
    
    
end