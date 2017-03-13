require 'rails_helper'

describe Admin::StaticPagesController do
  def raise_routing_error
    raise_error(ActionController::RoutingError)
  end

  context 'guests' do
    it 'can visit home' do
      expect { get :home }.not_to raise_error
    end
  end
end
