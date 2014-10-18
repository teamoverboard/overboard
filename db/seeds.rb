Question.destroy_all
Answer.destroy_all
Vote.destroy_all

question1 = Question.create(title: "What is Overboard?")
	Answer.create(question_id: question1.id, content: "Overboard helps companies keep frequently asked questions, 
		and their answers, in one place. It's like a second brain for your business.")

question2 = Question.create(title: "Who should win Rails Rumble 2014?")
  Answer.create(question_id: question2.id, content: "We're biased, but it's pretty clear the Overboard team should win.")

question3 = Question.create(title: "Who are the creators of Overboard?")
  Answer.create(question_id: question3.id, content: "Overboard is developed by Martin Jagusch, Shervin Aflatooni, 
  	Mario Visic and Natasha Postolovski.")

puts "Created #{Question.count} questions with #{Answer.count} answers."