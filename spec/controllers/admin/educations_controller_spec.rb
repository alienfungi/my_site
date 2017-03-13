require 'rails_helper'

describe Admin::EducationsController do
  let(:education) { FactoryGirl.create(:education) }
  let(:id) { education.id }

  def raise_routing_error
    raise_error(ActionController::RoutingError)
  end

  context 'guests' do
    it 'can view the educations index' do
      expect { get :index }.not_to raise_error
    end

    it 'can begin to create educations' do
      expect { get :new }.not_to raise_error
    end

    it 'cannot create educations' do
      expect { post :create }.to raise_routing_error
    end

    it 'cannot edit educations' do
      expect { get(:edit, { id: id }) }.to raise_routing_error
    end

    it 'cannot update educations' do
      expect { get(:update, { id: id }) }.to raise_routing_error
    end

    it 'cannot delete educations' do
      expect { delete(:destroy, { id: id }) }.to raise_routing_error
    end
  end
end
