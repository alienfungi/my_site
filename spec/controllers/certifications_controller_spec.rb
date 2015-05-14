require 'rails_helper'

describe CertificationsController do
  let(:certification) { FactoryGirl.create(:certification) }
  let(:id) { certification.id }

  def raise_routing_error
    raise_error(ActionController::RoutingError)
  end

  context 'guests' do
    it 'cannot view tags' do
      expect { get(:show, { id: id }) }.to raise_routing_error
    end

    it 'cannot view the tags index' do
      expect { get :index }.to raise_routing_error
    end

    it 'cannot begin to create tags' do
      expect { get :new }.to raise_routing_error
    end

    it 'cannot create tags' do
      expect { post :create }.to raise_routing_error
    end

    it 'cannot edit tags' do
      expect { get(:edit, { id: id }) }.to raise_routing_error
    end

    it 'cannot update tags' do
      expect { get(:update, { id: id }) }.to raise_routing_error
    end

    it 'cannot delete tags' do
      expect { delete(:destroy, { id: id }) }.to raise_routing_error
    end
  end
end
