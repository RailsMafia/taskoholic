require 'spec_helper'

describe ProjectsController do

  context "for NOT logged in user" do
    # before { sign_out FactoryGirl.create(:user) }
    describe "GET #index" do
      it "redirects user to login" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context "for logged in user" do
    before do
      user = FactoryGirl.create(:user)
      3.times do
        project = FactoryGirl.create(:project)
        project.owner = user
        project.save
      end
      sign_in user
    end

    describe "GET #show" do
      it "assigns the requested project to @project" do
        project = FactoryGirl.create(:project)
        get :show, id: project
        expect(assigns(:project)).to eq(project)
      end
      it "renders the #show view" do
        get :show, id: FactoryGirl.create(:project)
        expect(response).to render_template :show
      end
    end

    describe "GET #index" do
      it "shows proper projects list" do
        get :index
        expect(assigns(:projects).count).to eq 3
      end

      it "renders the :index view" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe "GET #show" do
      it "assigns the requested project to @project" do
        project = FactoryGirl.create(:project)
        get :show, id: project
        expect(assigns(:project)).to eq(project)
      end

      it "renders the #show view" do
        get :show, id: FactoryGirl.create(:project)
        expect(response).to render_template :show
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
        expect(response).to redirect_to projects_url
      end
    end

  end

end
