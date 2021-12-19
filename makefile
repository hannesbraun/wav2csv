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
	mkdir -p dist
	# wav2csv
	env GOOS=darwin GOARCH=amd64 go build -o dist/wav2csv-darwin-amd64 cmd/wav2csv/wav2csv.go
	env GOOS=freebsd GOARCH=amd64 go build -o dist/wav2csv-freebsd-amd64 cmd/wav2csv/wav2csv.go
	env GOOS=freebsd GOARCH=386 go build -o dist/wav2csv-freebsd-386 cmd/wav2csv/wav2csv.go
	env GOOS=freebsd GOARCH=arm go build -o dist/wav2csv-freebsd-arm cmd/wav2csv/wav2csv.go
	env GOOS=linux GOARCH=386 go build -o dist/wav2csv-linux-386 cmd/wav2csv/wav2csv.go
	env GOOS=linux GOARCH=amd64 go build -o dist/wav2csv-linux-amd64 cmd/wav2csv/wav2csv.go
	env GOOS=linux GOARCH=arm go build -o dist/wav2csv-linux-arm cmd/wav2csv/wav2csv.go
	env GOOS=linux GOARCH=arm64 go build -o dist/wav2csv-linux-arm64 cmd/wav2csv/wav2csv.go
	env GOOS=linux GOARCH=ppc64 go build -o dist/wav2csv-linux-ppc64 cmd/wav2csv/wav2csv.go
	env GOOS=linux GOARCH=ppc64le go build -o dist/wav2csv-linux-ppc64le cmd/wav2csv/wav2csv.go
	env GOOS=linux GOARCH=mips go build -o dist/wav2csv-linux-mips cmd/wav2csv/wav2csv.go
	env GOOS=linux GOARCH=mipsle go build -o dist/wav2csv-linux-mipsle cmd/wav2csv/wav2csv.go
	env GOOS=linux GOARCH=mips64 go build -o dist/wav2csv-linux-mips64 cmd/wav2csv/wav2csv.go
	env GOOS=linux GOARCH=mips64le go build -o dist/wav2csv-linux-mips64le cmd/wav2csv/wav2csv.go
	env GOOS=netbsd GOARCH=amd64 go build -o dist/wav2csv-netbsd-amd64 cmd/wav2csv/wav2csv.go
	env GOOS=netbsd GOARCH=386 go build -o dist/wav2csv-netbsd-386 cmd/wav2csv/wav2csv.go
	env GOOS=netbsd GOARCH=arm go build -o dist/wav2csv-netbsd-arm cmd/wav2csv/wav2csv.go
	env GOOS=openbsd GOARCH=amd64 go build -o dist/wav2csv-openbsd-amd64 cmd/wav2csv/wav2csv.go
	env GOOS=openbsd GOARCH=386 go build -o dist/wav2csv-openbsd-386 cmd/wav2csv/wav2csv.go
	env GOOS=openbsd GOARCH=arm go build -o dist/wav2csv-openbsd-arm cmd/wav2csv/wav2csv.go
	env GOOS=solaris GOARCH=amd64 go build -o dist/wav2csv-solaris-amd64 cmd/wav2csv/wav2csv.go
	env GOOS=windows GOARCH=amd64 go build -o dist/wav2csv-windows-amd64.exe cmd/wav2csv/wav2csv.go
	env GOOS=windows GOARCH=386 go build -o dist/wav2csv-windows-386.exe cmd/wav2csv/wav2csv.go
	# csv2wav
	env GOOS=darwin GOARCH=amd64 go build -o dist/csv2wav-darwin-amd64 cmd/csv2wav/csv2wav.go
	env GOOS=freebsd GOARCH=amd64 go build -o dist/csv2wav-freebsd-amd64 cmd/csv2wav/csv2wav.go
	env GOOS=freebsd GOARCH=386 go build -o dist/csv2wav-freebsd-386 cmd/csv2wav/csv2wav.go
	env GOOS=freebsd GOARCH=arm go build -o dist/csv2wav-freebsd-arm cmd/csv2wav/csv2wav.go
	env GOOS=linux GOARCH=386 go build -o dist/csv2wav-linux-386 cmd/csv2wav/csv2wav.go
	env GOOS=linux GOARCH=amd64 go build -o dist/csv2wav-linux-amd64 cmd/csv2wav/csv2wav.go
	env GOOS=linux GOARCH=arm go build -o dist/csv2wav-linux-arm cmd/csv2wav/csv2wav.go
	env GOOS=linux GOARCH=arm64 go build -o dist/csv2wav-linux-arm64 cmd/csv2wav/csv2wav.go
	env GOOS=linux GOARCH=ppc64 go build -o dist/csv2wav-linux-ppc64 cmd/csv2wav/csv2wav.go
	env GOOS=linux GOARCH=ppc64le go build -o dist/csv2wav-linux-ppc64le cmd/csv2wav/csv2wav.go
	env GOOS=linux GOARCH=mips go build -o dist/csv2wav-linux-mips cmd/csv2wav/csv2wav.go
	env GOOS=linux GOARCH=mipsle go build -o dist/csv2wav-linux-mipsle cmd/csv2wav/csv2wav.go
	env GOOS=linux GOARCH=mips64 go build -o dist/csv2wav-linux-mips64 cmd/csv2wav/csv2wav.go
	env GOOS=linux GOARCH=mips64le go build -o dist/csv2wav-linux-mips64le cmd/csv2wav/csv2wav.go
	env GOOS=netbsd GOARCH=amd64 go build -o dist/csv2wav-netbsd-amd64 cmd/csv2wav/csv2wav.go
	env GOOS=netbsd GOARCH=386 go build -o dist/csv2wav-netbsd-386 cmd/csv2wav/csv2wav.go
	env GOOS=netbsd GOARCH=arm go build -o dist/csv2wav-netbsd-arm cmd/csv2wav/csv2wav.go
	env GOOS=openbsd GOARCH=amd64 go build -o dist/csv2wav-openbsd-amd64 cmd/csv2wav/csv2wav.go
	env GOOS=openbsd GOARCH=386 go build -o dist/csv2wav-openbsd-386 cmd/csv2wav/csv2wav.go
	env GOOS=openbsd GOARCH=arm go build -o dist/csv2wav-openbsd-arm cmd/csv2wav/csv2wav.go
	env GOOS=solaris GOARCH=amd64 go build -o dist/csv2wav-solaris-amd64 cmd/csv2wav/csv2wav.go
	env GOOS=windows GOARCH=amd64 go build -o dist/csv2wav-windows-amd64.exe cmd/csv2wav/csv2wav.go
	env GOOS=windows GOARCH=386 go build -o dist/csv2wav-windows-386.exe cmd/csv2wav/csv2wav.go

.PHONY: all clean dist
