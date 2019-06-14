class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: ENV["WEBSITE_USERNAME"], password:ENV["WEBSITE_PASSWORD"]
end