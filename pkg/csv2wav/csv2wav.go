package csv2wav

import (
	"bufio"
	"fmt"
	"github.com/youpy/go-wav"
	"log"
	"math"
	"os"
	"strconv"
	"strings"
)

func Csv2Wav(config Config) {
	// Csv file reader
	if config.Verbose {
		fmt.Println("Input file:", config.InPath)
	}

	in, err := os.Open(config.InPath)
	if err != nil {
		panic(err)
	}
	defer func(in *os.File) {
		err := in.Close()
		if err != nil {
			panic(err)
		}
	}(in)
	scanner := bufio.NewScanner(in)

	// Calculate amplification and offset
	amp := config.Amplification * (math.Pow(2, float64(config.BitDepth-1)) - 1)
	offset := config.Offset

	var sample1 float64
	var sample2 float64
	var samples []wav.Sample
	for scanner.Scan() {
		line := scanner.Text()
		channels := strings.Split(line, ",")

		sample1, err = strconv.ParseFloat(channels[config.Channel1], 64)
		if err != nil {
			panic(err)
		}
		if config.Channel2 >= 0 {
			sample2, err = strconv.ParseFloat(channels[config.Channel2], 64)
			if err != nil {
				panic(err)
			}
		} else {
			sample2 = sample1
		}

		sample1 -= offset
		sample2 -= offset

		sample1 *= amp
		sample2 *= amp

		samples = append(samples, wav.Sample{Values: [2]int{int(sample1), int(sample2)}})
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	// Wav output
	if config.Verbose {
		fmt.Println("Output file:", config.OutPath)
	}
	out, err := os.Create(config.OutPath)
	if err != nil {
		panic(err)
	}
	defer func(out *os.File) {
		err := out.Close()
		if err != nil {
			panic(err)
		}
	}(out)
	bufout := bufio.NewWriter(out)
	writer := wav.NewWriter(bufout, uint32(len(samples)), 1, uint32(config.SamplingRate), config.BitDepth)
	err = writer.WriteSamples(samples)
	if err != nil {
		panic(err)
	}

	fmt.Println("done")
}
