Question.destroy_all
Answer.destroy_all
Vote.destroy_all
User.destroy_all
Channel.destroy_all
Comment.destroy_all

user1 = Guest.create
user2 = Guest.create
user3 = Guest.create
user4 = Guest.create

channel1 = Channel.create(name: 'default')


question1 = Question.create(title: "What is Overboard?", user: user1, channel: channel1)
  answer1 = Answer.create(question_id: question1.id, content: "Overboard helps companies keep frequently asked questions,
    and their answers, in one place. It's like a second brain for your business.", user: user2)

comment1 = Comment.create(body: 'I like this answer!', user: user4, commentable: answer1)

question2 = Question.create(title: "Who should win Rails Rumble 2014?", user: user2, channel: channel1)
  Answer.create(question_id: question2.id, content: "We're biased, but it's pretty clear the Overboard team should win.", user: user3)

question3 = Question.create(title: "Who are the creators of Overboard?", user: user3, channel: channel1)
  Answer.create(question_id: question3.id, content: "Overboard is developed by Martin Jagusch, Shervin Aflatooni,
  	Mario Visic and Natasha Postolovski.", user: user4)

puts "Created #{Question.count} questions with #{Answer.count} answers."
