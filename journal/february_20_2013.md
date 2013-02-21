# February 20, 2013

## 9:17 PM - Unix Permissions

Because I always forget the details

owner group others
read write execute

Extra bits:

setuid/SUID - When a file with setuid is executed, the resulting process will
assume the effective user ID given to the owner class.

setgid/SGID - When a file with setgid is executed, the resulting process will
assume the group ID given to the group class. When setgid is applied to a
directory, new files and directories created under that directory will inherit
the group from that directory.

sticky - The typical behaviour of the sticky bit on executable files
encourages the kernel to retain the resulting process image in memory beyond
termination. On a directory, the sticky permission prevents users from
renaming, moving or deleting contained files owned by users other than
themselves, even if they have write permission to the directory. Only the
directory owner and superuser are exempt from this.
