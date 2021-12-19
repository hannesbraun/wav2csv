#!/bin/bash
platforms=("darwin/amd64" "darwin/arm64" "freebsd/amd64" "freebsd/386" "freebsd/arm" "linux/386" "linux/amd64" "linux/arm" "linux/arm64" "linux/ppc64" "linux/ppc64le" "linux/mips" "linux/mipsle" "linux/mips64" "linux/mips64le" "netbsd/amd64" "netbsd/386" "netbsd/arm" "openbsd/amd64" "openbsd/386" "openbsd/arm" "solaris/amd64" "windows/amd64" "windows/386")
mkdir -p dist
for platform in "${platforms[@]}"
do
  platform_split=(${platform//\// })
	GOOS=${platform_split[0]}
	GOARCH=${platform_split[1]}
	wav2csv_name='wav2csv-'$GOOS'-'$GOARCH
	csv2wav_name='csv2wav-'$GOOS'-'$GOARCH
	if [ "$GOOS" = "windows" ]; then
		wav2csv_name+='.exe'
		csv2wav_name+='.exe'
	fi
	echo $platform
	env GOOS=$GOOS GOARCH=$GOARCH go build -o "dist/$wav2csv_name" cmd/wav2csv/wav2csv.go
	env GOOS=$GOOS GOARCH=$GOARCH go build -o "dist/$csv2wav_name" cmd/csv2wav/csv2wav.go
done
