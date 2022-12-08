from bs4 import BeautifulSoup as bs4
import os
from shutil import copyfile
from essential_generators import DocumentGenerator
from fpdf import FPDF
import time

# try:
#   from googlesearch import search
# except ImportError:
#   print("No module named 'google' found")

def grabDocParts(doc, i):
  pdf = FPDF() #initialize a pdf object

  pdf.add_page(orientation="P") # add a page to the pdf

  pdf.set_font('Times', size=10) # set font

  # create the contents as strings
  greeting = doc.get('header')
  body = doc.get('body').get('par1')
  home = doc.get('home').get('par1')
  body1 = doc.get('body1').get('par1')
  contact = doc.get('contact')
  body2 = doc.get('body2').get('par1')

  # re-encode the charaacters for passing to the pdf output
  # solution found here: https://stackoverflow.com/questions/56761449/unicodeencodeerror-latin-1-codec-cant-encode-character-u2013-writing-to
  greeting = greeting.encode('latin-1', 'replace').decode('latin-1')
  body = body.encode('latin-1', 'replace').decode('latin-1')
  home = home.encode('latin-1', 'replace').decode('latin-1')
  body1 = body1.encode('latin-1', 'replace').decode('latin-1')
  contact = contact.encode('latin-1', 'replace').decode('latin-1')
  body2 = body2.encode('latin-1', 'replace').decode('latin-1')
  
  name = str(i+1) # name the pdfs sequentially: 1-1000
  pdf.cell(0, 5, txt=name, align='C', ln=1)  # add title to pdf in one cell

  # add pdf contents here, we can expand more as we need further test cases
  pdf.multi_cell(190, 5, txt=greeting, align='L')
  pdf.multi_cell(190, 5, txt=body, align='L')
  pdf.multi_cell(190, 5, txt=home, align='L')
  pdf.multi_cell(190, 5, txt=body1, align='R')
  pdf.multi_cell(190, 5, txt=contact, align='R')
  pdf.multi_cell(190, 5, txt=body2, align='R')                    

  pdfName = name + '.pdf'

  return pdf.output(pdfName, 'F')

def main():
  #list of pdf strings
  list = []
  # query = "term: Accounting Document filetype: pdf"
  # for j in search(query, tld="co.in", num=5, stop=5, pause=2): #lapse of 2 works with Google, too short, will throttle
  #   list.append(j)

  # query = "term: Collective Bargaining filetype: pdf"
  # for j in search(query, tld="co.in", num=5, stop=5, pause=2):
  #   list.append(j)
  
  # query = "term: cybersecurity filetype:pdf"
  # for j in search(query, tld="co.in", num=5, stop=5, pause=2):
  #   list.append(j)

  gen = DocumentGenerator() # define an object of the document generator

  gen.init_word_cache(10000)
  gen.init_sentence_cache(10000)

  def gen_body(): # gen_body returns 3 paragraph blocks
    return {
      'par1': gen.paragraph() + gen.paragraph() + gen.paragraph()
    }

  #define the template for the document
  template = {
    'header': 'sentence',
    'body': gen_body,
    'home': gen_body,
    'body2': gen_body,
    'body1': gen_body,
    'contact': 'sentence'
  }

  i = 0
  n = 10 #number of documents we want

  gen.set_template(template)
  documents = gen.documents(n)
  while i < n:
    grabDocParts(documents[n-1], i) 
    i = i+1

  # print(list)
  # dst = os.getcwd()+"\pdf" # Get the destination directory for creating the pdfs in
  # print("The destination is", dst)

if __name__ == "__main__":
  main()
