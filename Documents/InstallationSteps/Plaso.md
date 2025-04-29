## Install Plaso on Windows


Um **Plaso** (Plaso Langar Asa Security Orchestrator), ein forensisches Open-Source-Tool zur Zeitanalyse von digitalen Beweismitteln, auf einem **Windows-System** zu installieren, kannst du folgende Schritte ausführen:

### 1. Voraussetzungen prüfen

Stelle sicher, dass du die folgenden Voraussetzungen erfüllst:

- **Python 3.x** (idealerweise 3.7 oder höher)
- **pip** (Python Paket-Manager)

### 2. Python und pip installieren

Falls du Python noch nicht installiert hast, kannst du es von [python.org](https://www.python.org/downloads/) herunterladen. Achte darauf, dass du die Option „Add Python to PATH“ während der Installation auswählst.

Um sicherzustellen, dass **pip** bereits installiert ist, öffne die Eingabeaufforderung und führe folgenden Befehl aus:

```bash
python -m ensurepip --upgrade
```

### 3. Visual C++ Build Tools installieren

Plaso benötigt zum Kompilieren einiger Abhängigkeiten die Visual C++ Build Tools. Diese kannst du von der Microsoft-Website herunterladen:

- [Microsoft Visual C++ Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/)

Installiere diese Tools, falls noch nicht vorhanden.

### 4. Installation von Plaso

Plaso wird über **Python-Pip** installiert. Öffne die Eingabeaufforderung (CMD) und führe folgende Befehle aus:


1. Zuerst das **Plaso-Repository** klonen oder Plaso direkt von pip installieren:
    
    ```bash
    pip install plaso
    ```
    
2. Alternativ kannst du das **Plaso-Repository** von GitHub klonen, um eine neuere oder benutzerdefinierte Version zu erhalten:
    
    - Installiere Git, falls du es noch nicht installiert hast: [Git herunterladen](https://git-scm.com/download/win)
        
    - Klone das Repository:
        
        ```bash
        git clone https://github.com/log2timeline/plaso.git
        cd plaso
        ```
        
    - Installiere alle benötigten Abhängigkeiten:
        
        ```bash
        pip install -r requirements.txt
        ```
        
    - Installiere Plaso:
        
        ```bash
        python setup.py install
        ```
        

### 5. Überprüfen der Installation

Nachdem die Installation abgeschlossen ist, kannst du Plaso testen, indem du in der Eingabeaufforderung den Befehl eingibst:

```bash
log2timeline.py --help
```

Wenn du die Hilfeinformationen siehst, wurde Plaso erfolgreich installiert.

### 6. Zusätzliche Schritte (optional)

Falls du Probleme mit bestimmten Abhängigkeiten oder Tools hast, könnte es notwendig sein, zusätzliche Bibliotheken oder Tools zu installieren, die in der Dokumentation von Plaso beschrieben sind.

---

Das war's! Du solltest nun in der Lage sein, Plaso auf deinem Windows-System zu nutzen. Wenn du auf spezifische Probleme stößt, lass es mich wissen!

Note: Zu Path Var hinzufügen: `C:\Users\N0\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.13_qbz5n2kfra8p0\LocalCache\local-packages\Python313\Scripts\`


----

### Alternative

Installing **Plaso** on Windows without using WSL is tricky because it is primarily designed for Linux and macOS. However, you can install it using **pip** with some workarounds.

### **Steps to Install Plaso on Windows (Without WSL)**

1. **Install Python (64-bit)**
    
    - Download and install Python **3.9** (Plaso has compatibility issues with newer versions).
    - [Download Python 3.9](https://www.python.org/downloads/release/python-390/)
    - During installation, check the box **"Add Python to PATH"**.
2. **Install Dependencies**
    
    - Open **Command Prompt (cmd) as Administrator** and run:
        ```sh
        pip install -U pip setuptools wheel
        ```
    - Install additional dependencies:
        ```sh
        pip install six pytz dfvfs psutil
        ```
3. **Install Plaso (l2tbinaries)**
    
    - Plaso is not directly available via **pip install plaso**, but you can install the **l2tbinaries** version:
        ```sh
        pip install l2tdevtools
        pip install l2tbinaries
        ```
4. **Manually Set the PATH**
    
    - Find where Plaso is installed by running:
        ```sh
        python -c "import sys; print(sys.path)"
        ```
    - Copy the directory path containing Plaso binaries (like `C:\Users\YourUser\AppData\Local\Programs\Python\Python39\Scripts`).   
    - Add it to your **System PATH**:
        1. Search for **"Environment Variables"** in Windows.
        2. Under **System Variables**, find `Path`, click **Edit**.
        3. Click **New**, paste the copied path, and save.
5. **Verify Installation**
    - Restart Command Prompt and check:
        ```sh
        log2timeline.py --version
        ```
    If everything is correct, Plaso should now be installed.

### **Troubleshooting**

- If `log2timeline.py` is not found, check your `PATH` settings.
    
- If dependencies fail, try installing them individually:
    
    ```sh
    pip install construct
    pip install dateutil
    pip install dfvfs
    ```
    
- If installation fails due to missing **Microsoft Visual C++ Build Tools**, install them from: [https://visualstudio.microsoft.com/visual-cpp-build-tools/](https://visualstudio.microsoft.com/visual-cpp-build-tools/)
    

Let me know if you run into issues! 🚀


---

