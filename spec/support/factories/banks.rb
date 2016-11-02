FactoryGirl.define do
  factory :bank, class: 'Bank' do
    full_name { Forgery(FORGERY_NAME).company_name }
    name { Forgery(FORGERY_NAME).company_name }
  end

  factory :invalid_bank, parent: :bank do
    full_name nil
    name nil
  end
end
