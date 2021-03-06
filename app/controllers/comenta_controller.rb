class ComentaController < ApplicationController

  def show
    @comentario = Comment.new
    @comentarios = Comment.order('created_at DESC').page(params[:page])
  end

  def create
    message = (params[:other_email].blank? && Comment.create_approved(params[:comment]))? {:notice => 'Comentario se creo.'} : {:error => 'Error al crear el comentario.'}
    redirect_to :back, message
  end
end
