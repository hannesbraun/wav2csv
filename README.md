# wav2csv/csv2wav

With this utility, you can convert a wav file to a csv file and vice versa.

## Building

Make sure to set `GO111MODULE` to `on`. Then run `make` in the root directory. This will produce the two binaries `wav2csv` and `csv2wav`.

## Running

### wav2csv

```bash
wav2csv -in audio.wav -out audio.csv
```

### csv2wav

The following is an example. Adjust the values to your needs (or leave them to their default values). There are also more parameters available. For more information, use the `-help` parameter.

```bash
csv2wav -in capture.csv -out recording.wav -sampling 96000 -offset 1.7 -amp 1.09
```

The resulting signal is calculated by subtracting the given `offset` (default is 0) and then amplifying with the given `amp` factor.
The result of this calculation should be a normalized signal with values between -1 and 1.

## License

Copyright (c) 2021, Hannes Braun

This software is released under the BSD 3-Clause License. For more information, see [LICENSE](LICENSE).
