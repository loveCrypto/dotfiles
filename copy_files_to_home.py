#!/usr/bin/env python3

import os
import sys
import re
import subprocess


def checks_if_file_exist(file):
    return os.path.isfile(file)


def checks_if_folder_exist(folder):
    return os.path.isdir(folder)


def checks_if_list_of_files_exist(fileslist):
    for file in fileslist:
        if not checks_if_file_exist(file):
            print('File:', file, ' does not exist')
            return False
    return True


def checks_if_list_of_folders_exist(folderslist):
    for folder in folderslist:
        if not checks_if_folder_exist(folder):
            print('Folder:', folder, ' does not exist')
            return False
    return True


def checks_if_files_and_folders_exist(fileslist, folderslist):
    if not checks_if_list_of_files_exist(fileslist):
        return False
    if not checks_if_list_of_folders_exist(folderslist):
        return False
    return True


def build_ln_options_string(cwd, file_or_folder_name, home_path):
    options = '-s '
    options += cwd + '/' + file_or_folder_name
    options += ' ' + home_path + '.' + file_or_folder_name
    return options


def main():
    cwd = os.getcwd()
    command_ln = 'ln'
    match = re.search(r'(/home/\w+/)\S+', cwd)
    if not match:
        sys.exit(1)
    home = match.group(1)

    files = ['zshrc', 'vimrc', 'screenrc']
    folders = ['mc', 'vim', 'zsh']
    lists = [files, folders]

    if not checks_if_files_and_folders_exist(files, folders):
        sys.exit(1)

    all = False

    for items in lists:
        for item in items:
            options = build_ln_options_string(cwd, item, home)
            if all:
                subprocess.run([command_ln, options])
            else:
                print('About to do:')
                print(command_ln + ' ' + options)
                in_ = input('Do it? (y)es/(n)o/(e)sc/yes to (a)ll?  ')
                if in_ == 'y':
                    subprocess.run([command_ln, options])
                elif in_ == 'e':
                    sys.exit(1)
                elif in_ == 'a':
                    all = True
                    subprocess.run([command_ln, options])


if __name__ == '__main__':
    main()
