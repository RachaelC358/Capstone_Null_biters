ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
require 'net/ftp'

path = "public/pdf/"
arr = ["design.pdf","projects.pdf","requirements.pdf"]
ftp = Net::FTP.new('10.10.10.30')
ftp.login(user = "pdf_grunt", passwd = "supersecretpassword")
for a in arr do
  ftp.putbinaryfile(path + a, a)
end
ftp.quit()
