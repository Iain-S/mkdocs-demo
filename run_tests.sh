#!/bin/bash
#
# Run code-style and spelling checks

# Keep track of the exit code of each test
status=0

# [optional] Check Markdown coding style with Ruby's markdown lint
# https://github.com/markdownlint/markdownlint
if ! command -v mdl &> /dev/null
then
  echo "Skipping markdown lint..."
else
  echo "Running markdown lint..."
  # With --git-recurse, mdl only checks version controlled files
  mdl --git-recurse --style mdl_style.rb ./
  status=$((status+$?))
fi

# [optional] Check Bash coding style with shellcheck
# https://github.com/koalaman/shellcheck
if ! command -v shellcheck &> /dev/null
then
  echo "Skipping shellcheck..."
else
  echo "Running shellcheck..."
  shellcheck ./*.sh
  status=$((status+$?))
fi

# [optional] Check spelling in .md files with hunspell
if ! command -v hunspell &> /dev/null
then
  echo "Skipping hunspell..."
else
  echo "Running hunspell..."

  # In case there are no sub-directories of docs/
  # See also https://github.com/koalaman/shellcheck/wiki/SC2044
  shopt -s globstar nullglob

  # Spellcheck each file in docs/
  for filename in docs/**/*.md
  do
    # If there is more than one spelling mistake...
    if [ "$(hunspell -d en_GB -p project.dict -l "$filename" | wc -l)" -gt 0 ]
    then
      # ...increment the error counter and show the misspelt words
      status=$((status+1))
      hunspell -d en_GB -p project.dict -l "$filename"
    fi
  done
fi

# See https://docs.github.com/en/actions/creating-actions/creating-a-docker-container-action
time=$(date)
echo "::set-output name=time::$time"
echo ""

if [ $status -eq 0 ]
then
  echo "All tests passed"
  exit 0
else
  echo "Not all tests passed" >&2
  exit 1
fi

