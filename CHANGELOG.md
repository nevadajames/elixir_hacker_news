#0.2.0
* add users/1
* change get_item/1 to item/1
* Revert methods broken by v0.1.1 and add deprecation warnings
* Add travis to run tests and credo
* Add tests for `stories/1`, `stories⁄2` and `story_ids/1`
* add stories/2
* Make async requests for stories

#0.1.1
* replaced the following with `stories/1:
  - `top_stories/1`
  - `best_stories/1`
  - `new_stories/1`
  - `job_stories/1`
  - `ask_stories/1`
  - `show_stories/1`

#0.1.0
* added methods to get best, top, ask, show, new, and job stories
* created `HackerNewsClient`