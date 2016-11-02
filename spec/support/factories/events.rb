FactoryGirl.define do
  factory :event, class: 'Event' do
    title { Forgery(FORGERY_LOREM_IPSUM).words(14) }
    description { Forgery(FORGERY_LOREM_IPSUM).text }
    start_time { Forgery(FORGERY_DATE).date }
    end_time { Forgery(FORGERY_DATE).date }

    user { build(:user) }
  end

  factory :invalid_event, parent: :event do
    title nil
    description nil
    start_time nil
    end_time nil

    user nil
  end
end
