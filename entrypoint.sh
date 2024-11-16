#!/bin/bash

output="/github/workspace/$2"
input="/github/workspace/$1"
drill_format="${3:-excellon}"
drill_units="${4:-mm}"
position_format="${5:-ascii}"
position_units="${6:-in}"

filename="$(basename -- "$input" .${input##*.})"

mkdir -p "$output"
kicad-cli pcb export gerbers -o "$output" "$input"

if [[ "$drill_format" == "excellon" || "$drill_format" == "gerber" ]]; then
    kicad-cli pcb export drill --format "$drill_format" --excellon-units "$drill_units" -o "$output" "$input"
fi

if [[ "$position_format" == "ascii" || "$position_format" == "csv" ]]; then
    kicad-cli pcb export pos --format "$position_format" --units "$drill_units" -o "$output/$filename.pos" "$input"
elif [[ "$position_format" == "gerber" ]]; then
    kicad-cli pcb export pos --format gerber --side front -o "$output/$filename.front.pos" "$input"
    kicad-cli pcb export pos --format gerber --side back -o "$output/$filename.back.pos" "$input"
fi