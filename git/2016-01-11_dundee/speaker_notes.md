# SPEAKER_NOTES.md - git

Speaker Notes for the 2016-01-11 Software Carpentry git lesson

**TYPE ALL EXAMPLES AS YOU GO. THIS KEEPS THE SPEED SANE, AND ALLOWS YOU TO EXPLAIN EVERY STEP.**

**START SLIDES WITH `reveal-md slides.md --theme=white`**

## Version control with `git`

**SLIDE** (Version control with `git`)

**SLIDE** (Learning objectives)

* Talk around slide

**SLIDE** (Do you recognise this?)

* Talk around slide

* **Things get much more complicated when more people are involved**

* **Ask the audience**
  * Who has been in that situation?
  * How do you get round it?
  * MS Office: track changes
  * Office 365: simultaneous edits?
  * DropBox: now locks files in use
  * Google Docs: simultaneous editing
  
* **Version control systems are a solution to this**
  * Excellent for code
  * Useful for most activities

* **How version control works**
  * Keeps only one document
  * Saves records of all changes made to the document
  * Who made the changes, and when
  * Can reconstruct the entire editing history
  
**SLIDE** (How version control works)

* Talk around slide

**SLIDE** (Multiple editors - branching)

* Talk around slide

**SLIDE** (Combining changes - merging)

* Talk around slide

**SLIDE** (What version control systems do)

* Talk around slide

## Setting up `git`

**SLIDE** (Setting up `git`)

**SLIDE** (Learning objectives)

* Talk around slide

**SLIDE** (Setting global options)

* Talk around slide

* **`git` command structure**
  * `git <command> <options>` - i.e. `git` **verb**
  * The name and email address will be associated with all our actions in `git`
  * It's helpful to have some colour to interpret `git` output
  * The `--global` flag means that every project on the computer will see these settings
  
* **Use your own name and email address!**

```
lpritc@Totoro:~$ git config --global user.name "Leighton Pritchard"
lpritc@Totoro:~$ git config --global user.email "leighton.pritchard@hutton.ac.uk"
lpritc@Totoro:~$ git config --global color.ui "auto"
lpritc@Totoro:~$ git config --global core.editor "nano -w"
(git config --global core.editor "'C:\Program Files (x86)\Notepad++\notepad++.exe' \
                                 -multiInst -notabbar -nosession -noPlugin")
```

* **Check settings at any time**
  * You can reset these settings at any point
  * check with `git config --list`
  
```
lpritc@Totoro:~$ git config --list
user.name=Leighton Pritchard
user.email=leighton.pritchard@hutton.ac.uk
push.default=simple
color.ui=auto
core.editor=emacs
```

## Creating a repository

**SLIDE** (Creating a repository)

**SLIDE** (Learning objectives)

* Talk around slide

**SLIDE** (Creating a `git` repository)

* Talk around slide

* **Create a new directory to hold the project**
  * Create it somewhere convenient for you

```
lpritc@Totoro:~$ cd
lpritc@Totoro:~$ mkdir planets
lpritc@Totoro:~$ cd planets
lpritc@Totoro:planets$ 
```

* **Make this directory a repository**

```
lpritc@Totoro:planets$ git init
Initialized empty Git repository in /Users/lpritc/planets/.git/
lpritc@Totoro:planets$ ls
lpritc@Totoro:planets$ ls -a
./    ../   .git/
```

  * Nothing appears to have changed, at first
  * Using `ls -a` shows the hidden `.git` subdirectory
  * All information about the repository is stored in this subdirectory



* **Check all is well**
  * Get a report on respository status
  * We have not added or committed any files, so we get this statement
  
```
lpritc@Totoro:planets$ git status
# On branch master
#
# Initial commit
#
nothing to commit (create/copy files and use "git add" to track)
```

## Tracking changes

**SLIDE** (Tracking changes)

**SLIDE** (Learning objectives)

* Talk around slide

### My first `git` commit

**SLIDE** (My first untracked file)

* Talk around slide

* **Create a file**
  * We'll be discussing Mars' suitability as a base
  * Add some suitable text and save the file
  * We now have a single file in this directory
  
```
lpritc@Totoro:planets$ nano mars.txt
Cold and dry. Everything a nice colour. Matt Damon.
lpritc@Totoro:planets$ ls
mars.txt
lpritc@Totoro:planets$ cat mars.txt
Cold and dry. Everything a nice colour. Matt Damon.
```

* **Check repository status**
  * Use `git status` to see what `git` thinks.
  * It has noticed that the file exists
  * Git says it is not 'tracking' the file - i.e. not recording changes
  
```
lpritc@Totoro:planets$ git status
# On branch master
#
# Initial commit
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	mars.txt
nothing added to commit but untracked files present (use "git add" to track)
```
  
**SLIDE** (My first `git` commit)

* Talk around slide

* **Tell `git` to track the file**
  * Git sees the new file as a 'change' that is not yet committed
  * The changes are **STAGED**

```
lpritc@Totoro:planets$ git add mars.txt 
lpritc@Totoro:planets$ git status
# On branch master
#
# Initial commit
#
# Changes to be committed:
#   (use "git rm --cached <file>..." to unstage)
#
#	new file:   mars.txt
#
``` 

* **Commit the file to the repository**
  * Commiting the change to the repository stores it
  * We add a message to keep notes on changes
  * We commit *all* current changes simultaneously
  * Note the short identifier for this commit

```
lpritc@Totoro:planets$ git commit -m "Start notes on Mars as a base"
[master (root-commit) d22195b] Start notes on Mars as a base
 1 file changed, 2 insertions(+)
 create mode 100644 mars.txt
lpritc@Totoro:planets$ git status
# On branch master
nothing to commit, working directory clean
```

* **Use `git log` to see the history**
  * `git log` shows commits in reverse chronological order
  * Note the full identifier for this commit
  * The log message is also included
  * Only the file exists in the current working directory - all the log information etc. is in `.git`
  

```
lpritc@Totoro:planets$ git log
commit d22195b9ec3c8fb4c2ce0f52f344b95ce5d0d0e3
Author: Leighton Pritchard <leighton.pritchard@hutton.ac.uk>
Date:   Fri Jan 8 16:05:57 2016 +0000
    Start notes on Mars as a base
lpritc@Totoro:planets$ ls
mars.txt    
```

### modify-add-commit

**SLIDE** (modify-add-commit)

* Talk around slide

* **Make some changes to the file**
  * `git` tracks `mars.txt` so sees the changes are made
  * Changed file is "not staged for commit"

```
lpritc@Totoro:planets$ nano mars.txt
lpritc@Totoro:planets$ cat mars.txt
Cold and dry. Everything a nice colour. Matt Damon.
Two moons. This may be an issue for werewolves!
lpritc@Totoro:planets$ git status
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   mars.txt
#
no changes added to commit (use "git add" and/or "git commit -a")
```

* **Inspect changes since last commit**
  * `git diff` notes differences between the current version of the file in the working directory, and the latest in the repository
  * Line 1: output is similar to `diff` command
  * Line 2: unique identifiers for files being compared
  * Lines 3,4: which versions are compared (a: repo; b: directory)
  * The rest of the lines show what the differences are between the files (-: lines removed; +: lines added)
  
```
lpritc@Totoro:planets$ git diff
diff --git a/mars.txt b/mars.txt
index 87b4a99..96b2def 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1,2 +1,2 @@
 Cold and dry. Everything a nice colour. Matt Damon.
-
+Two moons. This may be an issue for werewolves!
```

* **Commit the change**
  * `git` won't let us commit without staging
  * We don't always want to commit all changes to all files at the same time

```
lpritc@Totoro:planets$ git commit -m "Lycanthropy concerns"
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   mars.txt
#
no changes added to commit (use "git add" and/or "git commit -a")
``` 

* **Stage the changes, then commit**

```
lpritc@Totoro:planets$ git add mars.txt
lpritc@Totoro:planets$ git commit -m "Lycanthropy concerns"
[master ea59e91] Lycanthropy concerns
 1 file changed, 1 insertion(+), 1 deletion(-)
``` 

* **Check the log**

```
lpritc@Totoro:planets$ git log
commit ea59e9169633eb7f9083ee79c2cc7ebf20efaf98
Author: Leighton Pritchard <leighton.pritchard@hutton.ac.uk>
Date:   Fri Jan 8 16:18:55 2016 +0000
    Lycanthropy concerns
commit d22195b9ec3c8fb4c2ce0f52f344b95ce5d0d0e3
Author: Leighton Pritchard <leighton.pritchard@hutton.ac.uk>
Date:   Fri Jan 8 16:05:57 2016 +0000
    Start notes on Mars as a base
```

* **Stage another change**
  * This time, don't do `git diff` until after staging
  * The file has changed, but `git diff` doesn't show this 
  
```
lpritc@Totoro:planets$ nano mars.txt
lpritc@Totoro:planets$ cat mars.txt 
Cold and dry. Everything a nice colour. Matt Damon.
Two moons. This may be an issue for werewolves!
Not much atmosphere, mind.
lpritc@Totoro:planets$ git add mars.txt 
lpritc@Totoro:planets$ git diff
``` 

* **Use the `--staged` flag**
  * We need `git diff --staged` to see staged file differences
  * Commit the change
  
```
lpritc@Totoro:planets$ git diff --staged
diff --git a/mars.txt b/mars.txt
index 96b2def..919cb89 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1,2 +1,3 @@
 Cold and dry. Everything a nice colour. Matt Damon.
 Two moons. This may be an issue for werewolves!
+Not much atmosphere, mind.
lpritc@Totoro:planets$ git commit -m "Climate issues"
[master 43faba5] Climate issues
 1 file changed, 1 insertion(+)
lpritc@Totoro:planets$ git log
commit 43faba5250cf67208f16e94f143a270f584a2e1b
Author: Leighton Pritchard <leighton.pritchard@hutton.ac.uk>
Date:   Fri Jan 8 16:27:29 2016 +0000
    Climate issues
commit ea59e9169633eb7f9083ee79c2cc7ebf20efaf98
Author: Leighton Pritchard <leighton.pritchard@hutton.ac.uk>
Date:   Fri Jan 8 16:18:55 2016 +0000
    Lycanthropy concerns
commit d22195b9ec3c8fb4c2ce0f52f344b95ce5d0d0e3
Author: Leighton Pritchard <leighton.pritchard@hutton.ac.uk>
Date:   Fri Jan 8 16:05:57 2016 +0000
    Start notes on Mars as a base
lpritc@Totoro:planets$ git status
# On branch master
nothing to commit, working directory clean
```

**SLIDE** (Challenge 1)

Solution:

```
lpritc@Totoro:planets$ nano mars.txt
lpritc@Totoro:planets$ cat mars.txt
Cold and dry. Everything a nice colour. Matt Damon.
Two moons. This may be an issue for werewolves!
Not much atmosphere, mind.
A bit dusty. Bring a Hoover.
lpritc@Totoro:planets$ nano earth.txt
lpritc@Totoro:planets$ cat earth.txt 
Mostly harmless
lpritc@Totoro:planets$ git status
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   mars.txt
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	earth.txt
no changes added to commit (use "git add" and/or "git commit -a")
lpritc@Totoro:planets$ git add mars.txt 
lpritc@Totoro:planets$ git add earth.txt 
lpritc@Totoro:planets$ git status
# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
#	new file:   earth.txt
#	modified:   mars.txt
#
lpritc@Totoro:planets$ git commit -m "Hoover needed. Ignore Earth."
[master 1f4de17] Hoover needed. Ignore Earth.
 2 files changed, 2 insertions(+)
 create mode 100644 earth.txt
lpritc@Totoro:planets$ git status
# On branch master
nothing to commit, working directory clean
lpritc@Totoro:planets$ git log
commit 1f4de176dc72c3ba0746e9e6a33b39f8f7e9fd75
Author: Leighton Pritchard <leighton.pritchard@hutton.ac.uk>
Date:   Fri Jan 8 16:34:09 2016 +0000
    Hoover needed. Ignore Earth.
commit 43faba5250cf67208f16e94f143a270f584a2e1b
Author: Leighton Pritchard <leighton.pritchard@hutton.ac.uk>
Date:   Fri Jan 8 16:27:29 2016 +0000
    Climate issues
commit ea59e9169633eb7f9083ee79c2cc7ebf20efaf98
Author: Leighton Pritchard <leighton.pritchard@hutton.ac.uk>
Date:   Fri Jan 8 16:18:55 2016 +0000
    Lycanthropy concerns
commit d22195b9ec3c8fb4c2ce0f52f344b95ce5d0d0e3
Author: Leighton Pritchard <leighton.pritchard@hutton.ac.uk>
Date:   Fri Jan 8 16:05:57 2016 +0000
    Start notes on Mars as a base
```

## Exploring history

**SLIDE** (Exploring history)

**SLIDE** (Learning objectives)

* Talk around slide

**SLIDE** (Commit history)

* Talk around slide

**SLIDE** (History with `git diff`)

* Talk around slide

* **See differences between named commits**

```
lpritc@Totoro:planets$ git diff HEAD~1 mars.txt
diff --git a/mars.txt b/mars.txt
index 919cb89..dfd5875 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1,3 +1,4 @@
 Cold and dry. Everything a nice colour. Matt Damon.
 Two moons. This may be an issue for werewolves!
 Not much atmosphere, mind.
+A bit dusty. Bring a Hoover.
lpritc@Totoro:planets$ git diff HEAD~2 mars.txt
diff --git a/mars.txt b/mars.txt
index 96b2def..dfd5875 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1,2 +1,4 @@
 Cold and dry. Everything a nice colour. Matt Damon.
 Two moons. This may be an issue for werewolves!
+Not much atmosphere, mind.
+A bit dusty. Bring a Hoover.
```

**SLIDE** (History with commit IDs)

* Talk around slide

* **Get IDs with `git log`**
  * Use a long ID in same way as above
  * We don't want to have to type out 40char IDs all the time
  * Use two short IDs (different lengths)
  

```
lpritc@Totoro:planets$ git log
commit 1f4de176dc72c3ba0746e9e6a33b39f8f7e9fd75
Author: Leighton Pritchard <leighton.pritchard@hutton.ac.uk>
Date:   Fri Jan 8 16:34:09 2016 +0000
    Hoover needed. Ignore Earth.
commit 43faba5250cf67208f16e94f143a270f584a2e1b
Author: Leighton Pritchard <leighton.pritchard@hutton.ac.uk>
Date:   Fri Jan 8 16:27:29 2016 +0000
    Climate issues
commit ea59e9169633eb7f9083ee79c2cc7ebf20efaf98
Author: Leighton Pritchard <leighton.pritchard@hutton.ac.uk>
Date:   Fri Jan 8 16:18:55 2016 +0000
    Lycanthropy concerns
commit d22195b9ec3c8fb4c2ce0f52f344b95ce5d0d0e3
Author: Leighton Pritchard <leighton.pritchard@hutton.ac.uk>
Date:   Fri Jan 8 16:05:57 2016 +0000
    Start notes on Mars as a base
lpritc@Totoro:planets$ git diff d22195b9ec3c8fb4c2ce0f52f344b95ce5d0d0e3 mars.txt
diff --git a/mars.txt b/mars.txt
index 87b4a99..dfd5875 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1,2 +1,4 @@
 Cold and dry. Everything a nice colour. Matt Damon.
-
+Two moons. This may be an issue for werewolves!
+Not much atmosphere, mind.
+A bit dusty. Bring a Hoover.
lpritc@Totoro:planets$ git diff d221 mars.txt
diff --git a/mars.txt b/mars.txt
index 87b4a99..dfd5875 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1,2 +1,4 @@
 Cold and dry. Everything a nice colour. Matt Damon.
-
+Two moons. This may be an issue for werewolves!
+Not much atmosphere, mind.
+A bit dusty. Bring a Hoover.
lpritc@Totoro:planets$ git diff 43faba mars.txt 
diff --git a/mars.txt b/mars.txt
index 919cb89..dfd5875 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1,3 +1,4 @@
 Cold and dry. Everything a nice colour. Matt Damon.
 Two moons. This may be an issue for werewolves!
 Not much atmosphere, mind.
+A bit dusty. Bring a Hoover.    
```

## Restoring older versions

**SLIDE** (Restoring older versions)

* Talk around slide

* **Accidentally overwrite a file**
  * Once overwritten, `git status` says the changes were made, but not staged.

```
lpritc@Totoro:planets$ nano mars.txt 
lpritc@Totoro:planets$ cat mars.txt
POTATOES!
lpritc@Totoro:planets$ git status
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   mars.txt
#
no changes added to commit (use "git add" and/or "git commit -a")
```

* **Restore the last commit**
  * Use `git checkout HEAD`
  
```
lpritc@Totoro:planets$ git checkout HEAD mars.txt 
lpritc@Totoro:planets$ cat mars.txt 
Cold and dry. Everything a nice colour. Matt Damon.
Two moons. This may be an issue for werewolves!
Not much atmosphere, mind.
A bit dusty. Bring a Hoover.
```

**SLIDE** (`git checkout`)

* Talk around slide

**SLIDE** (Question)

Solution: 2 & 4

## Ignoring things

**SLIDE** (Ignoring things)

**SLIDE** (Learning objectives)

* Talk around slide

**SLIDE** (Not all files are useful)

* Talk around slide

* **Create dummy files**
  * Create dummy files and subdirectory
  * These files are no use to us
  * `git` says they're not being tracked

```
lpritc@Totoro:planets$ mkdir results
lpritc@Totoro:planets$ touch a.dat b.dat c.dat results/a.out results/b.out
lpritc@Totoro:planets$ ls
a.dat      b.dat      c.dat      earth.txt  mars.txt   results/
lpritc@Totoro:planets$ ls results/
a.out  b.out
lpritc@Totoro:planets$ git status
# On branch master
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	a.dat
#	b.dat
#	c.dat
#	results/
nothing added to commit but untracked files present (use "git add" to track)
```

**SLIDE** (`.gitignore`)

* Talk around slide

* **Create `.gitignore` file**
  * Two patterns: `*.dat`, `results/` (all files below this point)
  * `git` now ignores the new files, but notices `.gitignore`
  
```
lpritc@Totoro:planets$ nano .gitignore
lpritc@Totoro:planets$ cat .gitignore 
# Exclude all files ending in .dat
*.dat
# Exclude all files below results/
results/
lpritc@Totoro:planets$ git status
# On branch master
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	.gitignore
nothing added to commit but untracked files present (use "git add" to track)
```

* **Commit `.gitignore`**

```
lpritc@Totoro:planets$ git add .gitignore 
lpritc@Totoro:planets$ git commit -m "Added .gitignore file"
[master f0232b1] Added .gitignore file
 1 file changed, 5 insertions(+)
 create mode 100644 .gitignore
lpritc@Totoro:planets$ git status
# On branch master
nothing to commit, working directory clean
```

* **List ignored files**

```
lpritc@Totoro:planets$ git status --ignored
# On branch master
# Ignored files:
#   (use "git add -f <file>..." to include in what will be committed)
#
#	a.dat
#	b.dat
#	c.dat
#	results/
nothing to commit, working directory clean
```

* **Add an ignored file**
  * `git` will refuse
  * Can override with `-f`, `--force`

```
lpritc@Totoro:planets$ git add b.dat
The following paths are ignored by one of your .gitignore files:
b.dat
Use -f if you really want to add them.
fatal: no files added
```

## Remotes in GitHub

**SLIDE** (Remotes in GitHub)

**SLIDE** (Learning objectives)

* Talk around slide

### Remote repositories

**SLIDE** (Remote repositories)

* Talk around slide

**SLIDE** (Log in to GitHub)

* Talk around slide

**SLIDE** (Create a remote repository)

* **Create new repository**
  * `+(create new) -> New Repository`
  * Repository name: `planets`
  * `Create repository`
  * We then see a page of quick setup hints
  
**SLIDE** (A freshly-made GitHub repository)

* Talk around slide

**SLIDE** (Connecting local and remote repositories)

* Talk around slide

* **Get remote repository URL**
  * Copy the `https://` link
  * Add the remote repository (`git remote add origin`)
  * Check it worked (`git remote -v`)
  
```
lpritc@Totoro:planets$ git remote add origin https://github.com/widdowquinn/planets.git
lpritc@Totoro:planets$ git remote -v
origin	https://github.com/widdowquinn/planets.git (fetch)
origin	https://github.com/widdowquinn/planets.git (push)
```

* **Push to remote repo**
  * `master` refers to the *branch* we're on

```
lpritc@Totoro:planets$ git push origin master
Username for 'https://github.com': widdowquinn
Password for 'https://widdowquinn@github.com': 
Counting objects: 16, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (12/12), done.
Writing objects: 100% (16/16), 1.48 KiB | 0 bytes/s, done.
Total 16 (delta 2), reused 0 (delta 0)
To https://github.com/widdowquinn/planets.git
 * [new branch]      master -> master
```

**SLIDE** (Remote GitHub repo after first push)

* Talk around slide

**SLIDE** (My first remote *pull*)

* Talk around slide

* **Pull from remote repo**
  * `git` confirms we're up to date


```
lpritc@Totoro:planets$ git pull origin master
From https://github.com/widdowquinn/planets
 * branch            master     -> FETCH_HEAD
Already up-to-date.
```

## GitHub collaboration

**SLIDE** (GitHub collaboration)

**SLIDE** (Learning objectives)

* Talk around slide

**SLIDE** (Starting a collaboration)

* **Pair off learners**

* **Demonstrate giving a colleague access**
  * `Settings -> Collaborators` - add your partner's username/ID
  * `cd` to a new directory (e.g. `tmp/`)
  * clone *your colleague's* repo
  * Check the remote repo location with `git remote -v`
  
```
lpritc@Totoro:planets$ cd /tmp/
lpritc@Totoro:tmp$ git clone https://github.com/widdowquinn/planets.git
Cloning into 'planets'...
remote: Counting objects: 16, done.
remote: Compressing objects: 100% (10/10), done.
remote: Total 16 (delta 2), reused 16 (delta 2), pack-reused 0
Unpacking objects: 100% (16/16), done.
Checking connectivity... done
lpritc@Totoro:tmp$ ls planets/
earth.txt  mars.txt
lpritc@Totoro:planets$ git remote -v
origin	https://github.com/widdowquinn/planets.git (fetch)
origin	https://github.com/widdowquinn/planets.git (push)
```

**SLIDE** (Make a collaborative change)

* Talk around slide

* **Make a new file**

```
lpritc@Totoro:tmp$ cd planets
lpritc@Totoro:planets$ nano pluto.txt
lpritc@Totoro:planets$ cat pluto.txt 
Never a planet. Lovely, but not a planet.
```

* **Commit the file**

```
lpritc@Totoro:planets$ git add pluto.txt
lpritc@Totoro:planets$ git commit -m "Notes on Pluto"
[master 4907645] Notes on Pluto
 1 file changed, 1 insertion(+)
 create mode 100644 pluto.txt
```

* **Push the change to GitHub**

```
lpritc@Totoro:planets$ git push origin master
Username for 'https://github.com': widdowquinn
Password for 'https://widdowquinn@github.com': 
Counting objects: 4, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 316 bytes | 0 bytes/s, done.
Total 3 (delta 1), reused 0 (delta 0)
To https://github.com/widdowquinn/planets.git
   f0232b1..4907645  master -> master
```

* **View the change on your own GitHub repo as *host***
  * Talk through changes on GitHub

**SLIDE** (Pull a collaborator's changes)

* Talk around slide

* **Pull the new change to your repository as host**
  * Change directory to your host repository
  * Check it's the right one with `git remote -v`
  * `git status` does not show remote changes
  * Sync with `git pull`
  
```
lpritc@Totoro:planets$ cd ~/planets/
lpritc@Totoro:planets$ git remote -v
origin	https://github.com/widdowquinn/planets.git (fetch)
origin	https://github.com/widdowquinn/planets.git (push)
lpritc@Totoro:planets$ git status
# On branch master
nothing to commit, working directory clean
lpritc@Totoro:planets$ git pull origin master
From https://github.com/widdowquinn/planets
 * branch            master     -> FETCH_HEAD
Updating f0232b1..4907645
Fast-forward
 pluto.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 pluto.txt
```

## Resolving `git` conflicts

**SLIDE** (Resolving `git` conflicts)

**SLIDE** (Learning objectives)

* Talk around slide

**SLIDE** (Why conflicts occur)

* Talk around slide

* **`git` encourages ways of working**
  * modular structure - small files (reusability)
  * small, incremental changes (reproducibility)
  * good planning
  * interaction/communication

### Creating a conflict
  
**SLIDE** (Let's make a conflict)

* Talk around the slide

* **Create the host conflict**
  * Check you're in the right repo
  * Add a line to `mars.txt`
  * Commit and push

```
lpritc@Totoro:planets$ git remote -v
origin	https://github.com/widdowquinn/planets.git (fetch)
origin	https://github.com/widdowquinn/planets.git (push)
lpritc@Totoro:planets$ nano mars.txt
lpritc@Totoro:planets$ git add mars.txt 
lpritc@Totoro:planets$ git commit -m "Slandering Pluto"
[master d83cb5a] Slandering Pluto
 1 file changed, 1 insertion(+)
lpritc@Totoro:planets$ git push origin master
Username for 'https://github.com': widdowquinn
Password for 'https://widdowquinn@github.com': 
Counting objects: 5, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 341 bytes | 0 bytes/s, done.
Total 3 (delta 2), reused 0 (delta 0)
To https://github.com/widdowquinn/planets.git
   4907645..d83cb5a  master -> master
```

* **Create the collaborator conflict**
  * Change to collaborator repo
  * Check with `git remote -v`
  * Add a line to `mars.txt`
  * Commit the change
  
```
lpritc@Totoro:planets$ git remote -v
origin	https://github.com/widdowquinn/planets.git (fetch)
origin	https://github.com/widdowquinn/planets.git (push)
lpritc@Totoro:planets$ cd /tmp/planets/
lpritc@Totoro:planets$ nano mars.txt
lpritc@Totoro:planets$ git add mars.txt 
lpritc@Totoro:planets$ git commit -m "Praising Pluto"
[master 60f892f] Praising Pluto
 1 file changed, 1 insertion(+)
```

* **Push the change**
  * This should raise a conflict!

```
lpritc@Totoro:planets$ git push origin master
Username for 'https://github.com': widdowquinn
Password for 'https://widdowquinn@github.com': 
To https://github.com/widdowquinn/planets.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'https://github.com/widdowquinn/planets.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

**SLIDE** (The conflict message)

* Talk around the slide

**SLIDE** (The conflicting changes)

* Talk around the slide

## Resolving a conflict

**SLIDE** (Resolving a conflict)

* Talk around slide

* **Pull the remote changes**
  * `git` tries to merge automatically, and will if it can
  * If not, it marks the conflict in the affected file

```
lpritc@Totoro:planets$ git pull origin master
remote: Counting objects: 3, done.
remote: Compressing objects: 100% (1/1), done.
remote: Total 3 (delta 2), reused 3 (delta 2), pack-reused 0
Unpacking objects: 100% (3/3), done.
From https://github.com/widdowquinn/planets
 * branch            master     -> FETCH_HEAD
   4907645..d83cb5a  master     -> origin/master
Auto-merging mars.txt
CONFLICT (content): Merge conflict in mars.txt
Automatic merge failed; fix conflicts and then commit the result.
```

* **Explain conflict syntax**
  * The local change in `HEAD` is preceded by `<<<<<<<`
  * Then there's a separator
  * Then the remote change, followed by `>>>>>>>`
  * We have to decide which change to keep (if either)

```
lpritc@Totoro:planets$ cat mars.txt 
Cold and dry. Everything a nice colour. Matt Damon.
Two moons. This may be an issue for werewolves!
Not much atmosphere, mind.
A bit dusty. Bring a Hoover.
<<<<<<< HEAD
I wish Pluto was a planet, like this one.
=======
But at least it's a planet, unlike Pluto.
>>>>>>> d83cb5a5ef115c4718a685121182c27a874143a8
```

* **Edit the file to resolve the change**
  * Until you add/commit, `git status` will warn about "unmerged paths"

```
lpritc@Totoro:planets$ nano mars.txt 
lpritc@Totoro:planets$ cat mars.txt
Cold and dry. Everything a nice colour. Matt Damon.
Two moons. This may be an issue for werewolves!
Not much atmosphere, mind.
A bit dusty. Bring a Hoover.
But at least it's a planet, unlike Pluto. Which is definitely interesting.
lpritc@Totoro:planets$ git status
# On branch master
# Your branch and 'origin/master' have diverged,
# and have 1 and 1 different commit each, respectively.
#   (use "git pull" to merge the remote branch into yours)
#
# You have unmerged paths.
#   (fix conflicts and run "git commit")
#
# Unmerged paths:
#   (use "git add <file>..." to mark resolution)
#
#	both modified:      mars.txt
#
no changes added to commit (use "git add" and/or "git commit -a")
```

* **Add and commit, then push**

```
lpritc@Totoro:planets$ git add mars.txt
lpritc@Totoro:planets$ git commit -m "merged changes from GitHub"
[master 665ed3f] merged changes from GitHub
lpritc@Totoro:planets$ git status
# On branch master
# Your branch is ahead of 'origin/master' by 2 commits.
#   (use "git push" to publish your local commits)
#
nothing to commit, working directory clean
lpritc@Totoro:planets$ git push origin master
Username for 'https://github.com': widdowquinn
Password for 'https://widdowquinn@github.com': 
Counting objects: 10, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 671 bytes | 0 bytes/s, done.
Total 6 (delta 4), reused 0 (delta 0)
To https://github.com/widdowquinn/planets.git
   d83cb5a..665ed3f  master -> master
``` 

* **Change back to your host repo, and pull**
  * Check with `git remote -v`
  * The conflict is resolved

```
lpritc@Totoro:planets$ cd ~/planets/
lpritc@Totoro:planets$ git remote -v
origin	https://github.com/widdowquinn/planets.git (fetch)
origin	https://github.com/widdowquinn/planets.git (push)
lpritc@Totoro:planets$ git pull origin master
remote: Counting objects: 6, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 6 (delta 4), reused 6 (delta 4), pack-reused 0
Unpacking objects: 100% (6/6), done.
From https://github.com/widdowquinn/planets
 * branch            master     -> FETCH_HEAD
   d83cb5a..665ed3f  master     -> origin/master
Updating d83cb5a..665ed3f
Fast-forward
 mars.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
lpritc@Totoro:planets$ cat mars.txt 
Cold and dry. Everything a nice colour. Matt Damon.
Two moons. This may be an issue for werewolves!
Not much atmosphere, mind.
A bit dusty. Bring a Hoover.
But at least it's a planet, unlike Pluto. Which is definitely interesting.
```

## Wrapping up

* Talk around slide
