module ApplicationHelper
  def format_date(date) # FIXME: test #format_date
    # OPTIMIZE: is this the best format?
    # http://apidock.com/ruby/DateTime/strftime
    if (date.class == Time) || (date.class == Date) || (date.class == DateTime)
      date.strftime("%B %Y") # eg, January 2086, August 1994
    end
  end

  def random_profession_name # FIXME: test #random_profession_name
    professionals = [ # NOTE: if you're adding more, please pluralize!
      "doctors", "dentists", "psychiatrists", "engineers", "bus drivers",
      "artists", "musicians", "grad students", "professors", "teachers",
      "lifeguards", "firefighters", "nurses", "architects", "video game testers",
      "programmers", "elephants", "giraffes", "pilots", "stewards",
      "most children", "superheroes", "librarians", "actors", "scientists" # NOTE: anything past this point is not yet in the specs
    ]

    professionals.shuffle.sample.capitalize  # just shuffling for extra randomness
  end
end
