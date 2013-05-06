# Robin MoCap Demonstration Material 2013

All of the following patches has been created in Max/Msp. 
Max/Msp 6.0 or higher is required for running the patches. 
A free [Runtime](http://cycling74.com/downloads/runtime/) version is available.
Make sure the folder «Robin MoCap Demonstrasjonmateriale 2013» is added to Max/Msp’s [search path](http://cycling74.com/docs/max5/vignettes/core/search_path.html). 
The patches are tested on Mac OSX only, but should also work fine on Windows machines, with little configuration needed.  

The material currently includes the use of two types of motion capture hardware, reflected in the subfolders on the top of the folder hierarchy:  

* iPod 
* Kinect

## Dependencies 

There are third-party objects required to run some of the patches.
Here are links to Mac versions, but Windows versions are also available.

* [CNMAT externals](http://cnmat.berkeley.edu/files/maxdl/ALL/CNMAT-Everything-OSX-MachO.tar.gz)
* [cv.jit externals](https://sourceforge.net/projects/cvjit/files/cv.jit_OSX_v1.7.2.zip/download)
* [jit.freenect.grab](https://github.com/downloads/jmpelletier/jit.freenect.grab/jit.freenect.grab_rc5.zip)
* [jit.openni](http://hidale.com/wp-content/uploads/2012/09/jit.openni.v0.88_MAC_OSX.zip)
* FourMs’ fFE.3D1, fSM.loop & fSM.soundsaber

These dependencies are already installed on the Mac Pro in the innermost left corner of the Robin MoCap lab, and the "piano" iMac.

The jit.openni external is included in the **Kinect-skeleton-visualization** patch, and allows for automatic detection of skeleton joints from the Kinect sensor. This abstraction requires the OpenNI framework to be able to work. This step can be skipped if the **Kinect-skeleton-visualization** patch is not going to be in use. 

### Installing OpenNI

Mac OSX:

* Install [libusb](http://hidale.com/wp-content/uploads/2012/09/libusb-1.0.9.pkg_.zip)
* Install [OpenNI](http://hidale.com/wp-content/uploads/2012/09/OpenNI-Bin-Dev-MacOSX-v1.5.4.0.tar.zip)
* Install [NITE](http://hidale.com/wp-content/uploads/2012/09/NITE-Bin-MacOSX-v1.5.2.21.tar.zip)
* Install [SensorKinect](http://hidale.com/wp-content/uploads/2012/09/SensorKinect093-Bin-MacOSX-v5.1.2.1.tar.bz2_.zip)

OpenNI, NITE & SensorKinect intalls by navigating to the separate folders in the Terminal (`cd /Users/evenbekkedal/Documents/Kinect/Sensor-Bin-MacOSX-v5.1.2.1`) and running `sudo ./install.sh`.

Windows:

* Install [OpenNI](http://hidale.com/wp-content/uploads/2012/09/OpenNI-Win32-1.5.4-Redist.zip)
* Install [NITE](http://hidale.com/wp-content/uploads/2012/09/nite-win32-1.5.2.21-redist.zip)
* Install [SensorKinect](http://hidale.com/wp-content/uploads/2012/09/SensorKinect093-Bin-Win32-v5.1.2.1-OpenNI-1.5.4.0.zip)

The Mac Pro in the inner left corner of the MoCap lab and the iMac on top of the Piano is currently set up to use the Kinect sensor. 

##  iPod

These are patches for demonstrating motion capture using iPhone or iPod devices. 
All patches rely on the motion data provided by the *Epics HyperMusic* iOS app. It is important that the device and the computer running the patches are on the same network, and that the correct IP address of the computer is set in the app’s settings. Make sure that the ‘Send port’ in the app’s settings is set to 9999. 

The iPod folder inlcude these subfolders:

* iPod MoCap Recording + Playback
* iPod MoCap Tools
* iPod Model Controller
* iPod Simplesynth
* iPod SoundSaber + LoopPlayer

### iPod MoCap Recording + Playback

![](https://raw.github.com/evenbekkedal/robin-mocap-demo/master/screenshots/iPod-Mocap-Recorder.png)

The **iPod-Mocap-Recorder** patch can receive MoCap data through the left input and record this data. The data will be stored in a textfile inside the folder containing the patcher. By inserting the subject’s name in the *subject name* textbox  and pressing enter, the recordings will be easily recognized for use in further work. It is possible to record several tests with the same identifying name by making sure the *test number* is unique. 

![](https://raw.github.com/evenbekkedal/robin-mocap-demo/master/screenshots/iPod-Mocap-Playback.png)

The **iPod-Mocap-Playback** patch will be able to read and play back the MoCap data recorded by the *iPodMocapRecorder* patcher. The patch can run by itself, but works best when inlcuded in another patch as an *abstraction* (a patch within a patch). An example of this is included in the **iPod-DataVisualizer** patch, where a datafile can be loaded and played back for visualization. 

* To create an abstraction inside a Max patch press `n` for new object, followed by `*name of patcher*`, e.g. `iPod-Input`

When implemented in another patch, it is possible to connect a 'Start/Stop' toggle to the first inlet, a bang to read file in the second inlet and a 'Print to Max Window' toggle to the third inlet. The first outlet will send the data from the file played back, and the second outlet will send a bang when the playback of the file has finished. 

### iPod MoCap Tools

The iPod MoCap Tools folder includes the patchers **iPod-Input**, **iPod-DataVisualizer** & **iPod-DataVisualizer-Small**.

![](https://raw.github.com/evenbekkedal/robin-mocap-demo/master/screenshots/iPod-Input.png)

The **iPod-Input** patch simply connects to the *HyperMusic* app with the correct host port provided. The data can be streamed through the patch's left outlet. It is also possible to print the whole input stream to the *Max window*. This patch works best as an *abstraction* inside another patch. When implemented as an abstraction, it is possible to connect a toggle for outputting data to the first inlet, a 'Print to Max Window' toggle to the second inlet, and a menu-object inlcuding correct prefix name for filtering data to the third inlet. The data will be sent out the only outlet. The *Port number* is as default set to '9999'. This can be changed by double clicking the abstraction, or inlcuding an @port ''number' argument when calling the abstraction in a patch, i.e. `iPod-Input @port 9999`.

![](https://raw.github.com/evenbekkedal/robin-mocap-demo/master/screenshots/iPod-DataVisualizer.png)

The **iPod-DataVisualizer** patch can perform a simple running graph visualization of the incoming data in the separate X, Y & Z axes. At this time, “Acceleration”, “Rotation” & “Gravity” data is available to display. The patch inlcudes **iPod-Input** and **iPod-Mocap-Playback** abstractions for both live input and playback of data. 

The **iPod-DataVisualizer-Small** is a simpler version of **iPod-DataVisualizer**. 
This patch can run as a *bpatcher* inside another patch, this is the same as an *abstraction*, only with a graphical interface. 

* To create a bpatcher inside a Max patch press `n` for new object, followed by `bpatcher *name of patcher*`, e.g. `bpatcher iPod-DataVisualizer-Small`

### iPod Model Controller

The **iPod-Model-Controller** lets you use the *HyperMusic* app to controll two different 3D models.  
The *iPhone* model will follow the rotational orientation of the device. This should provide a close representation of the orientation of the physical device if calibrated correctly. Keep the device flat and pointing towards the screen projecting the visualization when opening the *HyperMusic* app. 
The *Blocky* model will let the app controll discrete body parts of the model. As of now, only the arms are implemented.

### iPod SimpleSynth

![]](https://raw.github.com/evenbekkedal/robin-mocap-demo/master/screenshots/iPod-Simplesynth.png)

The iPod SimpleSynth patch is a simple sonification of the MoCap data provided by the *HyperMusic* app.  
Make sure the *Fireface12* audio interface is chosen in the Max *Options/Audio status..* menu. Check also that there are five audiocables connected between outputs 1-5 on the interface & four Yamaha speakers + one subwoofer (Speakers 1-4: Output 1-4. Subwoofer: Output 5). The speakers should be placed in a square; front, back, left & right. 

The sound is controlled by the mocap data streamed from the iPod: 

* iPod pitch controls audio pitch frequency
* iPod jaw controls audio 
* iPod bend 

### iPod Soundsaber & LoopPlayer

![](https://raw.github.com/evenbekkedal/robin-mocap-demo/master/screenshots/iPod-Soundsaber%2BLoopplayer.png)

The iPod Soundsaber & LoopPlayer patch is based on Kristian Nymoen’s [MoCap synthesizer](http://www.uio.no/english/research/groups/fourms/projects/sma/subprojects/Soundsaber/)  patch, using the *HyperMusic* app as input. 

## Kinect 

Make sure that both the Kinect device power cable and usb cable is properly connected.  

To be able to use the Kinect sensor data within Max, two possible external objects can be utilized: 

* jit.freenect.grab
* jit.openni

jit.freenect.grab will create streams from the *basic* sensor data of the Kinect, the RGB camera and the IR depthmap camera. No other requirements are needed for the jit.freenect.grab object to work. 

jit.openni can access more advanced data, e.g. skeleton joint position and orientation. The jit.openni object works on the top of the OpenNI framework, and it requires the installation of this framework.

### Kinect Piano  

The **_kinectPiano** patch lets the Yamaha Disclavier be controlled by handgestures performed in front of the Kinect device. The Kinect device should be placed on the top of the piano in a centered position. The user should be placed approximately 2 meters away from the piano. When the user reach out her hands towards the piano, they should become visible in the patch's gui. 
The hands position on the x axis will controll the different pitches to be played by the piano, and the position on the y axis decides the amplitude of the struck note. The note pitches on the x axis can be quantized to musical scales, chosen in a menu in the patch.  
