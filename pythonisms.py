# ipython

# magics
# %xmode - Switch modes for the exception handlers. Valid modes: Plain, Context, Verbose, and Minimal.
%xmode Minimal

# pathlib
# ref https://docs.python.org/3/library/pathlib.html

# objectg for manipulating paths is `Path`
from pathlib import Path

# create Path object with current workding directory
p = Path('.')

# list subdirectories
# [x for x in p.iterdir() if x.is_dir()]
l = [x for x in p.iterdir() if x.is_dir()]
print(l)

# Listing Python source files in this directory tree:
list(p.glob('./testes/**/*.py'))

# constructing objects for directories and files
# note for windows - "Documents" == "documents"
# have to expand "~" for anything to work properly!
p = Path("~")
q = p / 'documents' / 'powershell'
f = q / "Microsoft.PowerShell_profile.ps1"

print(p)
# ~
print(p.expanduser())
# C:\Users\z3391967
print(q)
# ~\documents\powershell
print(q.expanduser())
# C:\Users\z3391967\documents\powershell
print(q.expanduser().resolve())
# C:\Users\z3391967\Documents\WindowsPowerShell
print(f)
# ~\documents\powershell\Microsoft.PowerShell_profile.ps1
print(f.expanduser())
# C:\Users\z3391967\documents\powershell\Microsoft.PowerShell_profile.ps1
print(f.expanduser().resolve())
# C:\Users\z3391967\_src\github.com\matthewbegun\scripts\Microsoft.PowerShell_profile.ps1

# global methods of usefulness
Path.cwd() # .
Path.home() # ~

# globbing
sorted(Path('./testes').glob('*.py'))
# []
sorted(Path('./testes').glob('*/*.py'))
# [WindowsPath('testes/sourcery/testes.py')]
sorted(Path('.').glob('**/*.py'))
# many many  ... lots

# iterdir
p = Path("testes")
# p.absolute()
for child in p.iterdir(): child

