require 'rails_helper'

describe "Static Page Requests", type: :request do
  
  describe "Home Page" do

    it "should render the home template" do
      get "/", params: {}
      expect(subject).to render_template("static_pages/home")
    end

  end

end