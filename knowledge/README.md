# Knowledge for GitHub Enterprise

## Admin Web Console
### LFS
If click "Delete" button on the LFS section of below LFS url, GitHub Enterprise sets the logical deletion flag of below LFS url.  
`https://<github-enterprise-host>/stafftools/repositories/<org-name>/<repo-name>/large_files?oid=<oid>`

Within 3 months, can restore the deleted LFS file.
3 months later, GitHub Enterprise will remove the file from the local disk.

## API
### LFS API
There is no such API at 2018-12-01.

## CLI

### github-env
Switch git user, read the some production env of git user and execute the command

* full path: /usr/local/bin/github-env
* sample
  ```
  $ id
  uid=501(admin) gid=501(admin) groups=501(admin),4(adm)
  $ github-env id
  uid=500(git) gid=500(git) groups=500(git)
  ```

### /data/github/current/bin/runner
This is the rails runnner.  
You can run ruby code on rails.    
If you use this command, you should use this with github-env command.

* sample
  ```
  $ github-env bin/runner /home/admin/blobs.rb
  ```

