package main

import (
	"flag"
	"fmt"
	"github.com/hannesbraun/wav2csv/pkg/wav2csv"
)

const VERSION = "0.1.2"

func main() {
	fmt.Println("wav2csv", VERSION)
	fmt.Println("Copyright (c) 2021, Hannes Braun")
	fmt.Println()

	// Command line flags
	inPath := flag.String("in", "", "wav file to read")
	outPath := flag.String("out", "out.csv", "csv output file")
	verbose := flag.Bool("verbose", false, "verbose output")
	flag.Parse()

	wav2csv.Wav2Csv(*inPath, *verbose, *outPath)
}
