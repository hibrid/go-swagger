# go-swagger fork for Kill Bill

Changes made to the generator code and associated templates.

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
# brew install go-bindata
go generate ./generator
git add generator/bindata.go
git commit -a
git rebase --continue
```

## Credits

Original series of patches from https://github.com/fieryorc/go-swagger.
