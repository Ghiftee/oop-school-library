class Corrector
  def correct_name(name)
    capital_name = name.capitalize
    sliced_name = capital_name.slice(0, 10)
    sliced_name
  end
end
