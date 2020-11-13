% function that finds movement and only returns the frames that it detected
% motion in

% TODO:
%   -optimization

function [ motionFrames ] = processWithGetMovement(video)
    disp("Starting processing...")
    lastFrame = rgb2gray(readFrame(video)); % read the first frame and convert it to grayscale
    
    % variables of the video format
    maxFrames = video.NumFrames;
    motionFrames=zeros(1,maxFrames);
    motionFrameCounter=1;
    
    %loop trough each frame
    for i=2:maxFrames
        frame = readFrame(video); %read the next frame
        grayFrame= rgb2gray(frame); % convert frame to grayscale
        diff=grayFrame-lastFrame; % calculate the difference of the frames
        
        %Check if frame difference is over 70
        % Assign numeric values to check if it's the first frame or the
        % last frame of motion frames, or if it's motionless frame
        if ~isempty(diff(diff>70))
            motionFrames(motionFrameCounter)=i;
            motionFrameCounter=motionFrameCounter+1;
        end
        
        % save last frame
        lastFrame=grayFrame;
    end
    motionFrames = motionFrames(1:motionFrameCounter);
    
    disp("processing completed.")
end
