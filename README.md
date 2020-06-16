
# 3D models for Fablab tools

This repository aggregates resources for people with very limited resources (like Cuban makers) to build their own 3D printers with the minimal number of components and material. Solutions cover a wide range of possibilities so that people can get started quickly according to eventual availability facing scarcity.

The key value of this repository are:

- A list of tools needed in a Fablab, both generic and serving to specific purposes
- A curated selection of parts, instructions and resources compiled across open source projects needed to build digital manufacturing tools
- Parametric designs of each tool including:
  * Detailed geometry of single parts
  * Bill of materials (a.k.a BOM)
  * Parameters for satisfying a wide range of models and product families tested and used in practice to assemble real machines
  * Parameters to position machine tool at a given spatial configuration

## Tools

The following tools might help in setting a Fablab up:

- 3D printers
  * [Prusa i3](https://github.com/cubanmakers/3DPrintModels/wiki/Prusa_i3)
    - [P35X70](https://github.com/cubanmakers/3DPrintModels/wiki/3D-printer:-P40X70) a DIY alternative using Al extrusions easy to buy in Cuba
    - [ANET A8 clone](https://github.com/cubanmakers/3DPrintModels/wiki/3D-printer:-ANET-A8-DIY.md) a DIY alternative using E2040 profiles, Marlin, and RAMPS
    - [CoreXY octanorm](https://github.com/cubanmakers/3DPrintModels/wiki/3D-printer:-CoreXY-Octanorm.md) implements a CoreXY mechanical system using Octanorm extrusion profiles for the frame.

## Parts

The following DIY parts may also be manufactured for assemblying machines.

- Bearing
- Extrusions
- LCD case
- Pulleys
- Spool holder

## Documentation

See [project wiki](https://github.com/cubanmakers/3DPrintModels/wiki) for further details.

## Dependencies

Some of the features implemented in this project require the following libraries installed in `OPENSCADPATH`:

- [NopSCADlib](https://github.com/nophead/NopSCADlib)

## Related projects

- [DIY RAMPS](https://github.com/cubanmakers/ramps-diy) board.

## Acknowledgements

Thanks to

- All contributors to this repository
- All contributors to the projects included as submodules under `vendor` sub-folder
- The respective authors of the files included under `assets/thing` sub-folder

