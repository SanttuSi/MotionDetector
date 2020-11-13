% Creates the VideoWriter object
function [writeObj]=videoExporter()
    count = 0;
    err_count = 0;
    while count == err_count
        try
            str = input("Please input the resulting videos file location.\n",'s');

             writeObj=VideoWriter(str,'MPEG-4'); % write the result video to str
        catch ERR
            disp("There was an error in trying to use the selected file location.")
            disp(ERR)
            disp("Please try again.")
            err_count = err_count + 1;
        end
        count = count + 1;
    end
end
