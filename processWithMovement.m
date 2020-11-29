function [  ] = processWithMovement(video,timeStamps, writeObj)
    disp("Starting processing...")
    vid=writeObj;
    open(vid); % open the file
    FPS = video.FrameRate;
    frameMatrix = size(timeStamps);
    
    % Transform time matrix into frame matrix
    i = 1;
    j = 1;
    for m = 1:size(timeStamps,1)
        startFrame = timeStamps(m,1) * FPS;
        endFrame = timeStamps(m,2) * FPS;
        frameMatrix(i,1) = floor(startFrame);
        frameMatrix(j,2) = ceil(endFrame);
        i = i+1;
        j = j+1;
    end

    % Use frame matrix datapoints to create trimmed video with only the
    % movement clips
    for n = 1:size(frameMatrix,1)
        for frameIndex = frameMatrix(n,1):frameMatrix(n,2)
            frame = read(video,frameIndex); %read the next frame
            % write the frame to the file
            writeVideo(vid,frame);
        end
    end
    disp("processing completed.")
    close(vid)
end