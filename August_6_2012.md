# Monday, August 6, 2012

## 10:48 AM
I got in 10 minutes ago, after getting my hair cut this morning. Going to write code to generate topic breadcrumbs for the search page ahead of time.

## 7:41 PM
Fairly productive day today. I worked on some search stuff so that can continue it's slow march towards completion. Unfortunately my code didn't make it in to stable today because I'm still waiting on the code reviews :( I then did some work to fix the timeline viewer for exercises which I wrote last summer and has become progressively more broken since. I would like to have that work done tomorrow but I'm not sure if that's realistic. One big problem is that even though we have all the data about the answers a user submitted, we don't know what question they were answering…

Let me explain that problem in a little more detail. We have a model, `ProblemLog` which holds every answer a user has submitted for a problem. Here's a simplfied version holding only the relevant fields:

    class ProblemLog(backup_model.BackupModel):
        # Stable unique identifying string for a user
        user_id = db.StringProperty()

        # The name of the exercise
        exercise = db.StringProperty()

        # Did the user get this exercise correct
        correct = db.BooleanProperty(default=False)

        # How long did the user take to finish the problem
        time_taken = db.IntegerProperty(default=0, indexed=False)

        # At what times did the user take a hint (measured from the previous answer submission)
        hint_time_taken_list = db.ListProperty(int, indexed=False)

        # This is ugly…
        # How many attempts did a user take before taking this hint
        # For instance if the user did the following:
        # hint attempt hint attempt attempt hint hint
        # then hint_after_attempt_list = [0,1,2,2]
        # It's like this because we added the hint
        hint_after_attempt_list = db.ListProperty(int, indexed=False)

        count_hints = db.IntegerProperty(default=0, indexed=False)
        hint_used = db.BooleanProperty(default=False, indexed=False)

        # Used to reproduce problems
        problem_number = db.IntegerProperty(default=-1)

        # sha1 of the file holding this exercise
        sha1 = db.StringProperty(indexed=False)

        # random seed used to generate the problem
        seed = db.StringProperty(indexed=False)

        # Some exercises have multiple types of problems
        problem_type = db.StringProperty(indexed=False)

        count_attempts = db.IntegerProperty(default=0, indexed=False)

        # Time taken between attempts (hints are ignored here because this existed before we recorded them)
        time_taken_attempts = db.ListProperty(int, indexed=False)

        # A list of the user's answers
        attempts = db.StringListProperty(indexed=False)

Seems like it should be enough information to reproduce the problem right? The problem the file holding the exercise could have changed since the user did the problem, so even given exactly the same parameters, it might generate a different problem. Luckily we keep track of that sha1, so we can tell a user when the exercise is out of date, so they might be seing the wrong information. It gets worse though - there are a ton of utility files our exercises use to render, and those could have changed in the meantime. So even if the exercise itself hasn't changed it could still be presented differently to the user… We don't keep track of those files so we have no way of knowing if they might have changed.

Possible solutions

  - Use git to always serve the version of the file the user saw. I really like this solution because it's technically cool and it will always work, no matter how old the problem is. It should also be feasible as demonstrated by [github](http://github.com/) and Khan Academy's own [sandcastle](http://sandcastle.khanacademy.org/).

  - Take the sha1 of all the files the exercise uses.

  - ?
