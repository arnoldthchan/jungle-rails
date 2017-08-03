class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTPS_NAME"], password: ENV["HTTPS_PASSWORD"], except: :root

end
