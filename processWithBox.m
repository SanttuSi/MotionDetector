% function to detect motion and draw a red box around the movement
% TODO:
%   -optimization
%   -adding options (such as what kind of video to export)
%   -adding user sepcified output file
function [ motionFrames ] = processWithBox(video,writeObj)
    disp("Starting processing...")
    lastFrame=rgb2gray(readFrame(video)); % read the first frame and convert it to grayscale
    vid=writeObj;
    open(vid); % open the file 
    
    % variables of the video format
    width=video.Width; 
    height=video.Height;

    framesLen=video.NumFrames;
    motionFrames=zeros(1,framesLen); % initialize the return vector
    frameCount=1;
    %loop trough each frame
    for frameIndex =2:framesLen
        frame = readFrame(video); %read the next frame
        modifiedFrame=frame;% make a copy of the frame to mofidy
        grayFrame= rgb2gray(frame); % convert frame to grayscale
        diff=grayFrame-lastFrame; % calculate the difference of the frames
        
        %initialize the points at which the red box should be drawn around
        lowest=0;
        highest=height+1;
        rightmost=0;
        leftmost=width+1;

        found=0; 
        % loop trough every pixel in the difference frame 
        for i=1:height
            wasFound=0;
            for j = 1:width
                if diff(i,j)>70 % mark up the value where the differnce is larger than 70
                    wasFound=1;
                    found=1;
                    leftmost=min(leftmost,j);
                    rightmost=max(rightmost,j);
                end
            end
            if wasFound % mark up the value where the differnce is larger than 70
                highest=min(highest,i);
                lowest=max(lowest,i);
            end
        end

        
        % draw the lines
        if found
            motionFrames(frameCount)=frameIndex;
            frameCount=frameCount+1;
            vertical=leftmost:rightmost;
            modifiedFrame(highest,vertical,1)=255;
            modifiedFrame(highest,vertical,2:3)=0;
            modifiedFrame(lowest,vertical,1)=255;
            modifiedFrame(lowest,vertical,2:3)=0;
            
            horizontal=highest:lowest;
            modifiedFrame(horizontal,rightmost,1)=255;
            modifiedFrame(horizontal,rightmost,2:3)=0;
            modifiedFrame(horizontal,leftmost,1)=255;
            modifiedFrame(horizontal,leftmost,2:3)=0;
        end
        
        
        % write the frame to the file
        writeVideo(vid,modifiedFrame);
        % save last frame
        lastFrame=grayFrame;
    end
    motionFrames=motionFrames(1:frameCount); % filter the zeros
    disp("processing completed.")
    close(vid)    
end