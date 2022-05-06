# getaddrinfo crash repro

This crash requires all of the following:
1. rjb loaded in an initializer (see config/initialziers/rjb.rb)
2. puma workers enabled (1 or more) (see config/puma.rb)
3. A fetch to an HTTPS server (see app/controllers/test_controller.rb)

To run it:
`bundle install && bundle exec rails server`
Then:
`http get http://localhost:5000/test/index`
(This command uses `brew install httpie`)


Result:

app/controllers/test_controller.rb:5: [BUG] Segmentation fault at 0x000000011028cad2
ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [arm64-darwin21]

-- Crash Report log information --------------------------------------------
   See Crash Report log file in one of the following locations:
     * ~/Library/Logs/DiagnosticReports
     * /Library/Logs/DiagnosticReports
   for more details.
Don't forget to include the above Crash Report log file in bug reports.

-- Control frame information -----------------------------------------------
c:0073 p:---- s:0517 e:000516 CFUNC  :getaddrinfo
c:0072 p:0018 s:0509 e:000508 METHOD app/controllers/test_controller.rb:5
