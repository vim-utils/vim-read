# vim-read

Make Vim **read text** out loud!

(Works on OSX only)

### About

This plugin uses the `say` OSX command and makes it nice to use from Vim.

Features:

- convenient (but non-intrusive) mappings
- reads in the **background** so you can actively use Vim while listening
- ability to stop reading at any moment
- makes sure only one voice is reading at the time, no overlay
- quitting Vim stops reading

### Mappings

- `yr<motion>` - read operator (mnemonic for: "You Read <motion>")
- `yrr` - read the current line
- `yrs` - stop reading (mnemonic for: "You Read Stop")

Visual mode mappings:

- `CTRL-R` - reads visual selection

### Use scenarios

Situations when I use this plugin:

- checking long program input I had to type in manually, example: a long range
  of numbers that are an input for the algorithm (`0 9 1 -4 2 11 4 8 -3 0 ...`)
- reading an email so I can focus on how it sounds

### Installation

Just use your favorite plugin manager.

### License

[MIT](LICENSE.md)
