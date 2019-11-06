require './candidates'
require 'active_support/all'

def find(id)
  found = @candidates.select {|candidate| candidate[:id] == id.to_i }
  return found.length === 0 ? nil : found
end

def experienced?(candidate)
  return candidate[:years_of_experience] >= 2
end

def qualified_candidates()
  found = @candidates.select{ |candidate| 
    candidate[:github_points] >= 100 &&
    experienced?(candidate) &&
    candidate[:age] >= 18 &&
    (!candidate[:languages].exclude?('Python') || !candidate[:languages].exclude?('Ruby')) &&
    Date.parse(candidate[:date_applied].to_s) >= Date.parse(15.days.ago.to_date.to_s)
  }
  return found
end

def ordered_by_qualifications()
  return @candidates.sort_by! { |c| c[:years_of_experience] }.reverse
end
