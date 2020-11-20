# [Nightwriter](https://backend.turing.io/module1/projects/night_writer/)

## Turing Mod 1 Independent Project
Program for translating alphabetical characters into Braille and vice versa. Writer and reader runner files are used to perform the translations, when running these files 2 additional files are given from the command line, the first contains text to be translated and a new file in which the translation will be written.

## Instructions

### English alphabet to Braille:

run the writer runner file with provided text file as input and empty file that will contain translated braille

`$ ruby ./writer_runner.rb fixtures/lyrics.txt braille.txt`

You will see a confirmation message in your terminal indicating that 'braille.txt' file was created which holds a braille-like translation of the original english text.

### Braille to English alphabet:

Run the reader runner file with provided text(braille) file as input and empty file that will contain the translated english

`$ ruby ./reader_runner.rb braille.txt original_message.txt`

You will see a confirmation message in your terminal indicating that 'original_message.txt' file was created which holds an english translation of the braille from 'baille.txt'. The contents of 'fixtures/lyrics.txt' and 'original_message.txt' are identical.

## Development

