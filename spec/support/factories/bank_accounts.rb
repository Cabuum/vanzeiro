FactoryGirl.define do
  factory :bank_account, class: 'BankAccount' do
    instruction1 { Forgery(FORGERY_LOREM_IPSUM).words }
    instruction2 { Forgery(FORGERY_LOREM_IPSUM).words }
    instruction3 { Forgery(FORGERY_LOREM_IPSUM).words }
    instruction4 { Forgery(FORGERY_LOREM_IPSUM).words }
    instruction5 { Forgery(FORGERY_LOREM_IPSUM).words }
    instruction6 { Forgery(FORGERY_LOREM_IPSUM).words }
    instruction7 { Forgery(FORGERY_LOREM_IPSUM).words }
    agreement { Forgery(FORGERY_LOREM_IPSUM).words(14) }
    account { Forgery(FORGERY_LOREM_IPSUM).text }
    agency { Forgery(FORGERY_LOREM_IPSUM).words }

    bank { build(:bank) }
    user { build(:user) }
  end

  factory :invalid_bank_account, parent: :bank_account do
    instruction1 nil
    instruction2 nil
    instruction3 nil
    instruction4 nil
    instruction5 nil
    instruction6 nil
    instruction7 nil
    agreement nil
    account nil
    agency nil

    bank nil
    user nil
  end
end
