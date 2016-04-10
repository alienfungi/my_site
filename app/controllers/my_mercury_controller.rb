class MyMercuryController < ActionController::Base
  def update
    params[:content].each do |id, attributes|
      data = attributes[:data]
      lookup_hash = {
        action: data[:action],
        controller: data[:controller],
        name: data[:name]
      }
      region = Region.find_or_create_by(lookup_hash)
      region.update_attribute(:content, attributes[:value])
    end
    render text: ''
  end
end
