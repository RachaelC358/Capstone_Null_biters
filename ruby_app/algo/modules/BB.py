from PIL import Image
import os
import pytesseract
from pytesseract import Output
import cv2

def Bounding_Box_Algorithm(path):

    for pdf_image in os.listdir(os.path.join(path, "TEMP")):
        img = cv2.imread(os.path.join(path, "TEMP") + "/" + pdf_image)

        d = pytesseract.image_to_data(img, output_type=Output.DICT)
        size = max(set(d['height']), key = d['height'].count) * 1.4
        n_boxes = len(d['level'])
        for i in range(n_boxes):
            if d['text'][i] == "" or d['text'][i] == " ":
                (x, y, w, h) = (d['left'][i], d['top'][i], d['width'][i], d['height'][i])
                if d['text'][i] == "":
                    if size <= h:
                        cv2.rectangle(img, (x, y), (x + w, y + h), (0, 255, 0), 2)

        cv2.imwrite(os.path.join(path, "TEMP") + "/" + pdf_image.replace("pre","post"),img)
