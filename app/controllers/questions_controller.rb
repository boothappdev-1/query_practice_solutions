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

    the_oldest_movie = Movie.order("year ASC").first

    the_director = Director.find_by({ :id => the_oldest_movie.director_id })

    @answer = the_director.name

    render('question_and_answer')
  end

  def question_3
    @question = "What is the oldest movie on the list directed by Francis Ford Coppola?"

    the_director = Director.find_by({ :name => "Francis Ford Coppola" })

    the_directors_movies = Movie.where({ :director_id => the_director.id })

    the_oldest_movie = the_directors_movies.order("year ASC").first

    @answer = the_oldest_movie.title

    render('question_and_answer')
  end

  def question_4
    @question = "What is the most recent movie on the list directed by Christopher Nolan?"

    the_director = Director.find_by({ :name => "Christopher Nolan" })

    the_directors_movies = Movie.where({ :director_id => the_director.id })

    the_latest_movie = the_directors_movies.order("year DESC").first

    @answer = the_latest_movie.title

    render('question_and_answer')
  end

  def question_5
    @question = "What is the most recent movie on the list that Harrison Ford appeared in?"

    the_actor = Actor.find_by({ :name => "Harrison Ford" })

    the_actors_roles = Role.where({ :actor_id => the_actor.id })

    # You can call the .pluck method on a collection of rows to retrieve
    #   an Array of the values for just one particular column.
    the_actors_movie_ids = the_actors_roles.pluck(:movie_id)

    # You can pass the .where method an Array of search critera. It
    #   will return to you the rows that match any of the criteria.
    the_actors_movies = Movie.where({ :id => the_actors_movie_ids })

    the_latest_movie = the_actors_movies.order("year DESC").first

    @answer = the_latest_movie.title

    render('question_and_answer')
  end

  def question_6
    @question = "Who directed the longest movie on the list?"

    the_longest_movie = Movie.order("duration DESC").first

    the_director = Director.find_by({ :id => the_longest_movie.director_id })

    @answer = the_director.name

    render('question_and_answer')
  end

  # HARDER
  # ======

  def question_7
    @question = "Which director has the most movies on the list?"
    # (If there's a tie, any one of them is fine)

    the_leader = Director.first
    the_leaders_movie_count = Movie.where({ :director_id => the_leader.id }).count

    Director.all.each do |the_director|
      the_directors_movies = Movie.where({ :director_id => the_director.id })
      if the_directors_movies.count > the_leaders_movie_count
        the_leader = the_director
        the_leaders_movie_count = the_directors_movies.count
      end
    end

    @answer = the_leader.name

    render('question_and_answer')
  end

  def question_8
    @question = "Which actor has been in the most movies on the list?"
    # (If there's a tie, any one of them is fine)

    the_leader = Actor.first
    the_leaders_role_count = Role.where({ :actor_id => the_leader.id }).count

    Actor.all.each do |the_actor|
      the_actors_roles = Role.where({ :actor_id => the_actor.id })
      if the_actors_roles.count > the_leaders_role_count
        the_leader = the_actor
        the_leaders_role_count = the_actors_roles.count
      end
    end

    @answer = the_leader.name

    render('question_and_answer')
  end

  # VERY HARD
  # =========

  def question_9
    @question = "Which actor/director pair has the most movies on the list?"
    # (If there's a tie, any pair of them is fine)

    the_leading_director = Director.first
    the_leading_actor = Actor.first
    most_movies_together = 0

    Director.all.each do |the_director|
      Actor.all.each do |the_actor|
        the_actors_roles = Role.where({ :actor_id => the_actor.id })
        the_actors_movie_ids = the_actors_roles.pluck(:movie_id)
        the_actors_movies = Movie.where({ :id => the_actors_movie_ids })
        movies_together = the_actors_movies.where({ :director_id => the_director.id })

        if movies_together.count > most_movies_together
          the_leading_director = the_director
          the_leading_actor = the_actor
          most_movies_together = movies_together.count
        end
      end
    end

    @answer = "#{the_leading_director.name}/#{the_leading_actor.name}"

    render('question_and_answer')
  end
end
