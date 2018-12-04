# ghe-tuils

==================

utilities for GitHub Enterprise

## listup_repository_size.sh
Display the top 1000 big size of repositories.

display format
```
size(human readable) update_date repository_full_path original_repository_full_path(forked_from_this if repo is forked repo) org_name/repo_name
```

### sample
```
$ bash listup_repository_size.sh
20G    2018-09-06 21:39    /data/user/repositories/f/nw/f0/8c/64/15547/24467.git /data/user/repositories/f/nw/f0/8c/64/15547/24467.git AAA/xx deleted
17G    2018-12-03 16:12    /data/user/repositories/8/nw/81/10/ea/13332/20387.git /data/user/repositories/8/nw/81/10/ea/13332/20387.git BBB/yy
8.6G    2018-12-03 16:07    /data/user/repositories/3/nw/38/84/06/10885/16108.git /data/user/repositories/3/nw/38/84/06/10885/16108.git AAA/zz
```
