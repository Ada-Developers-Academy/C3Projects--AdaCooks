module ApplicationHelper
  def format_date(date)
    date.strftime("%B %Y") # eg, January 2086, August 1994
  end

  def random_profession_name
    professionals = [
      "doctors", "dentists", "psychiatrists", "engineers", "bus drivers",
      "artists", "musicians", "grad students", "professors", "teachers",
      "lifeguards", "firefighters", "nurses", "architects", "video game testers",
      "programmers", "elephants", "giraffes", "pilots", "stewards",
      "most children", "superheroes", "librarians", "actors", "scientists"
    ]

    professionals.shuffle.sample.capitalize  # just shuffling for extra randomness
  end
end
