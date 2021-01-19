#!/bin/bash

function md2docx()
{
    find . -type f -name '*.md' | rev | cut -d. -f2- | rev | xargs -I @ pandoc -o @.docx -f markdown -t docx @.md
}

function zip_docs()
{
    find . -type f -name '*.docx' | zip NC-Link_SDK_v1.0_API_docs.zip -@
}
