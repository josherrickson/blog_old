# Note that below, `open` occurs before the server is started. This is because
# the `open` would never be called if it happened afterwards. As soon as the
# server starts, the `open` will resolve, so reload if needed
.PHONY:preview
preview:
	@open http://localhost:1313/blog/posts
	@hugo server -D -d docs

.PHONY:preview-no-drafts
preview-no-drafts:
	@open http://localhost:1313/blog/posts
	@hugo server -d docs


.PHONY:new-post
new-post:
ifdef title
	@hugo new posts/$(title).md
	@emacs content/posts/$(title).md
else
	@echo "pass \`title=mytitle\` to create new post"
endif
