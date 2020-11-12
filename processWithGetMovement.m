% function that finds movement and only returns the frames that it detected
% motion in

% TODO:
%   -optimization

function [ motionFrames ] = processWithGetMovement(video)
    disp("Starting processing...")
    lastFrame = rgb2gray(readFrame(video)); % read the first frame and convert it to grayscale
    
    % variables of the video format
    maxFrames = video.NumFrames;
    frameCount=1;
    motionMatrix=[];
    motionFrames=[];
    
    % Variables for the framematrix
    i = 1;
    j = 1;
    spotMotionFrames = 0;
    
    %loop trough each frame
    while hasFrame(video)
        frame = readFrame(video); %read the next frame
        grayFrame= rgb2gray(frame); % convert frame to grayscale
        diff=grayFrame-lastFrame; % calculate the difference of the frames
        
        %Check if frame difference is over 70
        % Assign numeric values to check if it's the first frame or the
        % last frame of motion frames, or if it's motionless frame
        if ~isempty(diff(diff>70))
            spotMotionFrames = spotMotionFrames+1;
        elseif spotMotionFrames >= 1 && ~isempty(diff(diff<70))
            spotMotionFrames = -1;
        elseif ~isempty(diff(diff<70)) & spotMotionFrames == -1
            spotMotionFrames = 0;
        end
        
        % If it's the first frame of the motion frames the spotMotionFrames
        % value is 1, if it's the last the value is -1 and in other cases
        % its either motionless or between start and end frame.
        if spotMotionFrames == 1
            motionMatrix(i,1) = frameCount; 
            i = i+1;
        elseif spotMotionFrames == -1
            motionMatrix(j,2) = frameCount - 1;
            j = j+1;
        end
        
        % Check that if the last motion frame is the same as the last frame
        % of the video to make sure that the last value of the motion frame
        % matrix is wirtten
        if j ~= i && frameCount == maxFrames-1
            motionMatrix(j,2) = maxFrames;
            j = j+1;
        end
        % save last frame
        lastFrame=grayFrame;
        frameCount= frameCount+1;
    end
    
    % Delete all the motion frame spaces that are less than 3 frames long
    % to prevent noise induced motion stamps
    deleteSpots = zeros(size(motionMatrix,1),1);
    spot = 1;
    for n = 1:size(motionMatrix,1)
        frameContinium = motionMatrix(n,2) - motionMatrix(n,1);
        if frameContinium < 3
            deleteSpots(spot,1) = n;
            spot = spot + 1;
        end
    end
    
    
    deleteSpots(deleteSpots==0) = [];
    motionMatrix(deleteSpots(:),:) = []; 
    fprintf('\n');
    disp("Frames with motion:")
    disp("(start frame, end frame)")
    disp(motionMatrix)
    
    % Create a frame vector from the motion matrix.
    spot = 1;
    for y = 1:size(motionMatrix,1)
        for x = motionMatrix(y,1):motionMatrix(y,2)
            motionFrames(1,spot) = x;
            spot = spot + 1;
        end
    end
    
    disp("processing completed.")
end
       
