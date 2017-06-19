#!/bin/bash
# Created: Monday, June 19 2017

emacs -q -batch -l ./init.el -eval '(org-publish-project "mon")'
