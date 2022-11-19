FROM ruby:3.0.4

RUN apt-get update && apt-get install -y nodejs npm python3 python3-pip poppler-utils tesseract-ocr

WORKDIR /app
COPY . .
RUN bundle install
RUN npm install pspdfkit

RUN pip3 install pytesseract
RUN pip3 install pillow
RUN pip3 install opencv-python
RUN pip3 install pytesseract
RUN pip3 install pdf2image

RUN chmod -R 777 /app/public/*

CMD ["bash", "start.sh"]
