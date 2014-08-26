class Generator

  def self.generate(users_count, records_count, comments_count, comments_depth)
    g_u_count = generate_users(users_count)
    g_r_count = generate_records(records_count)
    g_c_count = generate_comments(comments_count, comments_depth)
    return "generate result: users - #{g_u_count}, records - #{g_r_count}, comments - #{g_c_count}"
  end

  private

    def self.generate_users(count)
      columns = ['login', 'name']
      users = []
      count.times do
        users << [Faker::Internet.user_name, Faker::Name.name]
      end
      User.import columns, users, validate: false
      users.count
    end

    def self.generate_records(count)
      user_ids = User.all.pluck(:id)
      columns = ['title', 'body', 'owner_id']
      records = []
      count.times do
        records << [Faker::Lorem.sentence, Faker::Lorem.paragraph, user_ids.sample]
      end
      Record.import columns, records, validate: false
      records.count
    end

    def self.generate_comments(count, depth)
    end

end