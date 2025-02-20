# Scripts
Central repository for scripts running on the backend server. Most have been implemented and require no further action. 

## 1. rename-files -FOLDER
- Scripts in this folder rename files in a designated folder. The script adds a specified prefix to all files of the folder. Change filenames / paths according to your environment.
- `rename_hastrains.sh`
- `rename_notrains.sh`

## 2. handle_old_files -FOLDER
- Scripts in this folder either delete or archive (as .zip) files from specified folders if they're determined to be `x` amount of days old. They can be used to e.g., archive older image and videoclip files generated by the AI inference scripts.

- `archive_old_files.sh`
- `delete_old_files.sh`

## 3. schedulers -FOLDER
- Scripts in this folder run scheduled tasks.

### monitor-daylight -FOLDER
- These have already been implemented with the AI component (see "ai-security-camera-object-detection" repository). 
- Scripts in this folder are related to monitoring daylight status. Based on a daylight status, another a specified AI inference script is triggered.

- `daylight_monitor.sh`
	- Monitors the daylight status, runs periodically as a cronjob. If daylight is true or false, invokes or stops another script respectively (echo_camera.sh, for now).
 	- Should still be scheduled with a cronjob (see the .sh file for instructions in the comments).
- `test_trigger.sh`
	- Can be used to manually set the TRUE/FALSE value to start/stop the inference scripts manually.
	- Included for testing purposes. 
	
## 4. scrape-imgs-from-video -FOLDER
- Sripts in this folder scrape image files from a youtube livestream. This script has been used to gather training data for the AI model in one of the AI versions.
  
- `video-capture-retriever.sh`
