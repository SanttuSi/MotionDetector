function [  ] = processWithMovement(video,timeStamps, writeObj)
    disp("Processing...")
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
        frameMatrix(i,1) = ceil(startFrame);
        frameMatrix(j,2) = floor(endFrame);
        i = i+1;
        j = j+1;
    end

    % Use frame matrix datapoints to create trimmed video with only the
    % movement clips
    for n = 1:size(frameMatrix,1)
        for frameIndex = frameMatrix(n,1):frameMatrix(n,2)
            if frameIndex < video.NumFrames && frameIndex > 0 
                frame = read(video,frameIndex); %read the next frame
                % write the frame to the file
                writeVideo(vid,frame);
            end
        end
    end
    disp("processing completed.")
    close(vid)
end