# BG_MPlayer for ES-DE Frontend (Windows)

**BG_MPlayer** is a simple set of scripts that adds background music playback to the **Windows version of ES-DE** (https://es-de.org/).

It uses **VLC** to play music, and **all required dependencies are included** in the installation package — no separate setup needed.

---

## 🛠️ Installation

1. Download the latest `.zip` file from the **[Releases](../../releases)** section.
2. Extract the contents into the **root folder of ES-DE**.
3. Make sure **"Custom Scripts"** are enabled in the ES-DE settings.

Once installed, background music should start automatically when you launch ES-DE.

---

## 📂 File Structure

Here’s an overview of the files and folders included in the package:

- ES-DE [root of ES-DE ]
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
      - startup
        - BG_MPlayer_startup.bat
    - BG_MPlayer
      - BG_MPlayer_Close.bat
      - BG_MPlayer_Pause.bat
      - BG_MPlayer_Resume.bat
      - BG_MPlayer_Start.bat
      - config.ini              ← Configuration file with user-adjustable settings
      - Tools
        - vlc
          - vlc.exe        ← VLC media player files
        - ncat
          - ncat.exe       ← Network utility used for communication with player
        - nircmd
          - nircmd.exe     ← Lightweight command-line tool for system-level actions

All files are self-contained and work out of the box — no need for external installations.

---

## 🎵 Music Folder

Music files should be placed in:

ES-DE\ROMs\music

You can place audio files directly in that folder or organize them into subfolders — the player will **shuffle and play all files** randomly.

---

## ⚙️ Configuration

All settings can be adjusted in the `config.ini` file located at:

ES-DE\BG_MPlayer\config.ini

Inside that file, you can:

- Set the background music **volume**
- Configure **fade in/out effects**
- Enable playback **during gameplay**
- Tweak other small options to better suit your preferences

Each option is explained with comments directly in the file.

---

## ❗ Disclaimer

This project is **not actively maintained**. It was developed for **my personal use**, and I'm sharing it in case others find it useful too.

Feel free to use or adapt it as you like — no guarantees or official support are provided.

---

## 💬 Contact

You can find me on the **ES-DE Frontend Discord**:  
🔗 https://discord.gg/stRVK9gMuE

---

## 📄 License

This project is licensed under the **GNU General Public License v3.0**.  
See the [LICENSE](LICENSE) file for details.
