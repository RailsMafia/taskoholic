require 'spec_helper'

describe ProjectsController do
  include Devise::TestHelpers

  before(:each) do
    sign_in FactoryGirl.create(:user)
  end
  
  describe "GET #show" do
    it "assigns the requested project to @project" do
      project = FactoryGirl.create(:project)
      get :show, id: project
      assigns(:project).should eq(project)
    end
    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:project)
      response.should render_template :show
    end
  end
  
  describe "GET #index" do
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end
  
  describe "GET #show" do
    it "assigns the requested project to @project" do
      project = FactoryGirl.create(:project)
      get :show, id: project
      assigns(:project).should eq(project)
    end
    
    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:project)
      response.should render_template :show
    end
  end
  
  describe 'DELETE destroy' do
    before :each do
      @project= FactoryGirl.create(:project)
    end
    
    it "deletes the project" do
      expect{
        delete :destroy, id: @project
      }.to change(Project,:count).by(-1)
    end
      
    it "redirects to projects#index" do
      delete :destroy, id: @project
      response.should redirect_to projects_url
    end
  end
  
end
