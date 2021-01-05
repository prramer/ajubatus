#! /usr/bin/env bash

# Builds the release files.  Must be run in the project's root directory.

release_name="ajubutus"
release_version=$1
error_missing_args=1
program_name=$0
empty_string=""
bundle_contents=(ChangeLog LICENSE README.md TODO source/*)

if [ "$release_version" == "$empty_string" ]; then
    echo "$program_name: Missing argument"
    echo "usage: $program_name version_number"
    exit $error_missing_args
fi

tar czf releases/${release_name}_v${release_version}.tar.gz ${bundle_contents[@]}
zip releases/${release_name}_v${release_version}.zip ${bundle_contents[@]}
