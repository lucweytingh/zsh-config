alias python="python3"

alias mvtoparent="find . -mindepth 2 -type f -exec mv {} . \;"

alias cptoparent="find . -mindepth 2 -type f -exec cp {} . \;"

alias remsubprefix="find . -mindepth 1 -type f -exec rename -v 's/\d+ - //' {} \;"

alias resample="lame --resample 44.1 -b 256"

sa () {
    source $1/bin/activate
    # export PYTHONPATH=$(pwd):\$PYTHONPATH
}

pa () {
    source $1/bin/activate
}

alias ca="conda activate"
alias ci="conda install"
alias cof="conda env create -f"
alias coc="conda create -n"
alias cod="conda deactivate"
alias coe="conda info --envs"
alias pis="pip install -e ."
alias pir="pip install -r requirements.txt"

# sudo apt install
alias sai="sudo apt install"

# Not on system
# alias round_img="python3 ~/.emacs.d/jpg2rounded_png.py"
# Create virtualenv
# mkvirtualenv djangoproject

# then
# workon djangoproject

alias audioconvert="lame -b 128"

alias fixexecutable="sed -i '1 s/^\xef\xbb\xbf//'"

makeorg () {
    pandoc $1 -o ${1%.*}.org
}

compress_video () {
    ffmpeg -i $1 -vcodec h264 -acodec mp2 ${1%.*}_compressed.mp4
}

compress_all () {
    for file in *.mov; do
        ffmpeg -i "$file" -vcodec h264 "${file%.*}.mp4"
    done
}

# Function to only download some contents of git
# example: git_sparse_clone https://github.com/path local-dirname git/local/path
# Create a directory called local-dirname.
# Perform a sparse clone of the repository into local-dirname.
# Download only the contents of the git/local/path subdirectory.
# You can also specify multiple subdirectories

function git_sparse_clone() (
  rurl="$1" localdir="$2" && shift 2

  mkdir -p "$localdir"
  cd "$localdir"

  git clone -n --depth=1 --filter=tree:0 "$rurl" .

  git sparse-checkout init --no-cone
  # Loops over remaining args
  for i; do
    git sparse-checkout set "$i"
  done

  git checkout
)
