require 'rails_helper'

describe Admin::StaticPagesController do
  def raise_routing_error
    raise_error(ActionController::RoutingError)
  end

  context 'guests' do
    it 'cannot visit home' do
      expect { get :home }.to raise_routing_error
    end
  end
end
