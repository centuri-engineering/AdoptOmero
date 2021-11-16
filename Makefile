
html:
	rm -Rf build_html
	mkdir build_html
	ln -s ../../reveal.js build_html
	cp -R images build_html
	pandoc -t revealjs -V theme=solarized -s main.md -o build_html/main.html --slide-level 3 --mathjax

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
	pandoc \
		-t beamer \
        --template template.beamer \
		--pdf-engine lualatex \
        --slide-level 3 \
        -o main.pdf \
        main.md
	cd ..

clean:
	rm -Rf build_html
	rm -Rf build_pdf
