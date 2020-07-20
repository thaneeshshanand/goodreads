require 'rails_helper'

describe "Session Requests", type: :request do

  before(:each) do
    @user = create(:user)
  end
  
  describe "Login with valid user followed by logout" do
    it "should redirect to right pages" do
      post "/login", params: { session: { email: "batman@gmail.com",
                                         password: "foobar" } }
      expect(response).to redirect_to(assigns(:user))
      expect(is_logged_in?).to be true
      delete "/logout", params: {}
      expect(response).to redirect_to(root_path)
      expect(is_logged_in?).to be false
    end
  end

  describe "Login invalid user" do
    it "should render the same page" do
      post "/login", params: { session: { email: "batman@gmail.com",
                                         password: "barfoo" } }
      expect(response).to render_template(root_path)
    end
  end

  describe "Login with remembering" do
    it "should remember token" do
      log_in_as(@user, remember_me: '1')
      expect(cookies['remember_token']).not_to be_empty
    end
  end

end