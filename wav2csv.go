package main

import (
	"bufio"
	"flag"
	"fmt"
	"github.com/youpy/go-wav"
	"io"
	"os"
)

func main() {
	inPath := flag.String("in", "", "wav file to read")
	outPath := flag.String("out", "out.csv", "csv output file")
	flag.Parse()

	in, err := os.Open(*inPath)
	if err != nil {
		panic(err)
	}
	reader := wav.NewReader(in)
	defer in.Close()

	out, err := os.Create(*outPath)
	if err != nil {
		panic(err)
	}
	defer out.Close()
	bufout := bufio.NewWriter(out)

	for {
		samples, err := reader.ReadSamples()
		if err == io.EOF {
			break
		}

		for _, sample := range samples {
			ch0 := fmt.Sprintf("%f", reader.FloatValue(sample, 0))
			ch1 := fmt.Sprintf("%f", reader.FloatValue(sample, 1))
			_, err := bufout.WriteString(ch0 + "," + ch1 + "\n")
			if err != nil {
				panic(err)
			}
		}
	}
}
