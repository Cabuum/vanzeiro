FactoryGirl.define do
  factory :authorization, class: 'Authorization' do
    username { Forgery(FORGERY_INTERNET).user_name }
    provider { Forgery(FORGERY_INTERNET).user_name }
    token { Forgery(FORGERY_BASIC).encrypt }
    secret { Forgery(FORGERY_BASIC).encrypt }
    uid { Forgery(FORGERY_BASIC).password }

    association :user, factory: :user
  end

  factory :invalid_authorization, parent: :authorization do
    username nil
    provider nil
    secret nil
    token nil
    uid nil

    user nil
  end
end
