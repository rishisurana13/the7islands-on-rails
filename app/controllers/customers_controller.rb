# frozen_string_literal: true

class CustomersController < OpenReadController
  skip_before_action :authenticate, only: %i[signup signin]

  # POST '/sign-up'
  def signup
    customer = Customer.create(customer_creds)
    if customer.valid?
      render json: customer, status: :created
    else
      render json: customer.errors, status: :bad_request
    end
  end

  def index
    @customers = Customer.all

    render json: @customers
  end

  # GET /products/1
  # GET /products/1.json
  def show
    render json: Customer.find(params[:id])
  end

  # POST '/sign-in'
  def signin
    creds = customer_creds
    if (customer = Customer.authenticate creds[:email],
                                         creds[:password])
      render json: customer, serializer: CustomerLoginSerializer, root: 'customer'
    else
      head :unauthorized
    end
  end

  # DELETE '/sign-out'
  def signout
    current_customer.logout
    head :no_content
  end

  # PATCH '/change-password/:id'
  def changepw
    # if the the old password authenticates,
    # the new one is not blank,
    # and the model saves
    # then 204
    # else 400
    if current_customer.authenticate(pw_creds[:old]) &&
       !(current_customer.password = pw_creds[:new]).blank? &&
       current_customer.save
      head :no_content
    else
      head :bad_request
    end
  end

  private

  def customer_creds
    params.require(:credentials)
          .permit(:email, :password, :password_confirmation)
  end

  def pw_creds
    params.require(:passwords)
          .permit(:old, :new)
  end
end
