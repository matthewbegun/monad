
- recursively change owner to `Administrators` group

        takeown /a /r /d Y /f w:\*

- recursively grant full permissions to `Administrators` group

        icacls W:\* /grant administrators:F /t
