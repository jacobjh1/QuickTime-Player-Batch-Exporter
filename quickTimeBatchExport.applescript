property outputFormat : "Audio Only"
property outputExtension : "m4a"
property chooseInFilesPrompt : "Select all files (must be compatible with Quick Time Player) to export"
property chooseOutDirPrompt : "Select the output directory for generated files"
property desktopDir : path to desktop

(**
 * Given a file, replace its extension with the specified extension
 * If the file has no extension, then merely append the specified extension
 *
 * @param absoluteFile		alias file (or alias as text also works), POSIX file won't work
 * @param newExtension	string with the file extension to use in the replacement (has no .)
 *
 * @return new, relative file path string 
 *)
on replaceFileExtension(absoluteFile, newExtension)
	set oldDelimiters to AppleScript's text item delimiters
	
	set AppleScript's text item delimiters to {":"}
	set relativeFileName to last text item of (absoluteFile as text)
	
	set AppleScript's text item delimiters to {"."}
	set filePartsList to text items of relativeFileName
	
	if length of filePartsList = 1 then
		copy "ext" to the end of filePartsList
	end if
	
	set last item of filePartsList to newExtension
	set newFileName to filePartsList as text
	
	set AppleScript's text item delimiters to oldDelimiters
	return newFileName
end replaceFileExtension

(**
 * Given a list of audio or movie files, use Quick Time Player to export
 * them to another format
 *
 * @param fileList			list of alias type files to export, only ever tested with .wav files, but theoretically 
 * 						works with anything compatible with Quick Time Player
 * @param outDir			string of output directory path to place generated files in
 * @param outFormat		string argument to pass to export method, "Audio Only" is the only value I've 
 *						ever used, but presumably 4K, 1080p, 720p, and 480p are also valid
 * @param outExtension	string file extension to use for generated files
 *)
on exportWithQuickTimePlayer(inFiles, outDir, outFormat, outExtension)
	tell application "QuickTime Player"
		repeat with inFile in inFiles
			set openInFile to open inFile
			set outFile to outDir & my replaceFileExtension(inFile, outExtension)
			tell openInFile to export in (POSIX file outFile) using settings preset outFormat
			delay 0.25
			tell windows to close
		end repeat
	end tell
end exportWithQuickTimePlayer

try
	set chosenFiles to choose file with prompt chooseInFilesPrompt default location desktopDir with multiple selections allowed
	
	set chosenDir to POSIX path of (choose folder with prompt chooseOutDirPrompt default location desktopDir)
	
	exportWithQuickTimePlayer(chosenFiles, chosenDir, outputFormat, outputExtension)
end try