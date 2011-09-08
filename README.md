# TrollScript

Because [Brainfuck](http://en.wikipedia.org/wiki/Brainfuck) is so last year, right?

## DESCRIPTION

TrollScript is basically an _esoteric_ dialect of Brainfuck. Why did I make it I hear you ask? Because I had some free time.

Interpreter is based on [this gist I found](https://gist.github.com/69910) hacked to run TrollScript instead.

## INSTALLATION

Just kidding, none needed!

Oops, it's a [rubygem now](https://rubygems.org/gems/trollscript).

`gem install trollscript`

## USAGE

It's so simple even a troll could do it: `trollscript path/to/script.troll`

### The Language

As it's based on Brainfuck, it's fairly simple (lol?) to understand and use.
The eight operators from Brainfuck are simply replaced with TrollScript
trigraphs. Also TrollScript scripts begin with `tro` and end with `ll.`.

* `>` is `ooo` - increment the data pointer (to point to the next cell to the right)
* `<` is `ool` - decrement the data pointer (to point to the next cell to the left)
* `+` is `olo` - increment (increase by one) the byte at the data pointer
* `-` is `oll` - decrement (decrease by one) the byte at the data pointer
* `.` is `loo` - output a character, the ASCII value of which being the byte at the data pointer
* `,` is `lol` - accept one byte of input, storing its value in the byte at the data pointer
* `[` is `llo` - if the byte at the data pointer is zero, then instead of moving the instruction pointer forward to the next command, jump it forward to the command after the matching `]` command
* `]` is `lll` - if the byte at the data pointer is nonzero, then instead of moving the instruction pointer forward to the next command, jump it back to the command after the matching `[` command

## CONTRIBUTE

Here's the most direct way to get your work merged into the project:

1. Fork the project
2. Clone down your fork
3. Create a feature branch
4. Hack away and add tests. Not necessarily in that order
5. Make sure everything still passes by running tests
6. If necessary, rebase your commits into logical chunks, without errors
7. Push the branch up
8. Send a pull request for your branch

**Fuck that**

Just send any pull requests willy-nilly!

## LICENSE

Do What The Fuck You Want To Public License
