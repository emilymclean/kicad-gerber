# kicad-gerber Action

Generates gerber & drill files for a specified PCB and places them in a specified directory

## Inputs

| Input              	| Required 	| Description                                                                                                       	| Default  	|
|--------------------	|----------	|-------------------------------------------------------------------------------------------------------------------	|----------	|
| `input-file`       	| ✅        	| The PCB to process                                                                                                	|          	|
| `output-directory` 	|          	| The directory in which to place the gerber & drill files                                                          	| gerber   	|
| `drill-format`     	|          	| The drill format to use. Options are gerber, excellon, and none                                                   	| excellon 	|
| `drill-units`      	|          	| The units to use for the drill file. Options are in, and mm. Does nothing if drill format is none or gerber       	| mm       	|
| `position-format`  	|          	| The position format to use. Options are gerber, csv, ascii, and none                                              	| none     	|
| `position-units`   	|          	| The units to use for the position file. Options are in, and mm. Does nothing if position format is none or gerber 	| in       	|

## Example usage
```
uses: emilymclean/kicad-gerber@v2
with:
  input-file: pcb.kicad_pcb
```
