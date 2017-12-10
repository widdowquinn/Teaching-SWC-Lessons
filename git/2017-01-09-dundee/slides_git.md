# 2016-01-17 Software Carpentry Workshop: git

----

Please use the EtherPad to take communal notes:

[http://pad.software-carpentry.org/2017-01-09-dundee](http://pad.software-carpentry.org/2017-01-09-dundee)

---

## Let me tell you a story...

----

### Once upon a time...

* Wolfman and Dracula were been hired to plan a Mars mission (obviously)
* Wolfman and Dracula live on different continents
* They work on the same plan at the same time
* How to manage this?
  * take turns on each file?
  * email copies?
* The solution? **Version Control** 

----

### Advantage of version control

* Nothing that is committed is *ever* lost (unless you try…)
* We can record who made which changes, and when
* We can revert to previous versions.
* We can identify and correct conflicts

The lab notebook of code development.

---

## Version control with `git`

----

### What lies ahead…?

![XKCD comic - A: This is git. It tracks collaborative work on projects through a beautiful distributed graph theory tree mode; B: Cool. How do we use it?; A: No idea. Just memorise these shell commands and type them to sync up. If you get errors, save your work elsewhere, delete the project, and download a gresh copy.](img/git.png)

----

### Learning objectives

* Understand the basics of automated version control
* Understand the basics of `git`

----

### Do you recognise this?

(i.e. have you *ever* worked on the same document as someone else?)

![PhD comic: "Final".doc - files are called: Final.doc, Final_rev.2.doc, FINAL_rev.6.COMMENTS.doc, FINAL_rev.8.commens5.CORRECTIONS.doc, FINAL_rev.18.comment7.corrections9.MORE.30.doc, FINAL_rev.22.comments49.corrections.10.WHYDIDICOMETOGRADSCHOOL.doc](img/phd101212s_small.gif)

----

### How version control works

* Version control is like a 'recording' of history

![Three documents. The first has two paragraphs. The second has a modified paragraph. The third has an additional paragraph](img/play-changes.png)

* Rewind and play back changes

----

### Multiple editors (branching)

* Two people work on a document
  * Each makes independent changes: two versions
  
![Three documents. On the left is the original, and on the right are two versions of this with different, and conflicting, changes](img/versions.png)

* Changes are separate from the document

----

### Combining changes (merging)

* Several changes can be merged onto the same base document
  * 'Merging'

![Three documents. On the left are the two modified documents from the previous slide. On the right is a single that incorporates both of those changes](img/merge.png)

----

### What version control systems do

* Version control systems manage this process
   * track changes
   * store metadata (who, when)
   * record 'versions' (a.k.a. *commits*)
* The complete history of *commits* and metadata is a *repository*
* CVS, Subversion, RCS: legacy systems
* `git`, Mercurial: modern *distributed* VC tools

---

## Setting up `git`

----

### Learning objectives

* Configure `git` for first use on a computer
* Understand `git config --global`

----

### Setting global options

* `git` needs to know who you are for metadata
* `git` wants your preferences for display/editing

**Live Presentation**

```
git config --global user.name "Vlad Dracul"
git config --global user.email "vlad@tran.sylvan.ia"
git config --global color.ui "auto"
git config --global core.editor "nano -w"
git config --global core.editor \
"'C:\Program Files (x86)\Notepad++\notepad++.exe' \
-multiInst -notabbar -nosession -noPlugin"
```
[http://pad.software-carpentry.org/2016-10-17-edinburgh](http://pad.software-carpentry.org/2016-10-17-edinburgh)

---

## Creating a repository

----

### Learning objectives

* Create a local `git` repository
* What is in a repository?
  * files
  * commits
  * metadata

----

### Creating a `git` repository

* A fictional project about planets
  * (Wolfman and Dracula…)

**Live Presentation**

```
git init
git status
```

---

## Tracking changes

----

### Learning objectives

* Practice the modify-add-commit cycle
* Understand where information is stored, in the `git` workflow

----

### My first untracked file

* We'll create a file, but do nothing with it
  * "Is Mars suitable as a space base?" 

**Live Presentation**

```
nano mars.txt
```

----

### My first `git` commit

* We tell `git` that it should *track* a file (watch for changes): `git add`
* We also `git commit` the file (keep a copy of the file in the *repository*, in its current state)

**Live Presentation**

```
git add mars.txt
git commit -m "start notes on Mars as a base"
git log
```

----

### The staging area

* We don't always want to commit all changes
* The *staging area* holds changes we want to commit
  * (other files may also be changed, but we don't want to commit them)
  
![On the left is a modified document. On the right is a zone representing the data stored in `.git`. In that zone are two containers: a staging area, and a repository. Using `git add` places the document into the staging area. Using `git commit` moves the document from the staging area into the repository](img/git-staging-area.png)

----

### modify-add-commit

* Now we want to add more information to the file
  * Modify file
  * Add file to *staging area* (`git add`)
  * Commit changes

**Live Presentation**

```
nano mars.txt
git diff
git add mars.txt
git diff
git commit
```

----

### Question

-  Which command(s) below would save changes in `myfile.txt` to the local `git` repository?


1. `git commit -m "add recent changes"`
2. `git init myfile.txt; git commit -m "add recent changes"`
3. `git add myfile.txt; git commit -m "add recent changes"`
4. `git commit -m myfile.txt "add recent changes"`


----

### Challenge 1 (5min)

* Make a one-line change to `mars.txt`.
* Create file `earth.txt` with one-line comment on Earth.
* Commit both changes (*as a **single*** `commit`)

![On the left are two documents (FILE1.txt and FILE2.txt). On the right is a zone representing the `.git` directory. Arrows show the use of `git add` to place the two documents into the staging area, followed by a `git commit` to move both files simultaneously from the staging area to the repository](img/git-committing.png)

----

### The modify-add-commit lifecycle

![A UML-like diagram showing four potential states of a file, according to `git`: untracked, unmodified, modified, and staged. Arrows indicate the actions required to move a file from one state to another: untracked to staged, add the file; unmodified to modified, edit the file; modified to staged, stage/add the file; staged to unmodified, commit the file; unmodified to untracked, remove the file](img/lifecycle.png)

----

### In which I predict the future…

![XKCD comic: a list of commit messages for a repository that start well, but become progressively more like gibberish, titled "As a project drags on, my `git` commit messages get less and less informative"](img/git_commit.png)

---

## Exploring history

----

### Is history bunk?

* How can I identify old versions of files?
* How do I review changes between commits?
* How can I recover old file versions?

----

### Learning objectives

* Understand what the `HEAD` of a repository is
* Identify and use `git` commit numbers
* Compare various versions of tracked files
* Restore old versions of files

----

### Commit history

* Most recent commit: `HEAD`
* Next-most recent: `HEAD~1`
* Next-next-most recent: `HEAD~2`

![Three documents. On the left is the original. In the middle is that document with one line changed. On the right is the middle document with an extra paragraph added. Arrows indicate that the documents are related in order of history.](img/play-changes.png)

----

### History with `git diff`

* We can use `git diff` to see what changed for a file at each commit

**Live Presentation**

```
git diff HEAD~1 mars.txt
git diff HEAD~2 mars.txt
```

----

### History with commit IDs

* We can use the unique ID for a commit in the same way

**Live Presentation**

```
git diff d22195b9ec3c8fb4c2ce0f52f344b95ce5d0d0e3 mars.txt
git diff d221 mars.txt
```

----

### Restoring older versions

* How can we restore older versions/backtrack?
* Let's say we accidentally overwrite a file…

**Live Presentation**

```
git checkout HEAD mars.txt 
```

----

### `git checkout`

* `git checkout` "checks out" files from the repo
  * Can use any commit identifier
  * Check out the commit *before* the edit you want to replace!

![On the left is a zone representing the `.git` directory, with three commits in a repository. One commit (HEAD~1, f22b25e) contains changes we want to recover. On the right are two files that are rcovered. An arrow indicates two commands for recovery: `git checkout HEAD~1` and `git checkout f22b25e`](img/git-checkout.png)

----

### Question

- Which command(s) below will let Jennifer recover the last committed version of her Python script called `data_cruncher.py` (but no other files)?


1. `$ git checkout HEAD`
2. `$ git checkout HEAD data_cruncher.py`
3. `$ git checkout HEAD~1 data_cruncher.py`
4. `$ git checkout <unique ID of last commit> data_cruncher.py`

---

## Ignoring things

----

### Learning objectives

* Configure `git` to ignore files and directories
* Understand why this is useful

----

### Not all files are useful

* Editor backup files
* Temporary files
* Intermediate analysis files

**Live Presentation**

```
mkdir results
touch a.dat results/a.out
```

----

### `.gitignore`

* `.gitignore` is a special file in your repository root 
  * It tells `git` to ignore specified files/directories
  * It should be committed in your repository

**Live Presentation**

```
nano .gitignore
git status --ignored
git add -f b.dat
```

---

## Remotes in GitHub

----

### Learning objectives

* What remote repositories are and why they are useful
* To clone a remote repository
* To push to and pull from a remote repository

----

### Remote repositories

* Version control most useful for collaboration
  * Easiest to have a single repository
  * Repository may be hosted off-site (for at least one collaborator)
* Services available:
  * GitHub, BitBucket, GitLab
* We're using GitHub

----

### GitHub Saved My Life!

![GitHub Saved My Life Tonight](img/github_saved_my_life.png)

----

### Log in to GitHub

* Register for an account, if you don't have one - then log in

![Screenshot of widdowquinn GitHub profile](img/lp_github.png)

----

### Create a remote repository

* Essentially, on GitHub's servers:

```
mkdir planets
cd planets
git init
``` 

**Live Presentation**

----

### A freshly-made GitHub repository

* There's nothing in the remote repository!

![Two repositories. At the top, the local `planets` repository (belonging to Vlad), which contains files in the staging area and repository. At the bottom, an empty epository, representing the 'clean' repository just created on `GitHub`](img/git-freshly-made-github-repo.png)

----

### Connecting local and remote repositories

* We tell the *local* repository that the GitHub repository is its *remote* repository.
  * `origin` is a local nickname for the remote repo (a common choice)
  * Once set up, we *push* changes/history to the remote repo

**Live Presentation**

```
git remote add origin https://github.com/widdowquinn/planets.git
git push origin master
```

----

### Remote GitHub repo after first *push*

* We only *push* the repository, not the staging area

![Two repositories. At the top, the local `planets` repository (belonging to Vlad), which contains files in the staging area and repository. At the bottom, the remote `GitHub` repository, which contains the same repostitory as the local repo - but *not* the staging area](img/github-repo-after-first-push.png)

----

### My first remote *pull*

* To synchronise the local repo with the remote repo, we *pull*

**Live Presentation**

```
git pull origin master
```

---

## GitHub collaboration

----

### Learning objectives

* Collaborate pushing changes to someone else's remote repository

----

### Starting a collaboration

* Pair up as 'owner' and 'collaborator'
* as *owner*: give GitHub repo access to your collaborator
* as *collaborator*: clone the *owner*'s repo

**Live Presentation**

```
cd /tmp/
git clone https://github.com/<collaborator>/planets.git
git remote -v
```

----

### Make a collaborative change

**as the *collaborator* **

* Add a file called `pluto.txt` - (content your own)

**Live Presentation**

```
cd planets
nano pluto.txt
git add pluto.txt
git commit -m "Notes on Pluto"
git push origin master
```

----

### Pull a collaborator's change

**as the *owner* **

* Change back to your **own** repository
  * Check with `git remote -v`
* `git pull` the changes made by your collaborator

**Live Presentation**

```
cd ~/planets/
git pull origin master
```

---

## Resolving `git` conflicts

----

### Learning objectives

* Understand what conflicts are, and when they occur
* To be able to resolve conflicts resulting from a merge

----

### Why conflicts occur

* People working in parallel
  * different changes to same part of a file
  * not keeping local repo in sync before making local changes
  * not keeping remote repo in sync after making local changes
* `git pull` before working; `git push` when done

----

### Seriously, `git push` when done…

![A sign: In case of fire 1. git commit, 2. git push, 3. leave building](img/git_fire_notice.jpg)

----

### Let's make a conflict

**in your pairs**

* As the *owner*: add a line to `mars.txt`
  * Commit and push the change

**then**
  
* As the *collaborator*: add a line to `mars.txt`
  * Commit and push the change

**Live Presentation**

```
cd ~/planets
nano mars.txt
git push origin master
cd /tmp/planets
nano mars.txt
git push origin master
```

----

### The conflict message

```
To https://github.com/<collaborator>/planets.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'https://github.com/<collaborator>/planets.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

----

### The conflicting changes

![Three text files. At the top is the original, below this are two versions with conflicting changes. Arrows point to a question mark: how will we resolve this?](img/conflict.png)

----

### Resolving a conflict

* `git` detects overlapping changes
  * `git` defers to humans for how to resolve: **communicate**!
  
* To resolve:
  * *pull* remote changes
  * *merge* changes into our working copy
  * *push* the merged changes
  
**Live Presentation**

---

## Wrapping up

* GitHub/version control can be an open electronic lab book as part of Open Science workflows
  * Collect data - store in OA repository (Zenodo/FigShare)
  * Use GitHub to store work in progress: analysis lab book
  * Post preprint to (Bio)arXiv
* Even if you don't work openly, it's more reproducible (and auditable)

----

### You're ready to leave this behind…

![PhD comic: A directory listing with filenames like data_2010.05.28_test.dat, data_2010.05.28_re-test.dat, data_2010.05.28_re-re-test.dat, data_2010.05.28_calibrate.dat, data_2010.05.29_aaarrrgh.dat, data_2010.05.29_WTF.dat, data_2010.05.29_USETHISONE.dat](img/phd052810s.png)
