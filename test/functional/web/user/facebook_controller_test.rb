require 'test_helper'

class Web::User::FacebookControllerTest < ActionController::TestCase
  setup do
    @auth_data = generate(:facebook_auth)
    request.env['omniauth.auth'] = @auth_data
  end

  test "should create user via Facebook" do
    get :callback
    assert_response :redirect

    user = User.find_by(@auth_data[:info].extract(:email))

    assert { user }
    assert { user.authentications.any? }
    assert { signed_in? }
  end

  test "should sign in via Facebook" do
    user = create :user, email: @auth_data[:info][:email]

    get :callback
    assert_response :redirect

    assert signed_in?
    assert { user.authentications.any? }
  end

end
