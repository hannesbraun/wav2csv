package main

import (
	"flag"
	"fmt"
	"github.com/hannesbraun/wav2csv/pkg/wav2csv"
	"strings"
)

const VERSION = "0.2.0"

func main() {
	fmt.Println("wav2csv", VERSION)
	fmt.Println("Copyright (c) 2021, Hannes Braun")
	fmt.Println()

	// Command line flags
	inPath := flag.String("in", "", "wav file to read")
	outPath := flag.String("out", "out.csv", "csv output file")
	verbose := flag.Bool("verbose", false, "verbose output")
	flag.Parse()

	// Validate input path
	if len(strings.TrimSpace(*inPath)) == 0 {
		panic("Please specify an input file")
	}

	wav2csv.Wav2Csv(*inPath, *outPath, *verbose)
}
