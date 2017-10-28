class ChargesController < ApplicationController

 def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "BigMoney Membership - #{current_user.name}",
     amount: Amount.default
   }
 end

 def create

   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

   charge = Stripe::Charge.create(
     customer: customer.id,
     amount: Amount.default,
     description: "BigMoney Membership - #{current_user.email}",
     currency: 'usd'
   )

   flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
   current_user.role = :premium
   current_user.save!

   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
 end

 def downgrade_account

   current_user.role = :standard
   current_user.save!
    redirect_to root_path
  end
end
