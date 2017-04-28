class Api::V2::ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session # allows postman and other external tools to create data in your db

  # run the restrict_access method before any other methods can be run
  # before_action :restrict_access

  # restrict access to anyone who doesn't meet criteria
  # def restrict_access
  #   authenticate_or_request_with_http_token do |api_key, options|
  #     # check if the api_key and email passed exist in the database
  #     User.find_by(api_key: api_key, email: request.headers['X-User-Email'])
  #   end
  # end

  def restrict_access
    authenticate_or_request_with_http_token do |api_key, options|
      api_key == '123456' && request.headers['X-User-Email'] == 'email'
    end
  end


# In Postman:
# Key = Authorization ; Value = Token token=#apikey
# Key = X-User-Email ; Value = #useremail
end
