# Review

## Basic Functionality

* Login / Signup seems like it may have a broken code path.  Check the video and
see me get to a state where I can't log in or navigate the app.  You should
definitely test a code path like this with a functional test.

* Oh, wait, I get it.  Delete means delete my account.  I think there could be
some UX help to help me not do something so dangerous without being asked
if I understand what's going on

* Basic app works well: Can createa a post, can create a comment on that post,
seems sensible

## Testing

You have quite a few pending tests.  I think there are too many of them for
this to be a "didn't get this one working."  I think your lack of test coverage
also hid some bugs from you.  Consider that in several #update methods you're
using assignment to test equivalence.  Controller testing would have caught
these bugs. See Comments#update and the fact that there is no
comments_controller_spec.rb.  Some conroller test would have been helpfule.

## Controllers

Generally really nicely written.  I think that the actions were all doing
reasonable things.

## Models

Simple ActiveRecord-backed models

## Views

Theres some complexity in the views that could be taken out.  A helper would be
great for handling your updated at.... bit of text (here's where the video ran
out).

Your use of the layout/ dir is a bit unconventional.  I think you were looking
for a better place to put shared templates, so I've put in a few comments about
that.

## Shibboleths

Do not commit your logfiles.  Ever.

    ➜  mac_overflow git:(master) ✗ git ls-files |grep log
    app/views/layouts/_login_bar.html.erb
    app/views/layouts/sessions/login.html.erb
    app/views/sessions/login.html.erb
    config/initializers/filter_parameter_logging.rb
    log/.keep  #NONONONONONONONONONONONONONONONONONONONONO
    log/development.log
    log/test.log
    ➜  mac_overflow git:(master) ✗

## Git Hygiene

Nice!  Glad to see you got the hang of it.

## Overall


