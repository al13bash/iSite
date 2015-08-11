class CatalogController < ApplicationController
  def index
      @sites = Site.order(:id)
      @users = User.all.to_a.reduce(Hash.new{0}) {|total, current| total[current.id] = current.username; total}
  end
  
  def search
      @search = Site.search do
        fulltext params[:search] do
          fields(:user, :components)
        end
      end
      @sites = @search.results
      render :index
  end
end
