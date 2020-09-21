FactoryBot.define do
  factory :address do
    postnumber { "123-4567" }
    transient do
      address {Gimei.address}
      person {Gimei.name}
    end
    
    prefecture { address.prefecture.kanji }
    city { address.city.kanji}
    house_number { "999" }
    building {address.town.kanji}
    phone_number {"000-1111-2222"}
    user_id { 1 }
    last_name { person.last.kanji }
    first_name { person.first.kanji }
    last_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }
  end
end