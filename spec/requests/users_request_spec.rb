require 'rails_helper'

describe "User Requests", type: :request do
  
  describe "Create user" do

    it "redirects to user page for valid input" do
      post '/users', params: { user: { name: "Bruce Wayne",
                                      email: "batman@gmail.com",
                                      password: "foobar",
                                      password_confirmation: "foobar" } } 
      expect(response).to redirect_to(assigns(:user))
    end

    it "renders the same page for invalid input" do
      post '/users', params: { user: { name: "Bruce Wayne",
                                      email: "",
                                      password: "foobar",
                                      password_confirmation: "foobar" } }
      expect(response).to render_template('static_pages/home')
    end

  end

  describe "Edit user" do

    before(:each) do
      @user = create(:user)
    end

    it "renders the same page for invalid input" do
      log_in_as(@user)
      get "/users/#{@user.id}/edit", params: {}
      expect(response).to render_template('users/edit')
      patch "/users/#{@user.id}", params: {:user => { name: "",
                                                  email: "foo@invalid",
                                                  password: "foo",
                                                  password_confirmation: "bar" } }
      expect(response).to render_template('users/edit')
    end

    it "redirects to user page for valid input" do
      get "/users/#{@user.id}/edit", params: {}
      log_in_as(@user)
      expect(response).to redirect_to("/users/#{@user.id}/edit")
      name  = "Foo Bar"
      email = "foo@bar.com"
      patch "/users/#{@user.id}", params: { user: { name: name,
                                                email: email } }
      expect(flash.empty?).to be false
      expect(response).to redirect_to(@user)
      @user.reload
      expect(@user.name).to eq(name)
      expect(@user.email).to eq(email)
    end

    it "redirects edit when not logged in" do
      get "/users/#{@user.id}/edit", params: {}
      expect(response).to redirect_to(root_url)
    end

    it "redirects update when not logged in" do
      patch "/users/#{@user.id}", params: { id: @user.id,
                               user: { name: @user.name,
                                       email: @user.email } }
      expect(response).to redirect_to(root_url)
    end

    it "redirects edit when logged in as wrong user" do
      @other_user = create(:other_user)
      log_in_as(@other_user)
      get "/users/#{@user.id}/edit", params: {}
      expect(response).to redirect_to(root_url)
    end

    it "redirects update when logged in as wrong user" do
      @other_user = create(:other_user)
      log_in_as(@other_user)
      patch "/users/#{@user.id}", params: { id: @user.id,
                               user: { name: @user.name,
                                       email: @user.email } }
      expect(response).to redirect_to(root_url)
    end

  end

  describe "List users" do

    it "redirects index when not logged in" do
      get "/users", params: {}
      expect(response).to redirect_to(root_url)
    end

  end

  describe "Delete user" do
    
    it "redirects destroy when not logged in" do
      @user = create(:user)
      delete "/users/#{@user.id}", params: {}
      expect(response).to redirect_to(root_url)
    end

    it "redirects destroy when logged in as non admin" do
      @user = create(:user)
      @other_user = create(:other_user)
      log_in_as(@user)
      delete "/users/#{@other_user.id}", params: {}
      expect(response).to redirect_to(root_url)
    end

  end

end