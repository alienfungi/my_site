class Admin::VersionsController < Admin::ApplicationController
  before_action :set_object
  before_action :set_version, except: [:index]

  def diff
  end

  def index
    @versions = @object.versions.reverse
  end

  def restore
    restored_object = @version.reify
    @object.paper_trail_overrides.each do |override|
      restored_object.send("#{ override }=", @object.send(override))
    end if(@object.respond_to?(:paper_trail_overrides))
    restored_object.save
    redirect_to [:admin, @object.class.name.downcase.pluralize]
  end

  private

  def set_object
    @object_type = params[:object_type].downcase
    klass = params[:object_type].classify.constantize
    @object = klass.find(params[:object_id])
  end

  def set_version
    @version = @object.versions.find(params[:id])
  end
end
