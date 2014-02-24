# Quiz Project

Figured we can use this to document what we've done/explain how it works.
This is also a little bit for my benefit so I can go over what we actually did earlier.
Obviously all this can be deleted pretty quickly.

## Viewing questions

So, in the actual app (i.e. on localhost:3000), you can see questions at `/questions/:id`. Each question has the text of the question and True and False buttons. Clicking an answer takes you to `questions/:id/result`, which displays 'Correct!' if you were right, and 'Incorrect' if you were wrong.

We created
- answer_questions.feature (the Cucumber test)
- question_steps.rb (the step definitions for that test file)
- `show` method in QuestionsController
-- route declared via `resources :questions` in routes.rb
-- show gets the `:id` param from the url (`questions/:id`)
-- puts the relevant question in the `@question` instance variable
- `show.html/erb` view
-- question text in a paragraph tag
-- form with a True input[submit] and a False input[submit], method=get, action=questions/:id/result
- `get 'questions/:id/result' => 'questions#show_result'` route in routes.rb
-- *this should definitely be a POST request, but I couldn't get that to work*
- `show_result` method in QuestionsController
-- this checks if either 'True' or 'False' is in the params hash (from the relevant input) and then assigns the appropriate value to @user_answer
-- also assigns the appropriate question to @question
- `show_result.html.erb` view
-- Displays 'Correct!' if @user_answer == @question.answer, and 'Incorrect' otherwise