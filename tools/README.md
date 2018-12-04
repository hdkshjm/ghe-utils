# Utilities for GitHub Enterprise

## listup_repository_size.sh
Output the top 1000 big size of repositories.

## output file
* name: `tools/logs/repository_size.log`
* log format:
  ```
  size(human readable) update_date repository_full_path original_repository_full_path(forked from this if repo is forked repo) org_name/repo_name deleted
  ```

### sample
```
$ bash listup_repository_size.sh
$ cat logs/repository_size.log
20G    2018-09-06 21:39    /data/user/repositories/f/nw/f0/8c/64/15547/24467.git /data/user/repositories/f/nw/f0/8c/64/15547/24467.git AAA/xx deleted
17G    2018-12-03 16:12    /data/user/repositories/8/nw/81/10/ea/13332/20387.git /data/user/repositories/8/nw/81/10/ea/13332/20387.git BBB/yy
8.6G    2018-12-03 16:07    /data/user/repositories/3/nw/38/84/06/10885/16108.git /data/user/repositories/3/nw/38/84/06/10885/16108.git AAA/zz
```

## listup_object_size.sh, blobs.rb, yaml_to_tsv.rb
Output the top 1000 big size of objects(1 commit file of LFS or GitHub Release) 

* listup_object_size.sh: main script which calls below
  * blobs.rb: get object info from GHE Rails and output it to `tools/logs/object_size.yml`
  * yaml_to_tsv.rb: convet yaml as `tools/logs/object_size.yml` to tsv as `tools/logs/object_size.tsv`

### sample
```
$ bash listup_object_size.sh
$ head -n 5 logs/object_size.yml
---
- oid: c850ff92fba4891af8b261e2b0a7434a3cdb56bb396d91e31de972469a6e2ebd
  size: 1986506680
  refs:
  - Git LFS object in org-name/repo-name (public)
$ head -n 2 object_size.tsv
c850ff92fba4891af8b261e2b0a7434a3cdb56bb396d91e31de972469a6e2ebd	1986506680	Git LFS object in org-name/repo-name (public)
a6df8b81ffb1f360e58fda83b1eab5b2ee5e3ffdafe385a614287f33eb49904b	1526663471	Git LFS object in org-name/repo-name (public) 
```

You can see detail info on https://[hostname]/stafftools/storage/blobs/[oid] .

