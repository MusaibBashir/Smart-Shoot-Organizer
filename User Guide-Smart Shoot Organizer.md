# **Smart Shoot Organizer \- User Guide**

This tool was originally made to reduce post-shoot workload in Inter IIT Photography and SFM. Hope this helps you as well in your shoots.

## **Installation**

### **Windows Users**

1. Click here to download: [https://github.com/MusaibBashir/Smart-Shoot-Organizer/releases/download/v2.0.0/Smart.Shoot.Organizer.exe](https://github.com/MusaibBashir/Smart-Shoot-Organizer/releases/download/v2.0.0/Smart.Shoot.Organizer.exe)  
2. If the above link isn’t working: [Release v2.0.1-Windows(x64) · MusaibBashir/Smart-Shoot-Organizer](https://github.com/MusaibBashir/Smart-Shoot-Organizer/releases/tag/v2.0.0)  
3. Move the file to a convenient location (e.g., your Desktop or a specific tools folder).  
4. **Double-click** to run.  
   * *Note: If Windows Defender or your antivirus warns you about an "Unrecognized App", click **More Info** \> **Run Anyway**. This happens because the app is not digitally signed with a costly certificate.*  
5. Drag the app to taskbar for easy access.

### **macOS Users**

1. Click here to download: [https://github.com/MusaibBashir/Smart-Shoot-Organizer/releases/download/v2.0.1Mac/SmartShootOrganizer-Mac.zip](https://github.com/MusaibBashir/Smart-Shoot-Organizer/releases/download/v2.0.1Mac/SmartShootOrganizer-Mac.zip)  
2. If the above link isn’t working: [Release v2.0.1 Mac · MusaibBashir/Smart-Shoot-Organizer](https://github.com/MusaibBashir/Smart-Shoot-Organizer/releases/tag/v2.0.1Mac)  
3. **Double-click** the zip file to extract it. You will see the **SmartShootOrganizer** application icon.  
4. Drag the app into your **Applications** folder.  
5. **Important (First Run Only):**  
   * Because this app is not from the App Store, you cannot just double-click it the first time.  
   * **Right-click** (or Control-click) the app icon and select **Open**.  
   * A dialog will appear warning you about an unidentified developer. (*You only need to do this once.)*  
   * Open Terminal and paste the following command (drag the app into the terminal to get the path):  
     	**xattr \-cr /Applications/SmartShootOrganizer.app**  
     *(This completely removes the "Quarantine" restriction, making the app open instantly).*

### **Prerequisites**

* **VLC Media Player (Recommended):** For the best video playback experience, please ensure [VLC Media Player](https://www.videolan.org/) is installed on your system. The app will automatically detect it.

## 

## **How to Use**

### **Tab 1: Visual Sorter**

*Best for: Choosing good and bad photos/videos after shoot*

1. **Configuration:**  
   * Click **Select Source** to pick the folder containing your photos/videos.  
   * (Optional) Click **Select Destination** if you want the sorted folders to be created somewhere else.  
2. **Review:**  
   * Use **Arrow Keys** or on-screen buttons to browse.  
   * **Zoom:** Use your mouse scroll wheel to zoom in/out. Click and drag to pan around.  
3. **Labeling:**  
   * **Green (1):** Keepers.  
   * **Yellow (2):** Maybe / Review Later.  
   * **Delete/Red (3):** **PERMANENTLY DELETE**.  
4. **Action:**  
   * Choose whether to **Move** or **Copy** the Green/Yellow files.  
   * Click **SORT NOW** to process the folder. All Red files will be deleted, and Green/Yellow files will be organized into subfolders.

### **Tab 2: Smart Renamer**

*Best for: Grouping media by scene and renaming them chronologically.*

1. **Load Media:** Select your source folder.  
2. **Assign Groups:**  
   * Browse through your media.  
   * Assign them to **Group 1** through **Group 5** based on the scene (e.g., Group 1 \= "Ceremony", Group 2 \= "Reception").  
   * **Shortcuts:** Press Ctrl+1 (Windows) or Cmd+1 (Mac) to quickly assign the current photo to Group 1, etc.  
3. **Process:**  
   * Click **PROCESS GROUPS**.  
   * Select which group you want to rename (e.g., Group 1).  
   * **Scene Name:** Enter a name (e.g., "Wedding\_Ceremony").  
   * **Camera Name:** (Optional) Enter a camera identifier (e.g., "Fx30"). If left blank, the app will try to read the Camera Model from the metadata.  
   * **Action:** Choose to Rename in place, Move, or Copy to a new folder.  
   * **Result:** Files will be renamed as SceneName\_001\_CameraName.mov, SceneName\_002\_..., sorted by the time they were taken.

### **Tab 3: Sequence Sorter**

*Best for: When you have chosen photos/videos already and have shorthand numbers of files.*

1. **Select Source:** Browse to the folder containing your files.  
2. **Input Sequence:** Paste your shorthand notes.  
   * *Example:* 1210, 1, 5, 27, 64, 346, 2130  
   * *Interpretation:* The app reads this as 1210, 1211, 1215, 1227, 1264, 1346, 2130\.  
3. **Settings:** Enter the **Prefix** (e.g., IMG\_,RAN, DSC0,..) and **Extensions** (.JPG/.CR2/.ARW/.MOV/…) to match your camera's files.  
4. **Process:** Click the button to batch Copy/Move just those specific files to a new folder.

## 

## **Keyboard Shortcuts**

| Action | Windows | Mac |
| :---- | :---- | :---- |
| **Previous Image** | Left Arrow | Left Arrow |
| **Next Image** | Right Arrow | Right Arrow |
| **Open File (Ext. Player)** | P | P |
| **Rename File** | R | R |
| **Mark Green / Group 1** | Ctrl \+ 1 | Cmd \+ 1 |
| **Mark Yellow / Group 2** | Ctrl \+ 2 | Cmd \+ 2 |
| **Mark Red / Group 3** | Ctrl \+ 3 | Cmd \+ 3 |
| **Group 4** | Ctrl \+ 4 | Cmd \+ 4 |
| **Group 5** | Ctrl \+ 5 | Cmd \+ 5 |
| **Zoom** | Scroll Wheel | Scroll Wheel |

www.tfps.site