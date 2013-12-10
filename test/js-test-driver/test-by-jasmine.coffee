'use strict'
TestCase('jasmine',
    'test jasmine':->
        assertFunction describe
        assertFunction it
)
describe 'test jasmine',->
    temp={}
    result=undefined
    beforeEach(->
        temp.foo=
            method:->
        spyOn(temp.foo,'method').andReturn(745)
        result=temp.foo.method()

    )
    it 'test methods',->
        expect(true).toBe true
        expect(beforeEach).toBeDefined()
        expect(expect().toHaveBeenCalled instanceof Function).toBeTruthy()
        expect(temp.foo.method).toHaveBeenCalled()
describe "A spy, when faking a return value", ->
  foo = undefined
  bar = undefined
  fetchedBar = undefined
  beforeEach ->
    foo =
      setBar: (value) ->
        bar = value

      getBar: ->
        bar

    spyOn(foo, "getBar").andReturn 745
#    foo.setBar 123
    fetchedBar = foo.getBar()

  it "tracks that the spy was called", ->
    expect(foo.getBar).toHaveBeenCalled()

#  it "should not affect other functions", ->
#    expect(bar).toEqual 123
#
#  it "when called returns the requested value", ->
#    expect(fetchedBar).toEqual 745

describe 'js methods', ->
    func=->
        this
    it 'test bind',->
        expect(func()).toBeFalsy()
        expect(func.call(null)).toBeNull()



# '7 JavaScript Basics Many Developers Aren\'t Using (Properly)'
# JS Bin - Collaborative JavaScript Debugging http://jsbin.com/iboZAvUB/1/edit?js,output
# the original link: http://tech.pro/tutorial/1453/7-javascript-basics-many-developers-aren-t-using-properly
judgeExpression= (parameter) ->
            if !parameter
                throw new Error('error')
describe 'String.prototype.replace: /g and /i Flags', ->
    it 'match correctly when reg with i and g', ->
        reg=///a///
        regNoI=///a///g
        regNoG=///a///i
        regCorrect=///a///ig
        str='bacadA'
        isMatching = (parameter)->
            str.replace(parameter, 'd') is 'bdcddd';

        expect(judgeExpression.bind(null,isMatching(reg))).toThrow()
        expect(judgeExpression.bind(null,isMatching(regNoI))).toThrow()
        expect(judgeExpression.bind(null,isMatching(regNoG))).toThrow()
        expect(judgeExpression.bind(null,isMatching(regCorrect))).not.toThrow()

describe 'Array-Like Objects and Array.prototype.slice',->
    obj=
        a:1
        b:2
        0:'zero'
        1:'first'
    invokeSliceDirectly=->
        obj.slice()
    invokeSliceByChain=->
        arr=Array::slice.call(obj,0)
        arr
    it 'error when invoking slice directly',->
        expect(invokeSliceDirectly.bind(null)).toThrow()
    it 'apply splice method to an obj',->
        expect(invokeSliceByChain.bind(null)).not.toThrow()
        expect(invokeSliceByChain.call(null)).toEqual([])
        obj.length=2
        expect(invokeSliceByChain.call(null)).toEqual(['zero','first'])

describe 'The Array sort method is vastly underused and probably a bit more powerful than most developers believe',->
    arr=[5,1,3,9,6]
    arr1=[
        { name: "Robin Van PurseStrings", age: 30 },
        { name: "Theo Walcott", age: 24 },
        { name: "Bacary Sagna", age: 28  }
    ]
    arr2=[
        { name: "Theo Walcott", age: 24 },
        { name: "Bacary Sagna", age: 28  }
        { name: "Robin Van PurseStrings", age: 30 },
    ]
    it 'sort objects by property',->
        expect(arr.sort()).toEqual([1,3,5,6,9])
    it 'order by descending because the val of the minus would compare to 0, if < 0, [obj,obj1],or [obj1,obj]',->
        expect(arr1.sort((obj,obj1)->
            obj.age-obj1.age

        )).toEqual(arr2)

describe 'Array Length for Truncation',->
    arr1=[]
    arr2=[]
    it 'array or obj aren\'t recommended assignments like this',->
        arr1 = arr2 = [1, 2, 3]
        expect(arr1).toEqual(arr2)
    it 'it creates a new array instead of changing the reference of the original, so "arr2" is still [1, 2, 3]',->
        arr1 = [];
        expect(judgeExpression.bind(null,arr2.length is 0)).toThrow()
        expect(arr2).toEqual([1,2,3])
        arr1 = arr2 = [1, 2, 3]
    it 'The right way, assignment keeping reference',->
        arr1.length = 0
        expect(judgeExpression.bind(null,arr2.length is 0)).not.toThrow()
        expect(arr2).toEqual([])

describe 'Array Merging with push',->
    mergeTo = [4,5,6]
    mergeFrom = [7,8,9];
    it 'array merging',->
        Array.prototype.push.apply(mergeTo, mergeFrom);
        expect(mergeTo).toEqual( [4, 5, 6, 7, 8, 9])
    arr1 = [4,5,6]
    arr2 = [7,8,9]
    it 'array merging by coffeescript loop',->
        expect(arr1).toEqual([4,5,6])
        arr1.push i for i in mergeFrom
        expect(arr1).toEqual( [4, 5, 6, 7, 8, 9])

describe 'Efficient Feature/Object Property Detection',->
    geo = 'geolocation' in navigator
    geo1= 'geolocation' of navigator
    it 'In the past, the snippet caused memory leaks in some browsers',->
        expect(judgeExpression.bind(null,navigator.geolocation)).not.toThrow()
    it 'coffeescript uses of to check prop in obj',->
        expect(judgeExpression.bind(null,geo)).toThrow()
        expect(judgeExpression.bind(null,geo1)).not.toThrow()

describe 'Event preventDefault and stopPropagation',->
    body=document.body
    bool=false
    docBool=false
    triggerStop=(e)->
        e.stopPropagation()
        bool=true
    triggerPrevent=(e)->
        e.preventDefault?()
        bool=true
    boolReset=->
        bool=false
        docBool=false
    it 'capturing browser means you can get the document',->
        expect(body).toBeDefined()
        expect(body.onclick).toBeDefined()
        body.onclick= (e)->
            bool=true
        document.onclick=(e)->
            docBool=true
    it 'stopping the event is that not only does it prevent the default action, but it stops propagation of the event',->
        expect(body.click).toBeDefined()
        expect(body.click instanceof Function).toBeTruthy()
        body.click()
        expect(bool).toBeTruthy()
        expect(docBool).toBeTruthy('bubble')
        boolReset()
        expect(bool).toBeFalsy()
        expect(docBool).toBeFalsy()
        body.onclick=triggerStop
        body.click()
        expect(bool).toBeTruthy()
        expect(docBool).toBeFalsy('no bubble')
        boolReset()
        body.onclick=triggerPrevent
        body.click()
        expect(bool).toBeTruthy()
        expect(docBool).toBeTruthy('bubble')









































