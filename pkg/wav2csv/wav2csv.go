package wav2csv

import (
	"bufio"
	"fmt"
	"github.com/youpy/go-wav"
	"io"
	"os"
)

func Wav2Csv(inPath, outPath string, verbose bool) {
	// Wav file reader
	if verbose {
		fmt.Println("Input file:", inPath)
	}

	in, err := os.Open(inPath)
	if err != nil {
		panic(err)
	}
	defer func(in *os.File) {
		err := in.Close()
		if err != nil {
			panic(err)
		}
	}(in)
	reader := wav.NewReader(in)

	// Buffered csv output
	if verbose {
		fmt.Println("Output file:", outPath)
	}

	out, err := os.Create(outPath)
	if err != nil {
		panic(err)
	}
	defer func(out *os.File) {
		err := out.Close()
		if err != nil {
			panic(err)
		}
	}(out)
	bufOut := bufio.NewWriter(out)

	format, err := reader.Format()
	if err != nil {
		panic(err)
	}
	channels := format.NumChannels
	if verbose {
		fmt.Println("WAVE format:")
		fmt.Println("    Channels:", channels)
		fmt.Println("    Sample rate:", format.SampleRate, "Hz")
	}

	fmt.Print("Converting...")
	for {
		// Reading samples
		samples, err := reader.ReadSamples()
		if err == io.EOF {
			break
		}

		// Iterate over given samples
		for _, sample := range samples {
			row := ""

			// Iterate over channels
			for i := uint16(0); i < channels; i++ {
				if i == 0 {
					row += fmt.Sprintf("%f", reader.FloatValue(sample, uint(i)))
				} else {
					row += fmt.Sprintf(",%f", reader.FloatValue(sample, uint(i)))
				}
			}
			row += "\n"

			// Write row to file
			_, err := bufOut.WriteString(row)
			if err != nil {
				panic(err)
			}
		}
	}

	fmt.Println("done")
}
