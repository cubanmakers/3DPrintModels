
import Part,Mesh,os

def save_folder_stl(folder):
    # first we check for filenames that contain .stp, .step, .igs or .iges
    cadfiles = []
    for f in os.listdir(folder):
        for ext in [".stp", ".step", ".igs", ".iges"]:
            if f.lower().endswith(ext):
                cadfiles.append((folder+os.sep+f, ext))
                break
    if not cadfiles:
        print("No step or iges files found in the given folder")
    for f,ext in cadfiles:
        try:
            s = Part.read(f)
            stl = f.replace(ext,'.stl')
            m=Mesh.Mesh()
            m.addFacets(s.tessellate(0.001))
            m.write(stl)
        except Exception as e:
            print(e)
