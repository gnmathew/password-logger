class CredentialsController < ApplicationController
  before_action :set_credential, only: %i[update destroy]

  def index
    credentials = current_user.credentials.all

    render json: CredentialSerializer.new(credentials).serializable_hash
  end

  def create
    credential = Credential.new(credential_params)

    if credential.save
      render json: CredentialSerializer.new(credential).serializable_hash
    else
      render json: { error: credential.errors.messages }, status: 422
    end
  end

  def update
    if @credential.update(credential_params)
      render json: CredentialSerializer.new(@credential).serializable_hash
    else
      render json: { error: @credential.errors.messages }, status: 422
    end
  end

  def destroy
    if @credential.destroy
      head :no_content
    else
      render json: { error: @credential.errors.messages }, status: 422
    end
  end

  private

  def set_credential
    @credential = current_user.credential.find(params[:id])
  end

  def credential_params
    params.require(:credential).permit(:email, :password, :username, :account)
  end
end