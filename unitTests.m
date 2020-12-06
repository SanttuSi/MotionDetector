%% test with a file specified in path
path='horizontal60fps.mp4';
video=VideoReader(path);

%test times
disp("testing movement"+newline)
movementTime=tic;
frames=processWithGetMovement(video);
movementEnd=toc(movementTime);

disp("testing machine vision" +newline)
video=VideoReader(path);
MVObj=VideoWriter('MachineVision','MPEG-4');
MVTime=tic;
processWithMachineVision(video,MVObj);
MVTEnd=toc(MVTime);

disp("testing boxed"+newline)
video=VideoReader(path);
BObj=VideoWriter('Boxed','MPEG-4');
boxTime=tic;
processWithBox(video,BObj);
BoxEnd=toc(boxTime);

disp("testing outlined"+newline)
video=VideoReader(path);
OutObj=VideoWriter('Outlined','MPEG-4');
OutTime=tic;
processWithOutlines(video,OutObj);
OutEnd=toc(OutTime);

disp ("testing cutting movement" + newline);
video=VideoReader(path);
cutObj=VideoWriter('Cut','MPEG-4');
cutTime=tic;
stamps=framesToTimestamps(frames,video);
processWithMovement(video,stamps,cutObj);
cutEnd=toc(cutTime);

disp("times:")
disp('movement:' )
disp(movementEnd)
disp('machine vision:' )
disp(MVTEnd)
disp('boxed:' )
disp(BoxEnd)
disp('outlined:' )
disp(OutEnd)
disp('cutting video to movement parts:')
disp(cutEnd)
