% function that finds movement and returns the motion frames and a video of
% the machines vision (frame difference)
function [ motionFrames ] = processWithMachineVision(video,writeObj)
    disp("Starting processing...")
    lastFrame=rgb2gray(readFrame(video)); % read the first frame and convert it to grayscale
    vid=writeObj;
    open(vid); % open the file
    framesLen=video.NumFrames;
    motionFrames=zeros(1,framesLen);
    motionFrameCounter=1;
    
    for i=2:framesLen
        frame = readFrame(video); %read the next frame
        grayFrame= rgb2gray(frame); % convert frame to grayscale
        diff=grayFrame-lastFrame; % calculate the difference of the frames
        diff(diff<90)=0;
        % write the frame to the file
        writeVideo(vid,diff);
        % save last frame
        lastFrame=grayFrame;
        if ~isempty(diff(diff>1))
            motionFrames(motionFrameCounter)=i;
            motionFrameCounter=motionFrameCounter+1;
        end
        
    end
    motionFrames= motionFrames(1:motionFrameCounter);
    disp("processing completed.")
    close(vid)
end
