# Sbornik IP 20-21

Nainstalovat (archlinux, manjaro a pod):
- `pandoc`
- `pandoc-crossref`
- `texlive-most`
- `pdftk`

Pro pohodlí existuje Makefile s nasledujícími cíly:

- `make pdf` - vygeneruje přes pandoc a pdfunite `pdf`
- `make epub` - vygeneruje přes pandoc `epub`
- `make clean` - smaže vše co není zdroják
- `make help` - zobrazí všechny cíle v make

Všechny soubory `*.md` v adresáři `src` jsou součástí výsledku v alfanumerickém
pořadí. Soubory by se idelaně měli jmenovat `01-prvni-clanek.md`, `02-druhy.md`,
`03-treti-prispevek.md` a tak dále. Titulka musí být v adresáři `img`.
