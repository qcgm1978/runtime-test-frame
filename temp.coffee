runTest = ->
  if not paused and queue.length
    queue.shift()()
    resume()  unless paused
queue = []
paused = false
results = undefined
@test = (name, fn) ->
  queue.push ->
    results = document.getElementById("results")
    results = assert(true, name).appendChild(document.createElement("ul"))
    fn()

  runTest()

@pause = ->
  paused = true

@resume = ->
  paused = false
  setTimeout runTest, 1

@assert = assert = (value, desc) ->
  li = document.createElement("li")
  li.className = (if value then "pass" else "fail")
  li.appendChild document.createTextNode(desc)
  results.appendChild li
  li.parentNode.parentNode.className = "fail"  unless value
  li

test "Async Test #1", ->
  pause()
  setTimeout (->
    assert true, "First test completed"
    resume()
  ), 1000

test "Async Test #2", ->
  pause()
  setTimeout (->
    assert true, "Second test completed"
    resume()
  ), 1000

