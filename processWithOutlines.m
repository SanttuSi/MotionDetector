function [ motionFrames ] = processWithOutlines(video,writeObj)
    disp("Starting processing...")
    lastFrame=rgb2gray(readFrame(video)); % read the first frame and convert it to grayscale
    vid=writeObj;
    open(vid); % open the file 
    width=video.Width; 
    height=video.Height;
    frameCount=1;
    motionFrames=[];
   
    while hasFrame(video)
        frame = readFrame(video); %read the next frame
        grayFrame= rgb2gray(frame); % convert frame to grayscale
        modifiedFrame=frame;% make a copy of the frame to mofidy
        diff=grayFrame-lastFrame; % calculate the difference of the frames
        movementOutlines=modifiedFrame+diff; % joins together movement and frame difference
        
        found = 0;
        if ~isempty(diff(diff>70))
            for i=1:height
                for j = 1:width
                    if diff(i,j)>70 % mark up the value where the differnce is larger than 70
                        found=1;
                    end
                end
            end
        end
        
        if found
            motionFrames=[motionFrames frameCount];
        end
        
        % write the frame to the file
        writeVideo(vid,movementOutlines);
        % save last frame
        lastFrame=grayFrame;
        frameCount= frameCount+1;
        
    end
 
    disp("processing completed.")
    close(vid)
end