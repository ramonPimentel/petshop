module V1
  class ClientsController < ApiController
    layout :false
    def index
      @clients = Client.where("name LIKE ?", "%#{params[:q]}%")
      render json: @clients
    end
  end
end