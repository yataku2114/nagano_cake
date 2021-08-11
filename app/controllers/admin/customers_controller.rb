class Admin::CustomersController < ApplicationController
  def index
    @publics = Public.all
  end

  def show
    @public = Public.find(params[:id])
  end

  def edit
    @public = Public.find(params[:id])
  end

  def update
    @public = Public.find(params[:id])
    @public.update(public_params)
    redirect_to admin_customer_path(@public.id)
  end

  def public_params
    params.require(:public).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_valid)
  end

end
