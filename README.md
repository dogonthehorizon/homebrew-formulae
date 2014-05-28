#homebrew-formulae
A humble collection of formulas for this and that.

##Getting Started
```
brew tap dogonthehorizon/formulae
```

##tdsql
Pretty straightforward.

```
brew install tdsql
brew link --force readline
sudo cpanm Term::ReadLine::Gnu
brew unlink readline
```

This formula also installs man pages, so for usage information on `tdsql` you can either go to their repo [here](https://github.com/groupon/tdsql) or `man tdsql`.
