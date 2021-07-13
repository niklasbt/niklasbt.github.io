# Makefile for easy git commits
# Usage: make git t="Title of commit" b="Body of commit"

git:
	git add .
	git commit -m "$t" -m "$b"
	git push -u origin main
