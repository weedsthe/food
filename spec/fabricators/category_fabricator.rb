Fabricator(:category) do
  title 'pizza'
  dishes { [Fabricate.build(:dish)] }
end