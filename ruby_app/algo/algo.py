from modules.helper import get_pdfs, temp_dir, pre_process, post_process
from modules.BB import Bounding_Box_Algorithm as process
import os
import sys
PATH1 = sys.argv[1]

PATH = "storage/" + PATH1[0] + PATH1[1] + "/" + PATH1[2] + PATH1[3]
temp_dir(PATH,0)
print("STARTED")
os.rename(PATH + "/" + PATH1,PATH + "/" + PATH1 + '.pdf')
pre_process(PATH, (PATH + "/" + PATH1 + '.pdf')) # Convert each page of PDF to images
print("PRE-DONE")
process(PATH) # Write bounding box on each image
print("PROCESS DONE")
post_process(PATH,PATH1 + '.pdf') # Convert images back into pdf
print("POST-DONE")
temp_dir(PATH,2)
os.rename(PATH + "/" + PATH1 + ".pdf",PATH + "/" + PATH1)
print("ENDED")
