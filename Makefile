CWD=$(shell pwd)
BINDIR=$(HOME)/bin

all: vim git bash

vim: 
	rm -rf $(HOME)/.vimrc
	ln -s $(CWD)/.vimrc $(HOME)/.vimrc

git: 
	rm -rf $(HOME)/.gitconfig
	ln -s $(CWD)/.gitconfig $(HOME)/.gitconfig

bash:
	rm -rf $(HOME)/.bash_profile
	rm -rf $(HOME)/.bash_aliases
	rm -rf $(HOME)/.bashrc.d
	ln -s $(CWD)/.bash_aliases $(HOME)/.bash_aliases
	ln -s $(CWD)/.bash_profile $(HOME)/.bash_profile
	ln -s $(CWD)/.bashrc.d $(HOME)/.bashrc.d

.PHONY: vim git bash
