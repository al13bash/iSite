class CatalogController < ApplicationController
  def index
      @sites = Site.order(:id)
  end
  
  def search
      @search = Site.search do
        fulltext params[:search] do
          fields(:user)
        end
      end
      @sites = @search.results
      render :index
  end
end
