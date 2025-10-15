# 🧩 Solution: GitHub SSH blocked on port 22 (use 443)

Some networks (like universities, offices, or public Wi-Fi) block **port 22**, which is the default port SSH uses to connect to GitHub.  
This problem prevents `git push`, `git pull`, or `git clone` via SSH.

This guide shows you how to solve it **using port 443**, which is almost always open.

---

## 🚀 Configure SSH to use port 443

Open PowerShell and run:

```powershell
notepad $env:USERPROFILE\.ssh\config

If the file doesn't exist, it will be created.
Then, paste this:

Host github.com
    Hostname ssh.github.com
    Port 443
    User git

Run the port443.ps1 script in the directory where you have all your GitHub repositories so they use port 443 instead of 22 using this command:

./port443.ps1

Finally, go to any repository path and run:

git remote -v

You should see something like this showing the port it will use from now on:

origin  ssh://git@ssh.github.com:443/username/repository.git (fetch)
origin  ssh://git@ssh.github.com:443/username/repository.git (push)

💡 Credits

Guide created by Ariels875 to help those with networks that block port 22.