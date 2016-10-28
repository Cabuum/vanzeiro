FactoryGirl.define do
  factory :user, class: 'User' do
    name { Forgery(FORGERY_NAME).full_name }
    email { Forgery(FORGERY_EMAIL).address }
    password { Forgery(FORGERY_BASIC).encrypt }
    password_confirmation { password }
    document { Forgery(FORGERY_CPF).formatted }
    social_reason { Forgery(FORGERY_NAME).company_name }
    fantasy_name { Forgery(FORGERY_NAME).company_name }
    phone { Forgery(FORGERY_BASIC).number.to_s }
  end

  factory :invalid_user, parent: :user do
    name nil
    email nil
    password nil
    password_confirmation nil
    document nil
    social_reason nil
    fantasy_name nil
    phone nil
  end
end
