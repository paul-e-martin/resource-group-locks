#!/usr/bin/env bash
# .git/hooks/pre-commit
# https://www.reddit.com/r/git/comments/3o1tut/precommit_hook_to_make_sure_you_updated_the/
set -o nounset

# get git repository root
REPO_ROOT=$(git rev-parse --show-toplevel)
echo "Git repo is at $REPO_ROOT"

# check for changes in the repository
SITE_CHANGES=$(git status -s "$REPO_ROOT" | wc -l)
echo "Detected $SITE_CHANGES changes"

# if changes are detected
if [ "$SITE_CHANGES" -gt "0" ]; then
    echo "Checking to make sure package version was updated..."

    # check VERSION has already been updated
    VERSION_CHANGED=$(git diff HEAD -- VERSION)

    if [ -n "$VERSION_CHANGED" ]; then
        echo "VERSION was already updated!  Continuing..."
    else
        VERSION=$(cat "$REPO_ROOT/VERSION")

        # Extract the major, minor, and patch numbers
        major=$(echo $VERSION | cut -d '.' -f 1 | sed 's/[^0-9]*//g')
        minor=$(echo $VERSION | cut -d '.' -f 2 | sed 's/[^0-9]*//g')
        patch=$(echo $VERSION | cut -d '.' -f 3 | sed 's/[^0-9]*//g')

        # Increment the patch number
        patch=$((patch + 1))

        # Reconstruct the version string
        NEW_VERSION="v${major}.${minor}.${patch}"

        # Now, save the new version back to the file
        echo $NEW_VERSION >"$REPO_ROOT/VERSION"

        # Just for demonstration, show the new version
        echo "VERSION was updated to: $NEW_VERSION    Continuing..."

        # Add update to staging
        git add "$REPO_ROOT/VERSION"
    fi
fi
