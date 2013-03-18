# Robin MoCap Demonstration Material 2013

All of the following patches has been created in Max/Msp. 
Max/Msp Runtime 6.0 or higher is required for running some of the patches. 
This can be downloaded [here](http://cycling74.com/downloads/runtime/).
Some *external-objects* are included in the project folders, such as *OSC-route*, *eM_genverb* & *jit.freenect.grab*. 
If you are experiencing trouble you might want to look at Max/Msp’s [search path](http://cycling74.com/docs/max5/vignettes/core/search_path.html). Some image & 3D model files are also included.

The material currently focus on two types of motion capture hardware, reflected in the subfolders on the top of the folder hierarchy:  

* iPod Demopatches
* Kinect Piano 2.0 

##  iPod Demopatches
These are patches for demonstrating motion capture using iPhone or iPod devices. 
All patches rely on the motion data provided by the *Epics HyperMusic* iOS app. It is important that the device and the computer running the patches are on the same network, and that the correct IP address of the computer is set in the app’s settings. The patches can run by themselves, or be included in another patch as *bpatchers*.
To create a bpatcher object in a Max patch, you can in edit mode press `n`, followed by typing in `bpatcher *name of patcher*`, e.g. `bpatcher deviceInput`. You might have to resize the resulting window in order to view the whole interface of the new patch. 

The folder inlcudes these subfolders:

* Dependencies
* iPod 3D Avatar Control
* iPod 3D Orientation Visualizer
* iPod MoCap Recording & Playback
* iPod MoCap Tools
* iPod Simplesynth
* iPod SoundSaber & LoopPlayer

### Dependencies 
This folder includes external objects necessary for running the patches.  Currenctly containing CNMAT’s Osc-route. 

### iPod 3D Avatar Control
The iPod 3D Avatar Control patch uses the quaternion rotation data from the *HyperMusic* app to control the behaviour of the 3D model *blocky.dae*. 
**Note:** Behaviour at this time not satisfactory. Should give a clearer reference to the motion input. 

### iPod 3D Orientation Visualizer
The iPod 3D Orientation Visualizer patch uses the rotational orientation of the device to control the 3D model *Iphone-4.obj*. This should provide a close representation of the orientation of the physical device if calibrated correctly. Keep the device flat and pointing towards the screen projecting the visualization when opening the *HyperMusic* app. 

### iPod MoCap Recording & Playback

The iPod-Mocap-Recorder patch can receive MoCap data through the left input and record this data. The data will be stored in a textfile inside the folder containing the patcher. By inserting an identifying name in the *subject name* textbox  and pressing enter, the recordings will be easily to gathered for use in further work. It is possible to record several tests with the same identifying name. 

The iPod-Mocap-Playback patch will be able to read and play back the MoCap data recorded by the *iPodMocapRecorder* patcher. **Note:** Data output will not display correctly. Payback rate, or parsing?

### iPod MoCap Tools

![iPod-Input](https://www.dropbox.com/lightbox/home/Kode/Max/Even-max-patches/Robin%20Demonstrasjonmateriale%202013/screenshots?select=iPod-DataVisualizer.png)

The iPod-Input patch simply connects to the *HyperMusic* app with the correct host port provided. The data can be streamed through the patch's left outlet. It is also possible to print the whole input stream to the *Max window*.

The iPod-DataVisualizer patch can perform a simple running graph visualization of the incoming data in the separate X, Y & Z axes. At this time, “Acceleration”, “Rotation” & “Gravity” data is available to display. 

### iPod Simplesynth
The iPod Simplesynth patch is a simple sonification of the MoCap data provided by the *HyperMusic* app.  
Make sure the *Fireface12* audio interface is chosen in the Max *Options/Audio status..* menu. Check also that there are five audiocables connected between outputs 1-5 on the interface & four Yamaha speakers + one subwoofer (Speakers 1-4: Output 1-4. Subwoofer: Output 5). The speakers should be placed in a square; front, back, left & right. 

The sound is controlled by the mocap data streamed from the iPod: 

* iPod pitch controls audio pitch frequency
* iPod jaw controls audio 
* iPod bend 

## Kinect Piano 2.0


