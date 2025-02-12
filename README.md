# Scripts
Scripts running on the backend server

## rename-files -FOLDER
- Scripts in this folder rename files in a designated folder. The script adds a specified prefix to all files of the folder.

## schedulers -FOLDER
- Scripts in this folder run scheduled tasks

### monitor-daylight -FOLDER
- Scripts in this folder are related to monitoring daylight status. Based on a daylight status, another specified script is evoked (e.g. script that scrapes images/video clips from a live stream feed)

- `daylight_monitor.sh` Monitors the daylight status, runs periodically as a cronjob. If daylight is true or false, invokes or stops another script respectively (echo_camera.sh, for now). 
- `echo_camera.sh`  Invoked by daylight_monitor.sh. Should be replaced with a script that scrapes images/video clips from a live stream feed
	
## scrape-imgs-from-video -FOLDER
- Sripts in this folder scrape image files from a youtube livestream. 
