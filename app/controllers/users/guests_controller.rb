class Users::GuestsController < ApplicationController
  def create
    @user = create_or_get_guest

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else
      redirect_to new_user_registration_url
    end
  end

  private

  def create_or_get_guest
    if current_user
      if session[:guest_user_id]
        logging_in
        guest_user.destroy
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  def logging_in
    # For example:
    # guest_comments = guest_user.comments.all
    # guest_comments.each do |comment|
      # comment.user_id = current_user.id
      # comment.save!
    # end
  end

  def guest_user
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
     session[:guest_user_id] = nil
     guest_user
  end

  def create_guest_user
    User.create(:name => guest_name, :email => "guest_#{guest_name}_#{Time.now.to_i}#{rand(100)}@example.com").tap do |user|
      user.save!(:validate => false)
      session[:guest_user_id] = user.id
    end
  end

  RANK = [ '', '', '', '', 'Master ', '', '', '' ]
  TITLES = [ 'Captain', 'First Mate', 'Quartermaster', 'Boatswain', 'Navigator', 'Sailing Master', 'Carpenter', 'Pilot', 'Gunner', 'Cook', 'Doctor', 'Powder Monkey', 'Sailor', 'Striker', 'Cabin Boy' ]
  FIRST_NAMES = [ 'Guybrush', 'Anton', 'Barrett', 'Blood', 'Bloth', 'Blubber', 'Blackeye', 'Broom', 'Contagious', 'Claw', 'Skunkbeard', 'Crook', 'Avery-the captain', 'Crow', 'Flint', 'Isabela', 'Redbeard', 'Roger', 'Shakespeare', 'Salt', 'Sparrow', 'Marley', 'LeChuck' ]

  def guest_name
    @guest_name ||= "#{RANK.sample}#{TITLES.sample} #{FIRST_NAMES.sample}"
  end
end
