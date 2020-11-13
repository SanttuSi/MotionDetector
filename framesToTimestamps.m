

function [ timeStamps ] = framesToTimestamps(motionFrames, video)
    %disp("Converting frames to timestamps...")
    
    frameRate = video.FrameRate;
    motionMatrix = [];
    i = 1;
    j = 1;
    spotMotionFrames = 1;
    timeStamps = [];
    frameSpace = 1;
    
    for n = 1:length(motionFrames)
        currentFrame = motionFrames(n);
        if n ~= 1
            lastFrame = motionFrames(n-1);
            frameSpace = currentFrame - lastFrame;
        end
        
        if frameSpace == 1 && spotMotionFrames == 1
            motionMatrix(i,1) = currentFrame;
            i = i+1;
            spotMotionFrames = 0;
        elseif frameSpace ~= 1 && spotMotionFrames == 0
            motionMatrix(j,2) = lastFrame;
            j = j+1;
            n = n-1;
            spotMotionFrames = 1;
        end
        
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
    
    % Convert framestamps into timestamps
    spot = 1;
    i = 1;
    j = 1;
    for n = 1:size(motionMatrix,1)
        timeStampStart = motionMatrix(n,1)/frameRate; %seconds
        timeStampEnd = motionMatrix(n,2)/frameRate;
        timeStampStart = round(timeStampStart,1); timeStampEnd = round(timeStampEnd,1);
        timeStamps(i,1) = timeStampStart;
        timeStamps(j,2) = timeStampEnd;
        i = i+1;
        j = j+1;
    end
    fprintf('\n');
    disp("Time spaces with motion")
    disp("In seconds:")
    disp("------------------------")
    disp("(start time, end time)")
    disp(timeStamps)
    
end
            
