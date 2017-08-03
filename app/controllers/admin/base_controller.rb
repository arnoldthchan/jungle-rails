class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: "jungle", password: "book", except: :root

end
