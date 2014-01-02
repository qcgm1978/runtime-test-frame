describe 'core html5 canvas - graphics, animation, and game development', ->
  it 'jasmine works', ->
    expect(describe).toBeDefined()

describe 'back cover', ->
  contents = ['draw and modify graphic', 'canvas']
  expect(Canvas?).toBeFalsy()
  expect(document.getElementsByTagName('canvas')?).toBeTruthy()
  $('<canvas></canvas>').appendTo('body')
  expect(document.getElementsByTagName('canvas')[0].getContext('2D')).toBeNull()
  context = document.getElementsByTagName('canvas')[0].getContext('2d')
  arr = ['font', 'fillStyle ', 'strokeStyle ']
  arr1 = ['fillText', 'strokeText']
  expect(typeof context[n] is 'string') for n in arr
  expect(context[n] instanceof Function).toBeTruthy() for n in arr1
  it 'define an asyn method',->
    data=null
    runs(->
      $
        .ajax('core-html-canvas/ch01/example-1.1/example.html')
        .success(
          (data)->
           data=data
        )
    )
    waitsFor (->
          true
    ) ,'',750
    runs(->
        expect( data).not.toEqual null
  #      for n in arr
  #        reg=new RegExp(n)
  #        expect(n.test(test).toEqual 'a'
    )

