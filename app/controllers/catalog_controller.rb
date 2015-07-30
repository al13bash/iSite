class CatalogController < ApplicationController
  def index
      @sites = Site.order(:id)
  end
end
