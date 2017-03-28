Automation and Make Exercises
=============================

Exercise 1 - write a new rule 
-----------------------------

Write a new rule for `last.dat`.

Update the `dats` rule.

Use a single tab when indenting the actions, not spaces!

`touch` all the `books/*.txt` files to update their time-stamps.

Re-run `make` and all the `.dat` files should be re-built.

Exercise 2 - change an action
------------------------------

Change the action of the `%.dat` rule so that the rule works. Use the
following special macros:

* `$@` is the target of the current rule.
* `$<` is the first dependency only.

Exercise 3 - use macros
-----------------------

Replace `wordcount.py` and `python wordcount.py` with the macros
`$(COUNT_SRC)` and `$(COUNT_EXE)`.

Exercise 4 - extend the Makefile to create jpgs
-----------------------------------------------

Add new rules, update existing rules, and add new macros to:

* Create `.jpg` files from `.dat` files using `plotcount.py`.
* Add the script and `.jpg` files to the archive.
* Remove all auto-generated files (`.dat`, `.jpg`, `analysis.tar.gz`).
