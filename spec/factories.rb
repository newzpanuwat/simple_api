FactoryBot.define do
    factory :restaurant do
        sequence(:name) { |n| "restaurant#{n}"}
    end
end