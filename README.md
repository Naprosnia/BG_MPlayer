# BG_MPlayer for ES-DE Frontend (Windows)

**BG_MPlayer** is a simple set of scripts that adds background music playback to the **Windows version of ES-DE** (https://es-de.org/).

It supports two playback engines:  
- **fmedia** – lightweight and fast (default)  
- **VLC** – heavier but more versatile

All required dependencies are included in the installation package — no separate setup needed.

This project was created and tested on **Windows 11**. Compatibility with other versions of Windows (such as Windows 10 or earlier) is **not guaranteed**.

---

## 🛠️ Installation

1. Download the latest `.zip` file from the **[Releases](../../releases)** section.
2. Extract the **contents** into the **root folder of ES-DE installation**.
3. Make sure **"Enable custom event scripts"** is enabled in the **"Other Settings"** section of the ES-DE menu.

Once installed, background music should start automatically when you launch ES-DE.

---

## 📂 File Structure

Here’s an overview of the files and folders included in the package:

- ES-DE [ root of ES-DE ]
  - ROMs
    - music
      - demo_music.mp3
  - ES-DE
    - scripts
      - game-end
        - BG_MPlayer_game-end.bat
      - game-start
        - BG_MPlayer_game-start.bat
      - quit
        - BG_MPlayer_quit.bat
      - screensaver-end
        - BG_MPlayer_screensaver-end.bat
      - screensaver-start
        - BG_MPlayer_screensaver-start.bat
      - startup
        - BG_MPlayer_startup.bat
    - BG_MPlayer
      - BG_MPlayer_Close.bat
      - BG_MPlayer_Pause.bat
      - BG_MPlayer_Resume.bat
      - BG_MPlayer_Start.bat
      - BG_MPlayer_Uninstall.bat   ← Delete all files related to BG_MPlayer  
      - config.ini         ← Configuration file with user-adjustable settings
      - Tools
        - fmedia
          - fmedia.exe     ← fmedia media player files (default and lightweight)
        - ncat
          - ncat.exe       ← Network utility used for communication with player
        - nircmd
          - nircmd.exe     ← Lightweight command-line tool for system-level actions
        - vlc
          - vlc.exe        ← VLC media player files
        - math
          - calc.exe       ← Arithmetic library for cmd and bat

All files are self-contained and work out of the box — no need for external installations.

---

## 🎵 Music Folder

Music files should be placed in: ES-DE\ROMs\music

You can place audio files directly in that folder or organize them into subfolders — the player will **shuffle and play all files** randomly.

---

## ⚙️ Configuration

All settings can be adjusted in the `config.ini` file located at: ES-DE\BG_MPlayer\config.ini

Inside that file, you can:

- Enable or disable background music playback
- Set the background music **volume**
- Choose the **audio player** (`fmedia` or `vlc`)
- Configure **fade in/out effects**
- Enable playback **during gameplay**
- Control music behavior **during screensaver**:
- Tweak other small options to better suit your preferences

Each option is explained with comments directly in the file.

---

## ⚠️ Performance Notice

Running ES-DE and BG_MPlayer from an external drive (e.g. USB) may result in significant delays, especially during VLC startup.
For optimal performance, it's recommended to install and run from a local/internal drive — or use the fmedia player, which should work fine even on slower systems.

---

## ❗ Disclaimer

This project is **not actively maintained**. It was developed for **my personal use**, and I'm sharing it in case others find it useful too.

Feel free to use or adapt it as you like — no guarantees or official support are provided.

---

## 💬 Contact

You can find me on the official **ES-DE Frontend** Discord:  
🔗 https://discord.gg/stRVK9gMuE

---

## 📄 License

This project is licensed under the **GNU General Public License v3.0**.  
See the [LICENSE](LICENSE) file for details.

---

## 🍺 Support

If you find this project useful and would like to support my work, consider offering me a beer:  

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.me/naprosnia)
