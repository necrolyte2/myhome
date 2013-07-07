#!/usr/bin/python2.7

# Yes, puppet and chef exist, but for now do this

import os
import sys
import os.path
from subprocess import (Popen, PIPE, check_call, 
        check_output, CalledProcessError)

# Install these packages
pkg_list = [
    'vim',
    'rxvt-unicode',
    'git',
    'xclip',
]

def install_packages( pkg_list ):
    '''
        Install a list of packages

        @param pkg_list - List of packages to install
    '''
    for pkg in pkg_list:
        if isinstance( pkg, str ) or len( pkg ) == 1:
            install_pkg( pkg ) 
        else:
            install_pkg( *pkg )

def is_installed( pkg ):
    '''
        Check to see if package is already installed

        @param pkg - Package name to install
    '''
    try:
        check_call( "pacman -Q {}".format( pkg ), shell=True )
        return True
    except CalledProcessError:
        return False

def install_pkg( pkg, options=[] ):
    '''
        Install packages using pacman

        @param pkg - Package name to install
        @param options - Additional pacman options to supply
    '''
    if is_installed( pkg ):
        return
    cmd = ['sudo', 'pacman'] + options + ['-S', pkg]
    output = check_output( " ".join( cmd ), shell=True ) 
    print( output )

def main( ):
    install_packages( pkg_list )

if __name__ == '__main__':
    main( )
