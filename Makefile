parent:
	cd .. && $(MAKE)

obtudes:
	notebooks build --root . --out ob --template templates/post.html -- nbs/*.html
