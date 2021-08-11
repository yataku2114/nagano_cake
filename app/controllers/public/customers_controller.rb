class Public::CustomersController < ApplicationController
  def show
    @public = Public.find(params[:id])
  end

  def edit
    @public = Public.find(params[:id])
  end

  def update
    @public = Public.find(params[:id])
    @public.update(public_params)
    redirect_to public_customer_path(@public.id)
  end

  def confirm
    @public = current_public
  end

  def withdrawal
    @public = current_public
    @public.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private

  def public_params
    params.require(:public).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
