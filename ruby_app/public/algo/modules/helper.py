import os
from pdf2image import convert_from_path
from PIL import Image

def post_process(path,pdf):
    pdf_list = []
    for file in os.listdir(os.path.join(path, "TEMP")):
        if "post" in file:
            pdf_list.append(file)
    pdf_list.sort()
    pro_list = []
    cover = Image.open(os.path.join(path, "TEMP") + "/" + pdf_list[0]).convert('RGB')
    pdf_list.pop(0)
    for x in pdf_list:
        pro_list.append(Image.open(os.path.join(path, "TEMP") + "/" + x).convert('RGB'))
    cover.save(os.path.join(path, "FIN") + "/" + pdf, save_all=True, append_images=pro_list)


def pre_process(path,pdf):
    pages = convert_from_path(pdf, 350)

    i = 1
    for page in pages:
        image_name = os.path.join(path, "TEMP") + "/pre_process_" + str(i) + ".jpg"
        page.save(image_name, "JPEG")
        i = i+1

def get_pdfs(path):
    return os.listdir(path)

def temp_dir(path, switch):
    if switch == 0: # Generate Structure
        os.mkdir(os.path.join(path, "TEMP"))
        os.mkdir(os.path.join(path, "FIN"))
    elif switch == 1: # Iteration Clean
        for x in os.listdir(os.path.join(path, "TEMP")):
            try:
                os.remove(os.path.join(path, "TEMP") + "/" + x)
            except:
                continue
    elif switch == 2: # Deep clean
        temp_dir(path,1)
        os.rmdir(os.path.join(path, "TEMP"))
        for x in os.listdir(path):
            if x.endswith('.pdf'):
                os.remove(path + "/" + x)
        for x in os.listdir(os.path.join(path, "FIN")):
            if x.endswith('.pdf'):
                os.rename(os.path.join(path, "FIN") + "/" + x,path + "/" + x)
                try: 
                    os.remove(os.path.join(path, "FIN") + "/" + x)
                except:
                    continue
        os.rmdir(os.path.join(path, "FIN"))
