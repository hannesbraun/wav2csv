package csv2wav

type Config struct {
	InPath        string
	OutPath       string
	SamplingRate  int
	Channel1      int
	Channel2      int
	Offset        float64
	Amplification float64
	BitDepth      uint16
	Verbose       bool
}
