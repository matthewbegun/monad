# ssh musings on windows-10

## taken from vscode [docs](https://code.visualstudio.com/docs/remote/troubleshooting#_configuring-key-based-authentication)

```powershell
ssh-keygen -t rsa -b 4096 -C "matthew.begun@gmail.com"

$REMOTEHOST="matth@redbeard"

scp "$env:USERPROFILE\.ssh\id_rsa.pub" "${REMOTEHOST}:~/tmp.pub"
ssh "$REMOTEHOST" "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat ~/tmp.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys && rm -f ~/tmp.pub"

ssh "$REMOTEHOST"

```

### Quick start: SSH key

To set up SSH key based authentication for your remote host:

1. Check to see if you already have an SSH key on your **local** machine. The public key is typically located at `~/.ssh/id_rsa.pub` on macOS / Linux, and the `.ssh` directory in your user profile folder on Windows (for example `C:\Users\your-user\.ssh\id_rsa.pub`).

    If you do not have a key, run the following command in a **local** terminal / PowerShell to generate an SSH key pair:

    ```bash
    ssh-keygen -t rsa -b 4096
    ```

    > **Tip:** Don't have `ssh-keygen`? Install [a supported SSH client](#installing-a-supported-ssh-client).

2. Add the contents of your **local** public key (the `id_rsa.pub` file) to the appropriate `authorized_keys` file(s) on the **SSH host**.

    **macOS / Linux**: Run the following, in a **local terminal** replacing user and host name as appropriate:

    ```bash
    ssh-copy-id your-user-name-on-host@host-fqdn-or-ip-goes-here
    ```

    **Windows**: Run the following in a **local PowerShell**, replacing the value of `REMOTEHOST` as appropriate:

    ```powershell
    $REMOTEHOST="your-user-name-on-host@host-fqdn-or-ip-goes-here"

    scp "$env:USERPROFILE\.ssh\id_rsa.pub" "${REMOTEHOST}:~/tmp.pub"
    ssh "$REMOTEHOST" "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat ~/tmp.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys && rm -f ~/tmp.pub"
    ```

### Improving your security with a dedicated key

While using a single SSH key across all your SSH hosts can be convenient, if anyone gains access to your private key, they will have access to all of your hosts as well. You can prevent this by creating a separate SSH key for your development hosts. Just follow these steps:

1. Generate a separate SSH key in a different file.

    **macOS / Linux**: Run the following command in a **local terminal**:

    ```bash
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa-remote-ssh
    ```

    **Windows**: Run the following command in a **local PowerShell**:

    ```powershell
    ssh-keygen -t rsa -b 4096 -f "$env:USERPROFILE\.ssh\id_rsa-remote-ssh"
    ```

2. In VS Code, run **Remote-SSH: Open Configuration File...** in the Command Palette (`kbstyle(F1)`), select an SSH config file, and add (or modify) a host entry as follows:

    ```yaml
    Host name-of-ssh-host-here
        User your-user-name-on-host
        HostName host-fqdn-or-ip-goes-here
        IdentityFile ~/.ssh/id_rsa-remote-ssh
    ```

3. Add the contents of the **local** `id_rsa-remote-ssh.pub` file generated in step 1 to the appropriate `authorized_keys` file(s) on the **SSH host**.

    **macOS / Linux**: Run the following command in a **local terminal**, replacing `name-of-ssh-host-here` with the host name in the SSH config file from step 2:

    ```bash
    ssh-copy-id -i ~/.ssh/id_rsa-remote-ssh.pub name-of-ssh-host-here
    ```

    **Windows**: Run the following commands in a **local PowerShell**, replacing the value of `$REMOTEHOST` the host name in the SSH config file from step 2.

    ```powershell
    $REMOTEHOST="name-of-ssh-host-here"

    scp "$env:USERPROFILE\.ssh\id_rsa-remote-ssh.pub" "${REMOTEHOST}:~/tmp.pub"
    ssh "$REMOTEHOST" "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat ~/tmp.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys && rm -f ~/tmp.pub"
    ```
