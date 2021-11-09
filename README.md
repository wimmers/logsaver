# Logsaver

With logsaver you can automatically save the output of a shell command you run
to a file.
Logsaver will guess a folder name based on the current Git revision
and the command.
Additionally, it will prepend the output with the current Git revision
and the command string.
Finally, it will time the command and put the timings at the end of the output.

## Usage

Try:

```[sh]
$ log.sh <command> <args> <filename>
> Writing to: scratch/logs/<filename>.log
```

This should create a file called `<filename>.log` in a directory of the form
`scratch/logs/<gitshortref>.log`. Its contents should look like this:
```
git: <long Git commit info>
> <command> <args> <filename>
<output of command>

real	<...>
user	<...>
sys     <...>
```

Note that `<filename>` is a file argument which is given to `<command>` but
is also used to guess the filename.

## Installation

Clone the repository, mark `log.sh` as executable and symlink it somewhere
on your search path, e.g. by running:
```
$ chmod +x log.sh
$ ln -s $(pwd)/log.sh /usr/local/bin
```
