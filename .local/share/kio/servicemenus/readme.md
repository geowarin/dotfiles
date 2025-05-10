https://develop.kde.org/docs/apps/dolphin/service-menus/

`%f`  A single file name (including the path), even if multiple files are selected. The system reading the desktop entry should recognize that the program in question cannot handle multiple file arguments

`%F` A list of files. Use for apps that can open several local files at once. Each file is passed as a separate argument to the executable program. 

`%u`  A single URL. Local files may either be passed as file: URLs or as file path.

`%U` A list of URLs. Each URL is passed as a separate argument to the executable program. Local files may either be passed as file: URLs or as file path.

`%k` The location of the desktop file as either a URI (if for example gotten from the vfolder system) or a local filename or empty if no location is known. 