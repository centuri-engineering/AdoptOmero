
html:
	rm -Rf build_html
	mkdir build_html
	ln -s ../../reveal.js build_html
	cp -R images build_html
	pandoc -t revealjs \
		--from markdown+emoji \
		-V theme=solarized \
		-V background-image=images/FBI_bg.svg \
		-V background-color="#f9f9f9" \
		-s main.md \
		-o build_html/main.html \
		--slide-level 3 \
		--mathjax

publish:

	rsync -avvz -e 'ssh -p 8012' \
	--exclude=.git \
	--exclude=reveal.js \
	build_html/ \
	guillaume@centuri-engineering.univ-amu.fr:/var/www/AdoptOmero

beamer:
	rm -Rf build_pdf
	mkdir build_pdf
	cp main.md build_pdf
	cp -R images build_pdf
	cd build_pdf
	pandoc -t beamer --template /usr/share/pandoc/data/templates/default.latex \
		--pdf-engine lualatex --slide-level 3 main.md -o main.pdf
	cd ..

clean:
	rm -Rf build_html
	rm -Rf build_pdf
