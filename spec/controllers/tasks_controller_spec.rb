require 'spec_helper'

describe TasksController do
  context "for logged in user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:project) { FactoryGirl.create(:project, owner: user) }
    subject { FactoryGirl.create(:task, project: project) }

    before do
      sign_in user
    end

    describe "GET #index" do
      it "renders the :index view" do
        get :index, project_id: project.id
        expect(response).to render_template :index
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "creates new object" do
          expect{
            post :create, project_id: project.id, task: FactoryGirl.attributes_for(:task)
          }.to change(Task, :count).by(1)
        end

        it "rendirects to index path" do
          post :create, project_id: project.id, task: FactoryGirl.attributes_for(:task)
          expect(response).to redirect_to project_tasks_path
        end
      end

      context "with not valid attributes" do
        it "not save object to db" do
          expect{
            post :create, project_id: project.id, task: FactoryGirl.attributes_for(:invalid_task)
          }.to_not change(Task, :count)
        end

        it "render new view" do
          post :create, project_id: project.id, task: FactoryGirl.attributes_for(:invalid_task)
          expect(response).to render_template :new
        end
      end
    end
  end
end
