# 🚀 Immich-Slimmer

A lightweight, automated tool designed to "slim down" your Immich library. It identifies large photos and resizes them to save massive amounts of disk space without losing essential quality or metadata.

---

## ✨ Features

- **Automated Resizing**: Downscales heavy images to your preferred dimensions (e.g., 1920px).
- **Smart Threshold**: Set a `MIN_SIZE` (e.g., 2M) so you only process the files that actually matter.
- **Auto-Refresh**: Automatically tells Immich to re-scan the library so the new file sizes show up in the App and Web UI immediately.
- **Metadata Integrity**: Uses ImageMagick to ensure all EXIF data (Date, GPS, Camera info) remains intact.
- **Lightweight**: Based on Alpine Linux, keeping the footprint under 50MB.
- 
## ✅ Compatibility

This tool has been specifically tested and verified with **Immich version 2.7.4**.

## ⚙️ Configuration (Environment Variables)

| Variable | Description | Default |
| :--- | :--- | :--- |
| `IMMICH_URL` | Internal or external URL of your Immich server | `http://immich_server:2283` |
| `IMMICH_API_KEY` | API Key generated in Immich User Settings | **Required** |
| `QUALITY` | JPEG compression level (1-100) | `80` |
| `MAX_WIDTH` | Maximum width for the long edge | `1920` |
| `MAX_HEIGHT` | Maximum height for the long edge | `1920` |
| `MIN_SIZE` | Minimum size to trigger processing (e.g., 2M, 5M) | `2M` |

## 🚀 Quick Start

1. **Clone the repository**:
   ```bash
   git clone https://github.com/djbel63/immich-slimmer.git
   cd immich-slimmer
   ```

2. **Configure your Docker Compose**:
   Update the \`volumes\` section to point to your Immich **upload** directory and paste your **API Key**.

3. **Run the optimizer**:
   ```bash
   docker compose up -d --build
   ```

## ⚠️ Important Notes

- **Destructive Operation**: This tool modifies original files within your \`/upload\` directory. Always ensure you have a recent backup before running it for the first time.
- **API Key**: Ensure the API Key has sufficient permissions to trigger "Metadata Extraction" jobs.

---
Developed with ❤️ by [djbel63](https://github.com/djbel63)
