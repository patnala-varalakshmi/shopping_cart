class AddInitialUserRecords < ActiveRecord::Migration[7.0]
  def up
    5.times do |i|
      User.create(name: "Test User ##{i}", email: "testuser#{i}@mail.com", mobile: "#{i}234567890")
    end
  end

  def down
    User.delete_all
  end
end
