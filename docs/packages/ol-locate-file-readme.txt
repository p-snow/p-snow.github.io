This package provides a new Org link type that resolves partial
file path substrings into full paths using the `locate' command.

With this package, instead of writing a full absolute path:

    [[file:/usr/bin/emacsclient][emacsclient]]

you can write just a distinctive substring:

    [[lfile:emacsclient][emacsclient]]

The package opens the resolved file as if it were a regular
`file:' link.  Three variants are provided:

  - lfile:        => equivalent to file:        (find-file)
  - lfile+emacs:  => equivalent to file+emacs:  (find-file in Emacs)
  - lfile+sys:    => equivalent to file+sys:    (open with system app)

The link type name (default "lfile") is customizable via
`org-locate-file-link-type'.

When multiple files match the search substring, resolution follows
`org-locate-file-resolve-method', which may automatically pick the
first result, the most recently modified file, prompt the user, or
use a custom function.  Different methods can be specified for
follow vs. export (default: ask on follow, auto on export).

The locate command is invoked via Emacs' built-in `locate-make-command-line'
by default.  The command line can be customized through the
`org-locate-file-locate-args' variable, which accepts a command prefix
string or a custom command builder function.

Security: the package runs the locate command through `call-process'
rather than a shell, avoiding shell injection risks.
