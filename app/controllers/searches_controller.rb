class SearchesController < ApplicationController
  def search_user
    search_term = params[:search]
    if search_term==nil
       @users=User.where.not(id:@current_user.id)
    else
      @users=User.where('lower(name) LIKE :query OR lower(username) LIKE :query', query: "%#{search_term}%")

      # @users=User.where('lower(name) ILIKE :query OR lower(username) ILIKE :query', query: "%#{search_term}%")
    end
  end

end



