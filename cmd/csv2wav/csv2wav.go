package main

import (
	"flag"
	"fmt"
	"github.com/hannesbraun/wav2csv/pkg/csv2wav"
	"strings"
)

const VERSION = "0.2.0"

func main() {
	fmt.Println("csv2wav", VERSION)
	fmt.Println("Copyright (c) 2021, Hannes Braun")
	fmt.Println()

	// Command line flags
	amplification := flag.Float64("amp", 1.0, "amplification factor")
	bitDepth := flag.Int("bitdepth", 16, "bit depth of the resulting audio file")
	channel1 := flag.Int("left", 0, "column number for left channel")
	channel2 := flag.Int("right", -1, "column number for right channel (negative values will produce a mono wav file with only the left channel)")
	inPath := flag.String("in", "", "csv file to read")
	offset := flag.Float64("offset", 0.0, "offset to subtract from the signal")
	outPath := flag.String("out", "out.wav", "wav output file")
	samplingRate := flag.Int("sampling", 44100, "sampling rate in Hz")
	verbose := flag.Bool("verbose", false, "verbose output")
	flag.Parse()

	// Validate bit depth
	if *bitDepth != 8 && *bitDepth != 16 && *bitDepth != 24 && *bitDepth != 32 {
		panic("Unsupported bit depth. Possible values are: 8, 16, 24, 32")
	}

	// Validate channel1
	if *channel1 < 0 {
		panic("left channel index has to be greater or equal to zero")
	}

	// Validate input path
	if len(strings.TrimSpace(*inPath)) == 0 {
		panic("Please specify an input file")
	}

	config := csv2wav.Config{
		Amplification: *amplification,
		BitDepth:      uint16(*bitDepth),
		Channel1:      *channel1,
		Channel2:      *channel2,
		InPath:        *inPath,
		Offset:        *offset,
		OutPath:       *outPath,
		SamplingRate:  *samplingRate,
		Verbose:       *verbose,
	}

	csv2wav.Csv2Wav(config)
}
