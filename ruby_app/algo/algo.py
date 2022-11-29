from modules.helper import get_pdfs, temp_dir, pre_process, post_process
from modules.BB import Bounding_Box_Algorithm as process
import os
import sys

PATH = sys.argv[1]

PATH = "storage/" + PATH[0] + PATH[1] + "/" + PATH[2] + PATH[3]
temp_dir(PATH,0)
print("STARTED")
for pdf in get_pdfs(PATH):
    os.rename(PATH + "/" + pdf,PATH + "/" + pdf + '.pdf')
    pre_process(PATH, (PATH + "/" + pdf + '.pdf')) # Convert each page of PDF to images
    print("PRE-DONE")
    process(PATH) # Write bounding box on each image
    print("PROCESS DONE")
    post_process(PATH,pdf + '.pdf') # Convert images back into pdf
    print("POST-DONE")
    temp_dir(PATH,2)
    os.rename(PATH + "/" + pdf + ".pdf",PATH + "/" + pdf)
print("ENDED")
