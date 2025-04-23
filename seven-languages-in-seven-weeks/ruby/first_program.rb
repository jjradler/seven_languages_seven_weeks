# First program in Ruby. Takes a hard-coded list of subjects, direct objects,
# and verbs to  mad-libs them together.
# J. J. Radler
# 2025-01-25
#

subjects = ['Some guy', 'The dog', 'My cat', 'Mista Dabolina', 'Flipper']
direct_objects = ['a gazorninplatt', 'the ribulphlazm', 'a rutabaga', 'this ishkibibble', 'a lunch', 'the cable', 'a ball']
verbs = ['has', 'lacks', 'eats', 'works', 'works', 'cooks',  'gives', 'takes', 'stops']

iterations = 20
x = 0

while x < iterations
  x = x + 1
  v = rand(verbs.length)
  d = rand(direct_objects.length)
  s = rand(subjects.length)

  puts "#{subjects[s]} #{verbs[v]} #{direct_objects[d]}!"
end

