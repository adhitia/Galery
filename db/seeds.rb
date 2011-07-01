Dir[Rails.root.join('db', 'seeds', Rails.env, '*.yml')].sort.each do |seed|
  puts "seeding file #{seed.inspect}"
  documents = YAML.load_file(seed)
  klass = File.basename(seed.split('-').last, '.yml').classify.constantize
  documents.sort.each do |doc|
    puts doc.inspect
    new_record = klass.new(doc.last)
    new_record.save(false)
    puts new_record.inspect
  end
end