FactoryGirl.define do
   factory :labels do
     title RandomData.random_sentence
     body RandomData.random_paragraph
   end
 end
