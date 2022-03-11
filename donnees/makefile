CHR_FILES = \
 chr_M.fa chr_N.fa chr_O.fa chr_P.fa\
 chr_Q.fa chr_R.fa chr_S.fa chr_T.fa\
 chr_U.fa chr_V.fa chr_W.fa chr_X.fa

DB_FILES = espece_A.nsq espece_B.nsq
REF_FILES = espece_A.fa espece_B.fa

.PHONY: all clean

all: $(REF_FILES) $(CHR_FILES) $(DB_FILES)

chr_%.fa: generer_echant.py $(REF_FILES)
	python $< $* 9600 12800 128 256 > $@
	seqkit split -p 10 chr_$*.fa

espece_%.fa: generer_espece.py
	python $< $* 800 1200 900 1600 > $@

espece_%.nsq: espece_%.fa
	makeblastdb -in espece_$*.fa -dbtype nucl -out espece_$*

clean:
	rm -f *_*.fa espece_*.n??
	rm -rf chr_*.fa.split
