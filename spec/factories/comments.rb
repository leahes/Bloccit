FactoryGirl.define do
   factory :comments do
     title RandomData.random_sentence
     body RandomData.random_paragraph
   end
 end
