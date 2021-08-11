class Public::AddressesController < ApplicationController
  def index
    @public = current_public
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @public = current_public
    @address = Address.new(address_params)
    @address.public_id = current_public.id
    @address.save
    redirect_to public_addresses_path
  end

  def update
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
