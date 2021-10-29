#!/bin/bash

echo "Installing isort..."
pip install isort

echo "Getting current branch name..."
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "Current branch is '$CURRENT_BRANCH'"

MERGE_BASE=$(git merge-base $CURRENT_BRANCH develop)
MODIFIED_FILES=$(git diff --name-only $CURRENT_BRANCH $MERGE_BASE)
echo "${#MODIFIED_FILES[@]} file(s) were modified in this branch."


for FILE in $MODIFIED_FILES
do
    echo "Formatting file '$FILE'..."
    OUTPUT=$(isort $FILE \
        --profile black \
        -m 3 \
        -tc \
        -q \
        )
    echo "Done!"
done
