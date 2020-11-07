FactoryBot.define do
  factory :creditcard do
    customer_id {"cus_xxxxxxxxxxxxxxxx"}
    user_id {"1"}
    card_id { "car_yyyyyyyyyyyyyyyy" }
    exp_month { "1" }
    exp_year { "2022" }
    cvc { "123" }
  end
end
