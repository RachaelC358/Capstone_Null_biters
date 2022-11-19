require 'net/ftp'

module API
  module V1
    class Pdfs < Grape::API
      include API::V1::Defaults

      resource :pdfs do
        desc "Return all pdfs"
        get "" do
          Pdf.all
        end

      desc "Return a pdf"
        params do
          requires :id, type: String, desc: "ID of the pdf"
        end
        get ":id" do
          system("rm -rf public/pdf/*")
          pdf = Pdf.where(id: permitted_params[:id]).first!
          ftp = Net::FTP.new('10.10.10.30')
          ftp.login(user = "pdf_grunt", passwd = "supersecretpassword")
          ftp.getbinaryfile(pdf.filename, "public/pdf/" + pdf.filename)
          if (pdf.process_time == "0")
            p 'No Process Time'
            system('python3 algo/algo.py') # long-long programm
            pdf.process_time = "1"
            pdf.save!
            ftp.delete(pdf.filename)
            ftp.putbinaryfile("public/pdf/" + pdf.filename, pdf.filename)
          end
          ftp.quit()
          "pdf/" + pdf.filename
        end
      end
    end
  end
end
