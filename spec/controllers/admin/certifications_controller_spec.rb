require 'rails_helper'

describe Admin::CertificationsController do
  let(:certification) { FactoryGirl.create(:certification) }
  let(:id) { certification.id }

  def raise_routing_error
    raise_error(ActionController::RoutingError)
  end

  context 'guests' do
    it 'cannot view certifications' do
      expect { get(:show, { id: id }) }.to raise_routing_error
    end

    it 'cannot view the certifications index' do
      expect { get :index }.to raise_routing_error
    end

    it 'cannot begin to create certifications' do
      expect { get :new }.to raise_routing_error
    end

    it 'cannot create certifications' do
      expect { post :create }.to raise_routing_error
    end

    it 'cannot edit certifications' do
      expect { get(:edit, { id: id }) }.to raise_routing_error
    end

    it 'cannot update certifications' do
      expect { get(:update, { id: id }) }.to raise_routing_error
    end

    it 'cannot delete certifications' do
      expect { delete(:destroy, { id: id }) }.to raise_routing_error
    end
  end
end
