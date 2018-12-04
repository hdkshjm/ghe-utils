# Knowledge for GitHub Enterprise

## github-env
Switch git user, read the some production env of git user and execute command

* full path: /usr/local/bin/github-env
* sample
  ```
  $ id
  uid=501(admin) gid=501(admin) groups=501(admin),4(adm)
  $ github-env id
  uid=500(git) gid=500(git) groups=500(git)
  ```

## /data/github/current/bin/runner
This is the rails runnner.  
You can run ruby code on rails.
If you use this command, you should use this with github-env command.

* sample
  ```
  $ github-env bin/runner /home/admin/blobs.rb
  ```

