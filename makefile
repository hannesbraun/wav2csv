all: wav2csv.go go.mod go.sum
	go build .

clean:
	rm -f wav2csv
	rm -rf dist/

dist: wav2csv.go go.mod go.sum
	mkdir -p dist
	env GOOS=darwin GOARCH=amd64 go build -o dist/wav2csv-darwin-amd64
	env GOOS=freebsd GOARCH=amd64 go build -o dist/wav2csv-freebsd-amd64
	env GOOS=freebsd GOARCH=386 go build -o dist/wav2csv-freebsd-386
	env GOOS=freebsd GOARCH=arm go build -o dist/wav2csv-freebsd-arm
	env GOOS=linux GOARCH=386 go build -o dist/wav2csv-linux-386
	env GOOS=linux GOARCH=amd64 go build -o dist/wav2csv-linux-amd64
	env GOOS=linux GOARCH=arm go build -o dist/wav2csv-linux-arm
	env GOOS=linux GOARCH=arm64 go build -o dist/wav2csv-linux-arm64
	env GOOS=linux GOARCH=ppc64 go build -o dist/wav2csv-linux-ppc64
	env GOOS=linux GOARCH=ppc64le go build -o dist/wav2csv-linux-ppc64le
	env GOOS=linux GOARCH=mips go build -o dist/wav2csv-linux-mips
	env GOOS=linux GOARCH=mipsle go build -o dist/wav2csv-linux-mipsle
	env GOOS=linux GOARCH=mips64 go build -o dist/wav2csv-linux-mips64
	env GOOS=linux GOARCH=mips64le go build -o dist/wav2csv-linux-mips64le
	env GOOS=netbsd GOARCH=amd64 go build -o dist/wav2csv-netbsd-amd64
	env GOOS=netbsd GOARCH=386 go build -o dist/wav2csv-netbsd-386
	env GOOS=netbsd GOARCH=arm go build -o dist/wav2csv-netbsd-arm
	env GOOS=openbsd GOARCH=amd64 go build -o dist/wav2csv-openbsd-amd64
	env GOOS=openbsd GOARCH=386 go build -o dist/wav2csv-openbsd-386
	env GOOS=openbsd GOARCH=arm go build -o dist/wav2csv-openbsd-arm
	env GOOS=solaris GOARCH=amd64 go build -o dist/wav2csv-solaris-amd64
	env GOOS=windows GOARCH=amd64 go build -o dist/wav2csv-windows-amd64.exe
	env GOOS=windows GOARCH=386 go build -o dist/wav2csv-windows-386.exe

.PHONY: all clean dist
