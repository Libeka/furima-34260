class ProductsController < ApplicationController
  #before_action :move_to_index, except: [:index, :show]

def new
end

private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

end
