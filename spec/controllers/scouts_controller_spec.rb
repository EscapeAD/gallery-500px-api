require "rails_helper"

RSpec.describe ScoutsController do

  describe "GET #index" do
    subject {get :index}
    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    # it "renders index" do
    #   expect(response).to render_template(:index)
    # end
  end

  describe "GET #search" do
    render_views
    it "responds successfully with an HTTP 200 status code" do
      get :index, method: :show, params: {search: 'adam'}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "user not found send to error page" do
      get :index, method: :show, params: {search: 'klasdljasdjlasldjasjd'}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    render_views
    it "render error when user not found" do
      get :show, method: :show, params: {search: 'klasdljasdjlasldjasjd'}
      expect(response.body).to match(/<p>User not found/)
    end
  end

end
