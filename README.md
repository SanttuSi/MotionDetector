


## About The Project


This project was done during the the course "Sovellettu Digitaalinen Signaalinkäsittely" which is teached in Aalto University. The main focus of this project was to create an application that can detect motion from still video. This could be used for processing surveillance footage. More information about the project can be found from this document.

### Built With

This project uses [Matlab](https://ch.mathworks.com/products/matlab.html) for analyzing the videos. The project uses the [image processing toolbox](https://ch.mathworks.com/products/image.html) for Matlab. The project uses the frame difference method for finding movement in the video.


## Getting Started

The project was tested on Windows 10 and Matlab R2020a & 2020b. It has not been tested on other platforms and thus may not work on those platforms.

### Prerequisites


* Matlab R2020a or 2020b
* Image processing toolbox for Matlab
 

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/your_username_/Project-Name.git
   ```
2. Open the project in Matlab


## Usage

Example of using the program:
1. Run the main function (or unit tests for testing)
   ```MATLAB
   main
   ```
2. Input the file path to the video that you want to analyze in to the command window (for example one of the included videos)
    ```MATLAB
   ExampleVideos\testVideo1.mp4
   ```
3. Select processing method from the GUI (processing with a box around the movement )
4. Input a path for the resulting video
    ```MATLAB
   boxedVideo
   ```




## License

Distributed under the MIT License. See `LICENSE` for more information.




## Creators

 Santeri Sipilä - santeri.sipila@aalto.fi  
 Daniel Nikkari  - daniel.nikkari@aalto.fi
 Frans Welin  





