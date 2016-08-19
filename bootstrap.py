#!/usr/bin/python
# --------------- #
# bootstrap.py
# Current only works on macOS, but may add others in the future

# Script to create my dotfiles.
# --------------- #
__author__ = 'Jeffrey Stone <thejeffreystone@gmail.com>'

# Global
dotFiles = '/lib/dotfiles/'
confFiles = '/lib/conf/'

dotFilesToLink = ['profile', 'gitignore_global', 'screenrc', 'zshrc']
confFilesToCopy = ['gitconfig']
confDirsToLink = ['git_template', 'git_template-man', 'ssh']

# modules
import sys, os, shutil, subprocess
import logging as log

# Functions
def createFiles(dataFile, path, method = 'link'):
    # check that source file exists and then do something...
    if os.path.exists(os.environ['HOME'] + path + dataFile ):
        if method == 'link':
            cmd = 'ln -sf '
            command = 'linking '
        if method == 'copy':
            cmd = 'cp -Rf '
            command = 'copying '
        print(command + os.environ['HOME'] + path + dataFile + '.........'),
        subprocess.call(cmd + os.environ['HOME'] + path + dataFile + ' ' + os.environ['HOME'] + '/.' + dataFile, shell=True)
        print('complete.')
    else:
        print('skipping - no source file found.')

def importConfig():
    print("Bootstraping this host....")
    # lets do this:
    for f in dotFilesToLink:
        createFiles(f, dotFiles, 'link')
    for f in confFilesToCopy:
        createFiles(f, confFiles, 'copy')
    for f in confDirsToLink:
        createFiles(f, confFiles, 'link')
    # Before we quit lets load the files
    subprocess.call('source ' + os.environ['HOME'] + '/.profile', shell=True)
    print("\nBootstrap complete.")

# Main Program
def main():
    # determine the system we are on:
    if sys.platform != "darwin":
        print(sys.platform)
        log.error("Incompatible Host System - Bootstrap Terminated.")
        sys.exit()
    importConfig()


# Ok, so we're doing this ->
if __name__ == '__main__':
    main()
