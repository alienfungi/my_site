require 'rails_helper'

describe Admin::CertificationsController do
  let(:certification) { FactoryGirl.create(:certification) }
  let(:id) { certification.id }

  def raise_routing_error
    raise_error(ActionController::RoutingError)
  end

  context 'guests' do
    it 'can view the certifications index' do
      expect { get :index }.not_to raise_error
    end

    it 'can begin to create certifications' do
      expect { get :new }.not_to raise_error
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
