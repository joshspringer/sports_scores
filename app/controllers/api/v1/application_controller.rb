class Api::V1::ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session # allows postman and other external tools to create data in your db
end
