require 'rails_helper'

describe Admin::ProjectsController do
  let(:project) { FactoryBot.create(:project) }
  let(:id) { project.id }

  def raise_routing_error
    raise_error(ActionController::RoutingError)
  end

  context 'guests' do
    it 'can view the projects index' do
      expect { get :index }.not_to raise_error
    end

    it 'can begin to create projects' do
      expect { get :new }.not_to raise_error
    end

    it 'cannot create projects' do
      expect { post :create }.to raise_routing_error
    end

    it 'cannot edit projects' do
      expect { get(:edit, params: { id: id }) }.to raise_routing_error
    end

    it 'cannot update projects' do
      expect { get(:update, params: { id: id }) }.to raise_routing_error
    end

    it 'cannot delete projects' do
      expect { delete(:destroy, params: { id: id }) }.to raise_routing_error
    end
  end
end
