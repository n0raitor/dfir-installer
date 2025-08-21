# Plaso


## 1. Install Python
```bash
python -m ensurepip --upgrade
```

## 2. Run the Build Tools installer (Visual Studio Installer) with the Plaso config in your Documents root folder

## 3. Run x64 Native Tools Command Prompt for VS 2022 and run
```powershell
SET DISTUTILS_USE_SDK=1
SET MSSdk=1
python -m ensurepip --upgrade
pip install -U pip setuptools wheel
pip install plaso
```

## 4. Add to env var
`C:\Users\N0\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.13_qbz5n2kfra8p0\LocalCache\local-packages\Python313\Scripts`