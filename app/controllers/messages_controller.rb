#encoding: UTF-8
class MessagesController < ApplicationController
  load_and_authorize_resource

  def create
    @mission = Mission.find(params[:mission_id])
    @message = Message.new
    if @message.share(@mission)
      redirect_to missions_path, :notice => 'Resultado compartilhado, você ganhou 50 pontos!'
    else
      redirect_to missions_path, :notice => 'Não foi possível compartilhar o resultado, tente mais tarde.'
    end
  end

end
