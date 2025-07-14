# 📄 Changelog

All notable changes to this project will be documented in this file.

---

## v.14072025.02

### Added
- Support for a new lightweight audio player: **fmedia** (now the default).
- Uninstall script (`BG_MPlayer_Uninstall.bat`) to remove all BG_MPlayer files with confirmation.
- New options in `config.ini`:
  - `MUSIC=true/false` to enable or disable background music.
  - `PLAYER=fmedia/vlc` to choose between fmedia (lightweight) or VLC (more powerful).

### Changed
- Updated `README.md` and file structure documentation to reflect the addition of `fmedia` and new config options.

### Notes
- fmedia is recommended for most users and systems due to its speed and low resource usage.
- VLC remains supported for users needing broader file format compatibility (e.g., game music formats).
