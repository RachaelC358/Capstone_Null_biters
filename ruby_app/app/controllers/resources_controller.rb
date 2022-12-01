class ResourcesController < ApplicationController
  def next_button
    session[:ID] = session[:ID] + 1
    if session[:ID] == Pdf.count()
      session[:ID] = 0
    end
    iid = session[:ID]
    @pdf = Pdf.where(id: iid).first!
    if (@pdf.process_time == "0")
      path = @pdf.pfile.blob.key
      system("python3 algo/algo.py " + path)
      while Dir.exist?('storage/' + path[0] + path[1] + '/' + path[2] + path[3] + '/FIN')
        sleep 1
      end
      @pdf.process_time = "1"
      @pdf.loading = "False"
      @pdf.save!
    end
    redirect_to "/"
  end
  def prev_button
    session[:ID] = session[:ID] - 1
    if session[:ID] == -1
      session[:ID] = Pdf.count() - 1
    end
    iid = session[:ID]
    @pdf = Pdf.where(id: iid).first!
    if (@pdf.process_time == "0")
      path = @pdf.pfile.blob.key
      system("python3 algo/algo.py " + path)
      while Dir.exist?('storage/' + path[0] + path[1] + '/' + path[2] + path[3] + '/FIN')
        sleep 1
      end
      @pdf.process_time = "1"
      @pdf.save!
    end
    redirect_to "/"
  end
end
