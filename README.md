Lugg(age).sh: Take your $HOME with you
======================================

RE: ("On Configuration")[http://sstephenson.us/posts/on-configuration]. The script:

 - Creates a tmp directory
 - Checks out your dotfiles repo into it
 - Adds symbolic links of everything in the current $HOME
 - Backs up $HOME
 - Sets $HOME to the new tmp directory

Disclaimer: I'm not a pro at bash. It could be a horrible idea.

## Usage

`source lugg.sh [repo]`

If `repo` is left off, it will revert to the original $HOME value.
