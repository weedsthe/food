Fabricator(:dish) do
  title 'pizza'
  ingredients { [Fabricate.build(:ingredient)] }
end

