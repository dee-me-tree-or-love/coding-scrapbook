# Coding Scrapbook

<!-- TODO: add a picture of a scrapbook to give a better idea -->

This repository contains scraps, bits and pieces
of different projects that might at some point
come handy (or not) or at least were fun to work on.  

## Getting around

This repository is organized in _categories_ that contain _projects_.  

> For example _C_, could be a great category for projects
> written in `C` language!

Projects can be about anything (and nothing :)) and mostly
serve as pen tests for something more real :).

Therefore by looking around, you can find the structure
that looks something like this:  

```plaintext
./
    - README.md (this file)
    - Makefile  (we'll get to this :))
    # C/
        # Counter/
            - README.md (description of the awesome Counter program in C!)
            - ...       (all the other files)
    # NodeJs/
        # Shuffler/
            - README.md (very much the same idea!)
            - ...       (all the other files)
```

The actual content of this of course will be changing,
but generally it will be following this principle :) 

```plaintext
./
    - ... (Scrapbook generic files)
    # <Category>/   (for the abstraction-savvy ;))
        # <Project>/    (a project name of your choice)
            - README.md     (a project's description)
            - ...
```

## Managing projects

> This is a part were we get to discuss the `Makefile`!  

Managment of this repository is done via a local
`Makefile` that defines a few helpful commands.  
You can find the contents of this file [here](./Makefile).  

#### Makefile help

To get a list of available `make` targets with their help comments run:  

```bash
$ make help
 help:      Get documentation of available make targets.
 new-project (np): ...
 ...
```

#### Creating new projects

To create a new project, run a `make new-project` command
specifying the desired `category` and `project` name:  

```bash
$ make new-project category=C project=Counter
git checkout -b tp-Counter-C-init
Switched to a new branch 'tp-Counter-C-init'
mkdir -p ./C/Counter
touch ./C/Counter/README.md
Done!
# NB: can also be triggerd in a concise manner
# `$ make np category=C project=Counter`
```

#### Special Makefile syntax

For the sake of convenience, this Makefile uses a special syntax.  
Here is its quick reference:  

Reserved item | Purpose | Example
------------- | ------- | -------
`#@ <target name>` | Indicating a beginning of a help string for a given target so that it is automatically recognized when using `make help` | `#@ help:   Get documentation of available make targets`


<!-- TODO: add section listing existing projects -->
<!-- ## Project listing -->
