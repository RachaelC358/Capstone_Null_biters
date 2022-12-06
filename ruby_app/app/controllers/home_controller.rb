class HomeController < ApplicationController
  def index
  end
  def next
    cookies[:ID] = cookies[:ID] + 1
    if cookies[:ID] == Pdf.count()
      cookies[:ID] = 0
    end
  end
  def prev
    cookies[:ID] = cookies[:ID] - 1
    if cookies[:ID] == -1
      cookies[:ID] = Pdf.count()
    end
  end
end
