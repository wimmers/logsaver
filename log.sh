prefix="scratch/logs"

for last; do true; done
filename="${last##*/}"

gitshortdesc="$(git describe --abbrev=7 --dirty --always --tags)"
gitdesc=$(git describe --dirty --always --tags --all --long)

dir=$prefix/$gitshortdesc

if [ ! -d $dir ]; then
    mkdir -p $dir
fi

filename=$dir/$filename.log

if [ -f $filename ]; then
    echo "File already exists: $filename"
    i=1
    while [ -f $filename.$i ]; do
        i=$(($i+1))
    done
    filename=$filename.$i
fi

echo "Writing to: $filename"

# This variant will first read the whole output before writing it to the file.
#(time "$@") 2>&1 | echo "git: $gitdesc\n> $@\n$(cat -)" > $filename

# This should continously write to the file.
(time "$@") 2>&1 | (echo "git: $gitdesc\n> $@" && cat -) > $filename