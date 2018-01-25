.PHONY: build
build: deploycontainer
	git submodule update --init --recursive
	mkdir -p gitit/bin
	cd gitit && stack install --local-bin-path bin
	rm -r dist
	mkdir dist
	cp -r gitit/bin dist/
	cp -r gitit/data dist/
	mkdir -p dist/extra
	cp dist/data/post-update dist/extra/
	cp gitit/README.markdown ./dist/
	docker build -t philonous/gitit .

.PHONY: push
push: build
	docker push philonous/gitit

.PHONY: deploycontainer
deploycontainer:
	cd deployimage && docker-build
