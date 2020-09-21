FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 7)
    nickname {Faker::Artist.name}
    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
    transient do
      person {Gimei.name}
    end
    
    last_name { person.last.kanji }
    first_name { person.first.kanji }
    last_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }
    birthday {'1999-12-12'}
  end
end