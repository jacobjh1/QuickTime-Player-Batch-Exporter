## Functionality

This is a real simple Apple Script script that takes in a list of files and utilizes QuickTime Player's export functionality to convert those files into some other format.

## Instructions for Operation

To run this code, use the Script Editor app that comes with Mac OS to open the .applescript file. Then click the triangular play button, which will compile and run the code.

By default, the code will always export the chosen files as Audio Only .m4a files. This can be changed by changing two properties at the top of file.\
outputFormat: "Audio Only" and outputExtension: "m4a" can be changed to whatever
As far as I'm aware, outputFormat can be 4K, 1080p, 720p, and 480p, and outputExtension should be mov for all options except Audio Only (That's what the QuickTime Player UI does by default)

## Final Thoughts AKA Things That Annoyed Me As A First Time Apple Script User
### (Which Was A Lot of Things Besides Just File Extensions, Actually) 

Apparently there are lots of ways to save Apple Script files, but I've found that .applescript is the most convenient. .scpt is not human readable in just a plain text editor and .txt was not saveable in Script Editor on my Mac.Even .applescript is kind of not ideal because you have to compile it each time you open it. 

This file was written and run using AppleScript 2.8
