# Windows Time Update Script

## Introduction
This script simplifies the process of updating your Windows time to your desired time zone with a single click. By default, it sets your system time to Indian Standard Time, but you can easily customize it to any time zone. Additionally, we provide one-line commands to schedule this script to run at every boot, ensuring your system always has the correct time.

## Use Cases

1. **Quick Time Zone Adjustment**:
   - Easily update your Windows time to your preferred time zone with just one click.
   - Ideal for users who frequently switch between time zones or is testing features that need time zone change.

2. **Startup Time Synchronization for 'motherboard battery dead' issue**:
   - Schedule this script to run at system startup to ensure your system always starts with the correct time.
   - Great for users who need precise time synchronization for tasks like logging, backup, or automated processes.


## Scheduling the Script

To schedule the script to run at every boot, follow these steps:

1. **Clone or Download**:
   - Clone or download the .cmd file to your Windows hard drive.

2. **Customize the Batch File with a new time zone (default: Indian Standard Time)**:
   -  To find the correct time zone information, open a Command Prompt and run:
     ```batch
     tzutil /l
     ```
    This command will list available time zones. Note the relevant time zone information (e.g., "Eastern Standard Time").
   - Open the .cmd file and edit the time zone setting. Replace "Indian Standard Time" with your preferred time zone in line 17. Save the changes.
     
4. **Run as Administrator**:
   - Right-click on the batch file and select "Run as administrator" to execute it with elevated privileges.

5. **Schedule the Script**:
   - Open Command Prompt as an administrator.
   - Use the following command to schedule the script for startup by Windows:
     ```batch
     schtasks /create /tn "RunMyScriptAtStartup" /tr "C:\Path\To\YourScript.bat" /sc onstart /ru MyUsername /rp MyPassword
     ```
     - Replace `"C:\Path\To\YourScript.bat"` with the actual path to your script.
     - Replace `"MyUsername"` and `"MyPassword"` with your windows login username and password.

6. **Complete Setup**:
   - The script will now run at every boot, ensuring your system time is always updated with the set timezone.

Feel free to reach out if you have any suggestions, or encounter any issues.
