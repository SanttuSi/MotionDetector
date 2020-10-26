% a function to import a video into matlab from a path that the user
% specifies

function [ video ] = videoImport()
    count = 0;
    err_count = 0;
    while count == err_count
        try
            str = input("Please input the file location of the video.\n",'s');
            video=VideoReader(str);
        catch ERR
            disp("Video location was not found. Please input another filepath.")
            err_count = err_count + 1;
        end
        count = count + 1;
    end
    
end