// Reusable code used across extrusions library files
//
// Copyright (c) 2020 Cuban.Tech

module extrusion_from_file(file_path, length, layer=undef) {
    color("gray")
    linear_extrude(length)
    import(file_path, layer=layer);
}

