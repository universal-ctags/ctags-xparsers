ctags-xparsers is an archive collecting minor external parsers for universal-ctags

For trying you have to build universal-ctags cloned from its git
repository first and understand "units" test harness of
universal-ctags.


Consider you build universal-ctags at ~/ctags-github.
Following step deploying directories and symbolic links
for runing test cases.

	$ bash prepare.sh ~/ctags-github/ctags ~/ctags-github/misc/uints

The you can run "make units", which you are familiar with.


The goal of this archive is making following command line meaningful.

    ctags -R /
