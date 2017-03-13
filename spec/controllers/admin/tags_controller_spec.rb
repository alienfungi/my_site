require 'rails_helper'

describe Admin::TagsController do
  let(:tag) { FactoryGirl.create(:tag) }
  let(:id) { tag.id }

  def raise_routing_error
    raise_error(ActionController::RoutingError)
  end

  context 'guests' do
    it 'can view the tags index' do
      expect { get :index }.not_to raise_error
    end

    it 'can begin to create tags' do
      expect { get :new }.not_to raise_error
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
