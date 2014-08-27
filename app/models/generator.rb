class Generator
  NAMES = ['avael','alexey','smirnov','petr','natali','rachelle','eve','maria','max','barnie','tatiana','lili','grinch','fester','cici','jess','ray','ban','monroe','michael','michelle','ted','gena','ivan','igor','evgeny','nika','daniil','harrison','hanry','hank','iosif','katarina','ryze','shaco','xin','zach','yi']
  WORDS = ["illo", "eveniet", "nisi", "beatae", "et", "culpa", "est", "facere", "quia", "expedita", "iure", "aut", "similique", "quod", "ut", "praesentium", "quo", "eius", "reiciendis", "repellendus", "nam", "ut", "occaecati", "adipisci", "sunt", "est", "eos", "quia", "temporibus", "qui", "recusandae", "quia", "unde", "enim", "et", "error", "rerum", "perferendis", "inventore", "esse", "officiis", "qui", "nihil", "qui", "ab", "excepturi", "et", "distinctio", "dolorem", "soluta", "siemens"] 

  def self.generate(users_count, records_count, comments_count, comments_depth)
    g_u_count = generate_users(users_count)
    g_r_count = generate_records(records_count)
    g_c_count = generate_comments(comments_count, comments_depth)
    return "generate result: users - #{g_u_count}, records - #{g_r_count}, comments - #{g_c_count}"
  end

  private

    def self.generate_users(count)
      return 0 if count.nil? || count == 0
      users = []
      count.times do
        users.push "('#{rand(36**rand(5..8)).to_s(36)}', '#{NAMES.sample}')"
      end
      User.connection.execute "INSERT INTO users (login, name) VALUES #{users.join(", ")}"
      users.count
    end

    def self.generate_records(count)
      return 0 if count.nil? || count == 0
      user_ids = User.all.pluck(:id)
      # faker was a bad idea - for now, speed test shows a ±3x speedup with my own sentenses maker
      # par = Faker::Lorem.paragraphs(count)
      # sent = Faker::Lorem.sentences(count)
      records = []
      count.times do |i|
        records.push "('#{generate_sentenses(1)}', '#{generate_sentenses(rand(1..5))}', #{user_ids.sample})"
      end
      records.each_slice(10000).to_a.each do |records|
        Record.connection.execute "INSERT INTO records (title, body, owner_id) VALUES #{records.join(", ")}"
      end
      records.count
    end

    def self.generate_comments(count, depth)
      return 0 if count.nil? || count == 0
    end

    def self.generate_sentenses(count)
      sentenses = []
      count.times do
        words = []
        rand(4..8).times do
          words << WORDS.sample
        end
        sentenses << words.join(" ").capitalize+"."
      end
      sentenses.join(" ")
    end

end