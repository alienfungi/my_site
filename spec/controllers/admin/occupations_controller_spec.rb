require 'rails_helper'

describe Admin::OccupationsController do
  let(:occupation) { FactoryGirl.create(:occupation) }
  let(:id) { occupation.id }

  def raise_routing_error
    raise_error(ActionController::RoutingError)
  end

  context 'guests' do
    it 'cannot view occupations' do
      expect { get(:show, { id: id }) }.to raise_routing_error
    end

    it 'cannot view the occupations index' do
      expect { get :index }.to raise_routing_error
    end

    it 'cannot begin to create occupations' do
      expect { get :new }.to raise_routing_error
    end

    it 'cannot create occupations' do
      expect { post :create }.to raise_routing_error
    end

    it 'cannot edit occupations' do
      expect { get(:edit, { id: id }) }.to raise_routing_error
    end

    it 'cannot update occupations' do
      expect { get(:update, { id: id }) }.to raise_routing_error
    end

    it 'cannot delete occupations' do
      expect { delete(:destroy, { id: id }) }.to raise_routing_error
    end
  end
end
