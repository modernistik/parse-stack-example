
# Sample before_save hook for Parse::User class ("_User")
Parse::Webhooks.route :before_save, "_User" do
  u = parse_object
  puts "Before Save for username: #{u.username}"
  u
end

# Sample after_save hook for Parse::User class ("_User")
Parse::Webhooks.route :after_save, "_User" do
  u = parse_object
  puts "After Save for username: #{u.username}"
  u
end