class FacebookLoginsController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?
  def create
    user_info = get_fb_user(params[:access_token])
    user =  User.find_or_initialize_by(fb_uid: user_info["id"])
    user.skip_password_validation = true
    user.update(user_info.as_json(except: ["id"]))

    sign_in(user)
  end

  private
  def get_fb_user(access_token)
    response = HTTParty.get("https://graph.facebook.com/v10.0/me",
      headers: {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      },
      query: {
        fields: 'id,name,email',
        access_token: access_token
      })
    response.parsed_response
  end

  def json_request?
    request.format.json?
  end
end
