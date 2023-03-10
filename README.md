# go-swagger fork for Kill Bill

Changes made to the generator code and associated templates.

We have made some templates changes that unfortunately makes it hard to maintin this code.


## Dependencies

Recent version of GO and `go-bindata` need to be installed -e.g using `brew`: `brew install go-bindata`

## Build

```
# Regenerate templates:
make bindata

# Regenerate swagger binary
make swagger

```

## Update against upstream

```
git remote add upstream git@github.com:go-swagger/go-swagger.git
git fetch upstream
git rebase -i upstream/master

# Resolve conflicts
git push -f
```

During the rebase, conflicts in `generator/bindata.go` can be ignored, as the file needs to be regenerated:

```
git reset HEAD generator/bindata.go
git checkout generator/bindata.go
git add generator/bindata.go
git commit -a
git rebase --continue
```

The `killbill_v2` branch tracks the `go-swagger` code we were using to generate the `v2` `kbcli` client (against `0.22.x`). The branch `killbill` is the current code against rhe `v3` `kbcli` client (against `0.24.x`).


## Credits

Original series of patches from https://github.com/fieryorc/go-swagger.
