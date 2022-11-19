from modules.helper import get_pdfs, temp_dir, pre_process, post_process
from modules.BB import Bounding_Box_Algorithm as process
import os

PATH = "/app/public/pdf"

temp_dir(PATH,0)
print("STARTED")
for pdf in get_pdfs(PATH):
    if pdf.endswith(".pdf"):
        pre_process(PATH, (PATH + "/" + pdf)) # Convert each page of PDF to images
        print("PRE-DONE")
        process(PATH) # Write bounding box on each image
        print("PROCESS DONE")
        post_process(PATH,pdf) # Convert images back into pdf
        print("POST-DONE")
        temp_dir(PATH,1) # Clean temp directory

temp_dir(PATH,2)
print("ENDED")
