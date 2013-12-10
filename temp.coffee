###
Created with WebStorm.
User: qcgm1978
###
"use strict"
runs ->
  flag = false
  value = 0
  setTimeout (->
    flag = true
  ), 500


#The waitsFor block takes a latch function, a failure message, and a timeout.

#The latch function polls until it returns true or the timeout expires, whichever comes first. If the timeout expires, the spec fails with the error message.
waitsFor (->
  value++
  flag
), "The Value should be incremented", 750

#Once the asynchronous conditions have been met, another runs block defines final test behavior. This is usually expectations based on state after the asynch call returns.
runs ->
  expect(value).toBeGreaterThan 0

