# 🖌️ Coding Scrapbook

<!-- TODO: add a picture of a scrapbook to give a better idea -->

This repository contains bits and pieces of different projects that *might*
come handy (or not).  

## Getting around

This repository is organized in *categories* that contain *projects*.  

> For example *Python*, could be a great category for projects
> written in `Python` language.

Projects can be about anything (and nothing) and mostly serve as pen tests.

The projects files are organized as follows:

```plaintext
./
    - README.md
    - Makefile
    - Python/
        - flower_bot/
            - README.md     (project's readme)
            - ...           (all the other files)
        - ...               (all other projects)
    - ...                   (all other categories)
```

> More abstract representation:
>
> ```plaintext
> ./
>     - ... 
>     - <Category>/
>         - <Project>/
>             - README.md
>             - ...
> ```

## Managing projects

The [`Makefile`](./Makefile) with a some helpful targets is used to manage this scrapbook.  

### Get help with `make help`

To get a list of available targets with their descriptions:  

```bash
$ make help
👋 Hello.
~~~~~~~~~
See the list of all available targets below:
--------------------------------------------
 help:      Get documentation of available make targets.
 new-project (np): ...
 ...
```

### Start new projects with `make new-project`

To create a new project, run `make new-project` (or `make np`)
specifying the `category` and `project` name as arguments.  

For example:  

```bash
# or `make np category=Python project=flower_bot`
$ make new-project category=Python project=flower_bot
👷 Opening a new branch for your project...
Switched to a new branch 'tp-flower_bot-Python-init'
🏗️ Creating a new directory...
📝 Updating the workspace registry...
🧹 Cleaning up your workspace...
✅ Done!
💡 To go your new project:
        cd ./Python/flower_bot
```

### List existing projects with `make list`

To find all available project directories:

```bash
$ make list
🔍 See the following categories and projects:
-> ./Python/flower_bot
...
```

### Special Makefile syntax

To manage help strings, this [`Makefile`](./Makefile) uses a special syntax:

Reserved item | Purpose | Example
------------- | ------- | -------
`#@ <target name>` | Indicating a beginning of a help string for a given target so that it is automatically recognized when using `make help` | `#@ help:   Get documentation of available make targets`
