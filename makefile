all: wav2csv csv2wav

wav2csv: cmd/wav2csv/wav2csv.go pkg/wav2csv/wav2csv.go go.mod go.sum
	go build cmd/wav2csv/wav2csv.go

csv2wav: cmd/csv2wav/csv2wav.go pkg/csv2wav/csv2wav.go pkg/csv2wav/config.go go.mod go.sum
	go build cmd/csv2wav/csv2wav.go

clean:
	rm -f wav2csv
	rm -f csv2wav
	rm -rf dist/

dist: cmd/wav2csv/wav2csv.go pkg/wav2csv/wav2csv.go cmd/csv2wav/csv2wav.go pkg/csv2wav/csv2wav.go pkg/csv2wav/config.go go.mod go.sum
	bash dist.sh

.PHONY: all clean dist
