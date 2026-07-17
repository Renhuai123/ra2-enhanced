# Language / strings

We do **not** ship binary `.csf` string files (often treated as game assets / hard to review).

For Chinese UI strings:

1. Prefer Phobos / Ares text override mechanisms documented upstream, or
2. Maintain a plaintext string table in a future PR and generate `.csf` locally in your game folder (gitignored).

Placeholder display name for docs / clients: **RA2 Enhanced / 红警2增强**.
