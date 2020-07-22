
# Sample before_save hook for Parse::User class ("_User")
Parse::Webhooks.route :before_save, "Song" do
  u = parse_object
  puts "Before Save for Song: #{u.as_json}"
  u
end

# Sample after_save hook for Parse::User class ("_User")
Parse::Webhooks.route :after_save, "Song" do
  puts "After Save for song: #{parse_object.name}"
  parse_object
end