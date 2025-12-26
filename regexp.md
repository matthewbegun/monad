# regular expressions of interest

## transcripts

### content

Header number, timecode, and speaker's first name for `vtt` transcripts 
: `^(?:\d+\s*\n)?\d{2}:\d{2}:\d{2}\.\d{3}\s*-->\s*\d{2}:\d{2}:\d{2}\.\d{3}.*\n(?:([A-Za-z]+):)?`

Header number, timecode, and newline for `vtt` transcripts 
: `^(?:\d+\s*\n)?\d{2}:\d{2}:\d{2}\.\d{3}\s*-->\s*\d{2}:\d{2}:\d{2}\.\d{3}.*\n?|^\d+\s*\n`

- nb : [python script to automate yt -> text](https://gist.github.com/glasslion/b2fcad16bc8a9630dbd7a945ab5ebf5e#file-vtt2text-py)

### filenames

Identify sequence like _-nnnnnn_ (hyphen followed by 6 digits) in string
: `-\d{6}\b`
