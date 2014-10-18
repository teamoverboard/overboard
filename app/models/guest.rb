module Guest
  RANK = [ '', '', '', '', 'Master ', '', '', '' ] # LOL this is a hack
  TITLES = [ 'Captain', 'First Mate', 'Quartermaster', 'Boatswain', 'Navigator', 'Sailing Master', 'Carpenter', 'Pilot', 'Gunner', 'Cook', 'Doctor', 'Powder Monkey', 'Sailor', 'Striker', 'Cabin Boy' ]
  FIRST_NAMES = [ 'Guybrush', 'Anton', 'Barrett', 'Blood', 'Bloth', 'Blubber', 'Blackeye', 'Broom', 'Contagious', 'Claw', 'Skunkbeard', 'Crook', 'Avery-the captain', 'Crow', 'Flint', 'Isabela', 'Redbeard', 'Roger', 'Shakespeare', 'Salt', 'Sparrow', 'Marley', 'LeChuck' ]

  def self.create
    User.create(:name => guest_name, :email => "guest_#{Time.now.to_i}#{rand(100)}@example.com").tap do |user|
      user.save!(:validate => false)
    end
  end

  private

  def self.guest_name
    "#{RANK.sample}#{TITLES.sample} #{FIRST_NAMES.sample}"
  end
end
