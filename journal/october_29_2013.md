# Tuesday, October 29

## Mavericks Post-Install

    sudo easy_install --upgrade pip
    pip install requirements.txt
    sudo pip install termcolor gflags ipython

Marcos also reports that "my acl permissions on
/Library/Python/2.7/site-packages had been removed, so you may need to re-add
them ala"

    sudo chmod +a 'user:YOUR_NAME_HERE allow add_subdirectory,add_file,delete_child,directory_inherit' /Library/Python/2.7/site-packages

Chris reports he had to reinstall a bunch of xcode tools to get homebrew
working again. "`xc-select --install` or somesuch"
