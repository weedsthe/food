Fabricator(:dish) do
  title 'pizza'
  ingredients { [Fabricate.build(:ingredient)] }
  prices { [Fabricate.build(:price)] }
end

