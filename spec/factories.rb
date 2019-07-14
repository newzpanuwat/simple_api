FactoryBot.define do
    factory :restaurant do
        sequence(:name) { |n| "restaurant#{n}"}
    end

    factory :dish do
        sequence(:name) { |n| "dish#{n}"}
    end
end