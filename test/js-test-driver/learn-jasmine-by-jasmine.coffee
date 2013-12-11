'use strict'

describe('verify working',->
    it '',->
        expect(true).toBeTruthy()
)

# the source: Secret of the javascript Ninja, The fundamentals of a test suite by John Resig
asynTest= (duration) ->
    value=0
    flag=false
# one param passed to runs
    runs (->
        flag = false
        value = 0
        setTimeout (->
            flag = true
        ), 500)


    #The waitsFor block takes a latch function, a failure message, and a timeout.

        #The latch function polls until it returns true or the timeout expires, whichever comes first. If the timeout expires, the spec fails with the error message.
    waitsForWrapper= (duration) ->
# three params passed to waitsFor
        waitsFor (->
            value++
            flag
        ),
        "The Value should be incremented", duration

    waitsForWrapper(duration)

        #Once the asynchronous conditions have been met, another runs block defines final test behavior. This is usually expectations based on state after the asynch call returns.
    runs ->
        expect(value).toBeGreaterThan 0
describe 'toEqual test suite containing several it specs',->
    it 'toEqual as test case',->
        expect(toEqual?).toBeFalsy()
        expect(expect().toEqual instanceof Function).toBeTruthy('I\'m assertion')
        expect({}).toEqual({})
    it 'the second test case for asynchronous test',->
        asynTest(750)

describe 'poll mode in asynchronous handling of jasmine',->
    it 'test runs spec',->
        expect(runs instanceof Function).toBeTruthy()
        expect(runs(->) instanceof Function).toBeFalsy()
        expect(runs(->)).toBeUndefined()
    it 'test waitsFor',->
        expect(waitsFor instanceof Function).toBeTruthy()
    it 'emulation of waitsFor',->
        isRunsComplet=false
        runsCallback=->
        # overwrite runs of jasmine
        runs=(func)->
            runsCallback=func
            func()
        verify=(func,str)->
            func.call(this,str)

# overwrite waitsFor
        waitsFor=(func,str,duration)->
            defaultPollDuration=500
            init=0
            poll=setInterval (->
                if init>= duration
                    verify(runsCallback,str)
                    clearInterval poll
                    return
                func()
                init += defaultPollDuration
            ),defaultPollDuration

        asynTest(750)

describe 'the other emulation recommanded by John Resig',->
        # code derived and converted from Secrets of Javascript Ninja, The fundamentals of a test suite by John Resig
    runTest = ->
      if not paused and queue.length
        queue.shift()()  # Removes and Execute the first element of queue
        resume()  unless paused   # if paused isnt true
    queue = []
    paused = false
    results = undefined
    @test = (name, fn) ->
      queue.push ->
        fn()

      runTest()

    @pause = ->
      paused = true

    @resume = ->
      paused = false
      setTimeout runTest, 1


    @test "Async Test", =>
      @pause()
      setTimeout (->
        expect(paused).toBeTruthy()
        @resume()
      ), 1000

