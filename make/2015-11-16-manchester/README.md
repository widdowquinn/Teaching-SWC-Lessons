# README.md - codima_lessons/make

## Notes on running through the lesson

* When using `recording-script.sh`, have `nano` or other editors open in a second terminal window, to avoid polluting the output written to the website.
* I'm going to need to have slides, and two terminal windows. 
* Slides should show the commands being used, with a bit of explanation (not too much, though) - these should complement the interactive/live coding at the prompt

## Running the slides

* Slides are written in Markdown, for use with [`reveal-md`](https://github.com/webpro/reveal-md) as a quick-and-dirty-but-clean-looking solution.
* The slides can be run from this directory with:

```
$ reveal-md slides.md --theme=white
```

* The `reveal.js` themes with white backgrounds work best, as the included `.png`s currently have white backgrounds. These could conceivably be redone with transparent backgrounds.