class QuestionsController < ApplicationController
  def question_1
    @question = "How many movies on the list did Francis Ford Coppola direct?"

    the_director = Director.find_by({ :name => "Francis Ford Coppola" })

    the_directors_movies = Movie.where({ :director_id => the_director })

    @answer = the_directors_movies.count

    render('question_and_answer')
  end

  def question_2
    @question = "Who directed the oldest movie on the list?"

    # Your Ruby goes here.

    render('question_and_answer')
  end

  def question_3
    @question = "What is the oldest movie on the list directed by Francis Ford Coppola?"

    # Your Ruby goes here.

    render('question_and_answer')
  end

  def question_4
    @question = "What is the most recent movie on the list directed by Christopher Nolan?"

    # Your Ruby goes here.

    render('question_and_answer')
  end

  def question_5
    @question = "What is the most recent movie on the list that Harrison Ford appeared in?"

    # Your Ruby goes here.

    render('question_and_answer')
  end

  def question_6
    @question = "Who directed the longest movie on the list?"

    # Your Ruby goes here.

    render('question_and_answer')
  end

  # HARDER
  # ======

  def question_7
    @question = "Which director has the most movies on the list?"
    # (If there's a tie, any one of them is fine)

    # Your Ruby goes here.

    render('question_and_answer')
  end

  def question_8
    @question = "Which actor has been in the most movies on the list?"
    # (If there's a tie, any one of them is fine)

    # Your Ruby goes here.

    render('question_and_answer')
  end

  # VERY HARD
  # =========

  def question_9
    @question = "Which actor/director pair has the most movies on the list?"
    # (If there's a tie, any pair of them is fine)

    # Your Ruby goes here.

    render('question_and_answer')
  end
end
