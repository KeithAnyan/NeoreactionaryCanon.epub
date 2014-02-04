ALL : NeoreactionaryCanon.epub NeoreactionaryCanon.mobi NeoreactionaryCanon.pdf

NeoreactionaryCanon.epub : epub
	rm -f NeoreactionaryCanon.epub
	zip -X0 NeoreactionaryCanon.epub mimetype
	zip -Xur9D NeoreactionaryCanon.epub META-INF/* OEBPS/*

NeoreactionaryCanon.mobi : NeoreactionaryCanon.epub
	rm -f NeoreactionaryCanon.mobi
	ebook-convert NeoreactionaryCanon.epub NeoreactionaryCanon.mobi

NeoreactionaryCanon.pdf : NeoreactionaryCanon.epub
	rm -f NeoreactionaryCanon.pdf
	ebook-convert NeoreactionaryCanon.epub NeoreactionaryCanon.pdf --embed-all-fonts --margin-left 24 --margin-top 24 --margin-right 24 --margin-bottom 24 --minimum-line-height 160

epub : mimetype META-INF/container.xml

mimetype :
	echo "application/epub+zip\c" > mimetype

META-INF/container.xml :
	mkdir -p META-INF
	echo "<?xml version=\"1.0\"?>" > META-INF/container.xml
	echo "<container version=\"1.0\" xmlns=\"urn:oasis:names:tc:opendocument:xmlns:container\">" >> META-INF/container.xml
	echo "	<rootfiles>" >> META-INF/container.xml
	echo "		<rootfile full-path=\"content.opf\" media-type=\"application/oebps-package+xml\"/>" >> META-INF/container.xml
	echo "	</rootfiles>" >> META-INF/container.xml
	echo "</container>" >> META-INF/container.xml

# Remove files that we created
clean : 
	rm -f mimetype
	rm -Rf META-INF
