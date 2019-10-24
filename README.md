# LearnApplescript

This repository is a bit of a mismash of scripts, examples, and book code that I'm using to learn Applescript.

# Purpose

Applescript can be very difficult to get into, depending on your background.  If you're a typical developer, and  have a few languages under your belt, then Applescript may be HARDER for you to pick up than someone who has little/no language experience.  This is largely due to the nature of code having multiple ways of being written, a less-than-traditional syntax, and the ordering of which it executes statements.  For me, Applescript has been more difficult than other languages I've picked up (and I'm at about 22 languages, including ones like Common Lisp).

Because of this, I wanted to create a central repository that contains a easy-to-understand structure code, many examples that I create based off my learning, and the code I write while working through the "Learn Applescript" book.  Please note that all the code here is NOT mine.  I do try and keep the sources I pull from in their original condition, including their info/copyright/etc.  My scripts are also clearly annotated with where it came from and author.

# Resources

## Learn Applescript 
This book was one of the few dedicated books I could find on Applescript.  I'm still going through it, but it's pretty decent.  Focuses on automation with programs that are installed by standard on OSX (Finder, iTunes, etc), and less about other programs.  But, it does explain how to read/parse through the Dictionary.

- Website: https://www.apress.com/us/book/9781430223610

## DevonThink
This code is located in the Examples/DevonThink directory.  This contains the Applescript code that comes included in DevonThink 3.  The reason for it being here, vs pointing one to there is that the original files are in .scpt format, which is a binary-like format, and difficult to parse/search.  This code has been converted to text (.applescript) with UNIX line endings, meaning searching in the repo, through grep, and so on is a lot easier when learning how to deal with it.  This directory also contains any forum examples that appear to do anything interesting.

- Website: https://www.devontechnologies.com/
- Forum: https://discourse.devontechnologies.com/c/devonthink/scripting

## DevonAgent

# Contributing

I welcome contributers to this repo.  Please feel free to create a fork, add your code, and create a pull request.  There's a few things I request though:
1) Try to keep with the general structure of the repo as much as possible.  If others contribute over time, we may create a more formal structure
2) Please try and annotate your code as you're typing it.  Use expressive names, try to keep it clear on what's going on, and in a way that parts of it can be used without the whole of the script.
3) Please submit your code IN PLAIN TEXT WITH UNIX LINEENDINGS.  This can be done when you save the script by selecting "text" as the option, and ensuring that the line endings are UNIX-based.  This is incredibly important because the OSX line endings play very poorly with github, and the .scpt-like files are useless to read outside of the script editor.
4) Please remember that this repo is designed for learning, and to be kind in your scripts in regard to complexity and having scripts "do too much"
