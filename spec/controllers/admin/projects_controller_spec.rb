require 'rails_helper'

describe Admin::ProjectsController do
  let(:project) { FactoryGirl.create(:project) }
  let(:id) { project.id }

  def raise_routing_error
    raise_error(ActionController::RoutingError)
  end

  context 'guests' do
    it 'cannot view projects' do
      expect { get(:show, { id: id }) }.to raise_routing_error
    end

    it 'cannot view the projects index' do
      expect { get :index }.to raise_routing_error
    end

    it 'cannot begin to create projects' do
      expect { get :new }.to raise_routing_error
    end

    it 'cannot create projects' do
      expect { post :create }.to raise_routing_error
    end

    it 'cannot edit projects' do
      expect { get(:edit, { id: id }) }.to raise_routing_error
    end

    it 'cannot update projects' do
      expect { get(:update, { id: id }) }.to raise_routing_error
    end

    it 'cannot delete projects' do
      expect { delete(:destroy, { id: id }) }.to raise_routing_error
    end
  end
end
