# Resume Maker

A utility to convert Markdown resumes into styled HTML and print-ready PDF documents using `markdown_py` and `weasyprint`.

## Project Structure

*   `src/`: Contains source files (e.g., `<filename>.md`, `head.txt`, `tail.txt`).
*   `build/`: Contains the build script `markdowntopdf.sh`.
*   `output/`: Contains the generated HTML and PDF files.
*   `tmp/`: Used for temporary compilation files.

---

## Installation

This setup is optimized for macOS using **MacPorts** and **pipx**.

### 1. Install System Dependencies
WeasyPrint requires native libraries (Cairo, Pango, and GObject) for PDF rendering. Install them via MacPorts:
```bash
sudo port install cairo pango gdk-pixbuf2 libffi
```

### 2. Install CLI Tools
Install `weasyprint` and the python `markdown` package (which provides the `markdown_py` script) in isolated global environments using `pipx`:
```bash
pipx install weasyprint
pipx install markdown
```

### 3. Configure Library Search Path (Required for MacPorts)
Since MacPorts places shared libraries in `/opt/local/lib`, you must tell Python where to find them. Add the following line to your shell profile (e.g., `~/.zshrc`):
```bash
export DYLD_FALLBACK_LIBRARY_PATH="/opt/local/lib:$DYLD_FALLBACK_LIBRARY_PATH"
```
*Reload your shell or run `source ~/.zshrc` after adding this.*

---

## Usage

1.  Place your source Markdown file inside the `src/` directory (e.g., `src/arielchuri_resume.md`).
2.  Navigate to the project root directory:
    ```bash
    cd ~/Documents/work/resumemaker
    ```
3.  Ensure the build script is executable:
    ```bash
    chmod +x build/markdowntopdf.sh
    ```
4.  Run the script, passing the **basename** of the markdown file (without the `.md` extension) as the argument:
    ```bash
    ./build/markdowntopdf.sh arielchuri_resume
    ```

The script will compile the Markdown, combine it with the HTML templates in `src/head.txt` and `src/tail.txt`, and output:
*   `output/arielchuri_resume.html`
*   `output/arielchuri_resume.pdf`
